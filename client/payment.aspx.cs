using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    public decimal GrandTotal = 0;
    public string AddressTitle = "";
    public string FullAddress = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null || Session["SelectedAddressID"] == null)
        {
            Response.Redirect("cart.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadAddress();
            LoadOrderSummary();
        }
    }

    void LoadAddress()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT Title, FullAddress
                FROM UserAddresses
                WHERE AddressID=@id", con);

            cmd.Parameters.AddWithValue("@id", Session["SelectedAddressID"]);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                AddressTitle = dr["Title"].ToString();
                FullAddress = dr["FullAddress"].ToString();
            }
        }
    }

    void LoadOrderSummary()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT 
                    ItemName,
                    Quantity,
                    (Price * Quantity) AS Total
                FROM Cart
                WHERE SessionID=@sid", con);

            da.SelectCommand.Parameters.AddWithValue("@sid", Session.SessionID);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrderSummary.DataSource = dt;
            rptOrderSummary.DataBind();

            foreach (DataRow r in dt.Rows)
                GrandTotal += Convert.ToDecimal(r["Total"]);
        }
    }

    protected void PlaceOrder_Click(object sender, EventArgs e)
    {
        int orderId = 0;
        decimal finalTotal = 0;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 1️⃣ GET RESTAURANT ID
            SqlCommand restCmd = new SqlCommand(@"
            SELECT TOP 1 RestaurantID
            FROM Cart
            WHERE SessionID = @sid", con);

            restCmd.Parameters.AddWithValue("@sid", Session.SessionID);
            int restaurantId = Convert.ToInt32(restCmd.ExecuteScalar());

            // 2️⃣ INSERT ORDER (TEMP TOTAL = 0)
            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO Orders
            (SessionID, UserID, RestaurantID, AddressID, TotalAmount, PaymentMode, OrderStatus)
            VALUES
            (@sid, @uid, @rid, @aid, 0, 'COD', 'Placed');
            SELECT CAST(SCOPE_IDENTITY() AS INT);", con);

            cmd.Parameters.AddWithValue("@sid", Session.SessionID);
            cmd.Parameters.AddWithValue("@uid",
                Session["UserID"] == null ? (object)DBNull.Value : Session["UserID"]);
            cmd.Parameters.AddWithValue("@rid", restaurantId);
            cmd.Parameters.AddWithValue("@aid", Session["SelectedAddressID"]);

            orderId = Convert.ToInt32(cmd.ExecuteScalar());

            // 3️⃣ INSERT ORDER ITEMS
            SqlCommand items = new SqlCommand(@"
            INSERT INTO OrderItems
            (OrderID, FoodItemID, ItemName, Price, Quantity, Total)
            SELECT
                @oid,
                FoodItemID,
                ItemName,
                Price,
                Quantity,
                (Price * Quantity)
            FROM Cart
            WHERE SessionID = @sid", con);

            items.Parameters.AddWithValue("@oid", orderId);
            items.Parameters.AddWithValue("@sid", Session.SessionID);
            items.ExecuteNonQuery();

            // 4️⃣ CALCULATE FINAL TOTAL FROM ORDER ITEMS 🔥
            SqlCommand totalCmd = new SqlCommand(@"
            SELECT ISNULL(SUM(Total), 0)
            FROM OrderItems
            WHERE OrderID = @oid", con);

            totalCmd.Parameters.AddWithValue("@oid", orderId);
            finalTotal = Convert.ToDecimal(totalCmd.ExecuteScalar());

            // 5️⃣ UPDATE ORDERS TOTAL
            SqlCommand update = new SqlCommand(@"
            UPDATE Orders
            SET TotalAmount = @t
            WHERE OrderID = @oid", con);

            update.Parameters.AddWithValue("@t", finalTotal);
            update.Parameters.AddWithValue("@oid", orderId);
            update.ExecuteNonQuery();

            // 6️⃣ CLEAR CART
            SqlCommand clear = new SqlCommand(
                "DELETE FROM Cart WHERE SessionID = @sid", con);
            clear.Parameters.AddWithValue("@sid", Session.SessionID);
            clear.ExecuteNonQuery();
        }

        Response.Redirect("confirm-order.aspx?oid=" + orderId);
    }


}
