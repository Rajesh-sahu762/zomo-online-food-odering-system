using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Admin security
        if (Session["AdminID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadOrders();
        }
    }

    void LoadOrders()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    O.OrderID,
                    O.TotalAmount,
                    O.OrderStatus,
                    O.CreatedAt,

                    R.RestaurantName,

                    U.FullName,
                    U.Email
                FROM Orders O
                INNER JOIN VendorRestaurants R ON O.RestaurantID = R.RestaurantID
                INNER JOIN Users U ON O.UserID = U.UserID
                ORDER BY O.CreatedAt DESC
            ", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrders.DataSource = dt;
            rptOrders.DataBind();
        }
    }
}