using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default3 : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadRestaurants();
        }
    }

    void LoadRestaurants()
    {
        int catId = 0;
        if (Request.QueryString["cat"] != null)
            int.TryParse(Request.QueryString["cat"], out catId);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (catId > 0)
            {
                cmd.CommandText = @"
                    SELECT DISTINCT
                        R.VendorID,
                        R.RestaurantID,      
                        R.RestaurantName,
                        R.Address,
                        R.Logo,
                        ISNULL(R.AvgRating,0) AS AvgRating,
                        ISNULL(R.CostForTwo,0) AS CostForTwo
                    FROM VendorRestaurants R
INNER JOIN FoodItems F ON R.RestaurantID = F.RestaurantID
INNER JOIN VendorFoodCategory VC ON F.CategoryID = VC.CategoryID
                    WHERE R.IsActive = 1
                      AND VC.GlobalCategoryID = @catId
                ";

                cmd.Parameters.Add("@catId", SqlDbType.Int).Value = catId;

                SqlCommand catCmd = new SqlCommand(
                    "SELECT CategoryName FROM GlobalCategories WHERE GlobalCategoryID=@id",
                    con);
                catCmd.Parameters.Add("@id", SqlDbType.Int).Value = catId;

                con.Open();
                object name = catCmd.ExecuteScalar();
                con.Close();

                litCategoryName.Text = name != null ? name.ToString() : "Restaurants";
            }
            else
            {
                cmd.CommandText = @"
                    SELECT
                        VendorID,
                        RestaurantName,
                        Address,
                        Logo,
                        ISNULL(AvgRating,0) AS AvgRating,
                        ISNULL(CostForTwo,0) AS CostForTwo
                    FROM VendorRestaurants
                    WHERE IsActive = 1
                ";

                litCategoryName.Text = "All Restaurants";
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptRestaurants.DataSource = dt;
            rptRestaurants.DataBind();
        }
    }
}
