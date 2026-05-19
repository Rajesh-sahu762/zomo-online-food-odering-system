using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProfile(); 
            LoadMyOrders();
        }
    }

    public string UserName = "";
    public string UserEmail = "";
    public string UserImage = "assets/images/icons/p5.png"; // default

    void LoadProfile()
    {
        if (Session["UserID"] == null)
            return;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
            SELECT FullName, Email, ProfileImage
            FROM Users
            WHERE UserID = @uid
        ", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                UserName = dr["FullName"].ToString();
                UserEmail = dr["Email"].ToString();

                if (dr["ProfileImage"] != DBNull.Value &&
                    dr["ProfileImage"].ToString() != "")
                {
                    UserImage = "assets/images/users/" + dr["ProfileImage"];
                }
            }
        }
    }


    void LoadMyOrders()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    O.OrderID,
                    O.TotalAmount,
                    O.OrderStatus,
                    O.CreatedAt,
                    R.RestaurantName
                FROM Orders O
                INNER JOIN VendorRestaurants R 
                    ON O.RestaurantID = R.RestaurantID
                WHERE 
                    (O.UserID = @uid OR (@uid IS NULL AND O.SessionID = @sid))
                ORDER BY O.OrderID DESC
            ", con);

            cmd.Parameters.AddWithValue("@uid",
                Session["UserID"] == null ? (object)DBNull.Value : Session["UserID"]);
            cmd.Parameters.AddWithValue("@sid", Session.SessionID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrders.DataSource = dt;
            rptOrders.DataBind();
        }
    }
}
