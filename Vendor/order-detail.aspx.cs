using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Vendor_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    int orderId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VendorID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (Request.QueryString["orderID"] == null)
        {
            Response.Redirect("order-list.aspx");
            return;
        }

        orderId = Convert.ToInt32(Request.QueryString["orderID"]);

        if (!IsPostBack)
        {
            LoadItems();
            LoadTotal();
        }
    }

    void LoadItems()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT ItemName, Quantity, Total
                FROM OrderItems
                WHERE OrderID=@oid", con);

            da.SelectCommand.Parameters.AddWithValue("@oid", orderId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrderItems.DataSource = dt;
            rptOrderItems.DataBind();
        }
    }

    void LoadTotal()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT TotalAmount FROM Orders WHERE OrderID=@id", con);

            cmd.Parameters.AddWithValue("@id", orderId);

            con.Open();
            lblTotal.Text = cmd.ExecuteScalar().ToString();
        }
    }

    protected void btnUpdateStatus_Click(object sender, EventArgs e)
    {
        string status = ddlStatus.SelectedValue;
        int orderId = Convert.ToInt32(Request.QueryString["orderID"]);

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 1️⃣ Update order status
            SqlCommand cmd = new SqlCommand(
                "UPDATE Orders SET OrderStatus=@st WHERE OrderID=@id", con);

            cmd.Parameters.AddWithValue("@st", status);
            cmd.Parameters.AddWithValue("@id", orderId);
            cmd.ExecuteNonQuery();

            // 2️⃣ Insert tracking history
            SqlCommand track = new SqlCommand(
                @"INSERT INTO OrderTracking 
              (OrderID, Description, Location)
              VALUES (@oid, @desc, @loc)", con);

            track.Parameters.AddWithValue("@oid", orderId);
            track.Parameters.AddWithValue("@desc", "Order " + status);
            track.Parameters.AddWithValue("@loc", "Restaurant");
            track.ExecuteNonQuery();
        }

        // 3️⃣ Redirect to tracking page
        Response.Redirect("order-tracking.aspx?orderID=" + orderId);
    }

}
