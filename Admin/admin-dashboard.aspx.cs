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
    string conStr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStats();
            LoadLatestOrders();
        }
    }

    void LoadStats()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();

            // Total Vendors
            SqlCommand cmd1 = new SqlCommand(
                "SELECT COUNT(*) FROM VendorUsers", con);
            lblTotalVendors.Text = cmd1.ExecuteScalar().ToString();

            // Approved Vendors
            SqlCommand cmd2 = new SqlCommand(
                "SELECT COUNT(*) FROM VendorUsers WHERE IsApproved = 1", con);
            lblApprovedVendors.Text = cmd2.ExecuteScalar().ToString();

            // Total Orders
            SqlCommand cmd3 = new SqlCommand(
                "SELECT COUNT(*) FROM Orders", con);
            lblOrders.Text = cmd3.ExecuteScalar().ToString();

            // Total Sales
            SqlCommand cmd4 = new SqlCommand(
                "SELECT ISNULL(SUM(TotalAmount),0) FROM Orders", con);
            lblSales.Text = Convert.ToDecimal(cmd4.ExecuteScalar()).ToString("0.00");
        }
    }


    void LoadLatestOrders()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT TOP 10
                O.OrderID AS OrderCode,
                V.Email AS VendorEmail,
                O.TotalAmount AS Amount,
                O.OrderStatus AS DeliveryStatus,
                O.CreatedAt AS OrderDate
            FROM Orders O
            INNER JOIN VendorUsers V ON O.RestaurantID = V.VendorID
            ORDER BY O.OrderID DESC
        ", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrders.DataSource = dt;
            rptOrders.DataBind();
        }
    }


}