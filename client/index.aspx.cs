using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default : System.Web.UI.Page
{
    // ✅ FIX 1: correct connection string name
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategories();
            LoadRestaurants();
        }
    }

    void LoadCategories()
    {
        using (SqlDataAdapter da = new SqlDataAdapter(
            "SELECT GlobalCategoryID, CategoryName, CategoryImage FROM GlobalCategories WHERE IsActive = 1",
            cs))
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptCategories.DataSource = dt;
            rptCategories.DataBind();
        }
    }

    void LoadRestaurants()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string sql = @"
                SELECT
                    RestaurantID,
                    RestaurantName,
                    Address,
                    Logo,
                    ISNULL(AvgRating, 0) AS AvgRating,
                    ISNULL(CostForTwo, 0) AS CostForTwo
                FROM VendorRestaurants
                WHERE IsActive = 1
                ORDER BY CreatedAt DESC";

            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptRestaurants.DataSource = dt;
            rptRestaurants.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            // ✅ FIX 2: removed semicolon + clean SQL
            string sql = @"
                SELECT
                    RestaurantID,
                    RestaurantName,
                    Address,
                    Logo,
                    ISNULL(AvgRating, 0) AS AvgRating,
                    ISNULL(CostForTwo, 0) AS CostForTwo
                FROM VendorRestaurants
                WHERE IsActive = 1
                  AND (
                        RestaurantName LIKE @Search
                     OR Address LIKE @Search
                     OR City LIKE @Search
                  )
                ORDER BY RestaurantName";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptRestaurants.DataSource = dt;
            rptRestaurants.DataBind();
        }
    }
}
