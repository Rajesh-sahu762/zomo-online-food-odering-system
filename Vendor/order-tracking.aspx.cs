using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Vendor_OrderTracking : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

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

        if (!IsPostBack)
        {
            int orderId = Convert.ToInt32(Request.QueryString["orderID"]);
            LoadOrder(orderId);
            LoadTracking(orderId);
        }
    }

    // 🔹 ORDER BASIC INFO + PROGRESS
    void LoadOrder(int orderId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT OrderStatus, CreatedAt FROM Orders WHERE OrderID=@id", con);

            cmd.Parameters.AddWithValue("@id", orderId);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblOrderID.Text = orderId.ToString();
                lblOrderDate.Text = Convert.ToDateTime(dr["CreatedAt"])
                                        .ToString("dd MMM yyyy hh:mm tt");

                ApplyProgress(dr["OrderStatus"].ToString());
            }
        }
    }

    // 🔹 PROGRESS LOGIC
    void ApplyProgress(string status)
    {
        if (status == "Placed")
            stepPlaced.Attributes["class"] = "progtrckr-done";

        if (status == "Preparing")
        {
            stepPlaced.Attributes["class"] = "progtrckr-done";
            stepPreparing.Attributes["class"] = "progtrckr-done";
        }

        if (status == "Out for Delivery")
        {
            stepPlaced.Attributes["class"] = "progtrckr-done";
            stepPreparing.Attributes["class"] = "progtrckr-done";
            stepOut.Attributes["class"] = "progtrckr-done";
        }

        if (status == "Delivered")
        {
            stepPlaced.Attributes["class"] = "progtrckr-done";
            stepPreparing.Attributes["class"] = "progtrckr-done";
            stepOut.Attributes["class"] = "progtrckr-done";
            stepDelivered.Attributes["class"] = "progtrckr-done";
        }
    }

    // 🔹 TRACKING HISTORY
    void LoadTracking(int orderId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT
                    CONVERT(VARCHAR, CreatedAt, 105) AS Date,
                    CONVERT(VARCHAR, CreatedAt, 108) AS Time,
                    Description,
                    Location
                FROM OrderTracking
                WHERE OrderID=@id
                ORDER BY CreatedAt DESC", con);

            da.SelectCommand.Parameters.AddWithValue("@id", orderId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptTrack.DataSource = dt;
            rptTrack.DataBind();
        }
    }
}
