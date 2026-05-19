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

    public int OrderID;
    public string OrderStatus = "";
    public string RestaurantName = "";
    public string CustomerName = "";
    public string CustomerEmail = "";
    public string FullAddress = "";
    public decimal TotalAmount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Admin security
        if (Session["AdminID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (Request.QueryString["oid"] == null)
        {
            Response.Redirect("orders.aspx");
            return;
        }

        OrderID = Convert.ToInt32(Request.QueryString["oid"]);

        if (!IsPostBack)
        {
            LoadOrder();
            LoadItems();
        }
    }

    // =========================
    // ORDER MAIN INFO
    // =========================
    void LoadOrder()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    O.OrderStatus,
                    O.TotalAmount,

                    R.RestaurantName,

                    U.FullName,
                    U.Email,

                    A.FullAddress
                FROM Orders O
                INNER JOIN VendorRestaurants R ON O.RestaurantID = R.RestaurantID
                INNER JOIN Users U ON O.UserID = U.UserID
                INNER JOIN UserAddresses A ON O.AddressID = A.AddressID
                WHERE O.OrderID = @oid
            ", con);

            cmd.Parameters.AddWithValue("@oid", OrderID);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                OrderStatus = dr["OrderStatus"].ToString();
                TotalAmount = Convert.ToDecimal(dr["TotalAmount"]);
                RestaurantName = dr["RestaurantName"].ToString();
                CustomerName = dr["FullName"].ToString();
                CustomerEmail = dr["Email"].ToString();
                FullAddress = dr["FullAddress"].ToString();
            }
        }
    }

    // =========================
    // ORDER ITEMS
    // =========================
    void LoadItems()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT
                    ItemName,
                    Quantity,
                    Price,
                    (Quantity * Price) AS Total
                FROM OrderItems
                WHERE OrderID = @oid
            ", con);

            da.SelectCommand.Parameters.AddWithValue("@oid", OrderID);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptItems.DataSource = dt;
            rptItems.DataBind();
        }
    }
}