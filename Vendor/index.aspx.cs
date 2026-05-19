using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Vendor security (SAFE)
        if (Session["VendorID"] == null || Session["RestaurantID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadCards();
            LoadOrders();
            LoadTrending();
        }
    }

    /* ================= DASHBOARD CARDS ================= */

    void LoadCards()
    {
        int restaurantId = Convert.ToInt32(Session["RestaurantID"]);

        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT ISNULL(SUM(TotalAmount),0)
                FROM Orders
                WHERE RestaurantID=@rid", con);

            cmd.Parameters.AddWithValue("@rid", restaurantId);

            con.Open();
            decimal sale = Convert.ToDecimal(cmd.ExecuteScalar());

            lblTotalSale.InnerText = "₹" + sale.ToString("0.00");

            // simple assumed profit (30%)
            lblTotalProfit.InnerText = "₹" + (sale * 0.30M).ToString("0.00");

            // customer rate dummy (UI ke liye)
            lblCustomerRate.InnerText = "4.5";
        }
    }

    /* ================= RECENT ORDERS ================= */

    void LoadOrders()
    {
        int restaurantId = Convert.ToInt32(Session["RestaurantID"]);

        SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT TOP 10
                O.OrderID,
                O.CreatedAt AS OrderDate,
                O.TotalAmount,
                O.OrderStatus,
                I.ItemName AS FoodName,
                F.MainImage,
                'Customer' AS CustomerName
            FROM Orders O
            INNER JOIN OrderItems I ON O.OrderID = I.OrderID
            INNER JOIN FoodItems F ON I.FoodItemID = F.FoodID
            WHERE O.RestaurantID=@rid
            ORDER BY O.OrderID DESC", constr);

        da.SelectCommand.Parameters.AddWithValue("@rid", restaurantId);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptOrders.DataSource = dt;
        rptOrders.DataBind();
    }

    /* ================= TRENDING FOODS ================= */

    void LoadTrending()
    {
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT TOP 5
            FoodName,
            ISNULL(OfferPrice, Price) AS OfferPrice,
            MainImage
        FROM FoodItems
        WHERE VendorID=@vid
        ORDER BY NEWID()", constr);

        da.SelectCommand.Parameters.AddWithValue("@vid", vendorId);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptTrending.DataSource = dt;
        rptTrending.DataBind();
    }

}
