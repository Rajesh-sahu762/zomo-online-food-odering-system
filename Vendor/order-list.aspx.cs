using System;
using System.Data;
using System.Data.SqlClient;

public partial class Vendor_Default : System.Web.UI.Page
{
    string cs = System.Configuration.ConfigurationManager
                .ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Vendor protection
        if (Session["VendorID"] == null)
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
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT DISTINCT
                O.OrderID,
                O.OrderID AS OrderCode,
                O.CreatedAt AS OrderDate,
                O.PaymentMode AS PaymentMethod,
                O.OrderStatus AS DeliveryStatus,
                O.TotalAmount AS Amount,
                F.MainImage
            FROM Orders O
            INNER JOIN OrderItems I ON O.OrderID = I.OrderID
            INNER JOIN FoodItems F ON I.FoodItemID = F.FoodID
            WHERE O.RestaurantID = @vid
            ORDER BY O.OrderID DESC
        ", cs);

        da.SelectCommand.Parameters.AddWithValue("@vid", vendorId);

        DataTable dt = new DataTable();
        da.Fill(dt);

        RepeaterOrders.DataSource = dt;
        RepeaterOrders.DataBind();
    }

    // ❌ Vendor should NOT delete orders
    protected void DeleteOrder(object sender, EventArgs e)
    {
        // intentionally disabled
    }
}
