using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web;


public partial class client_cart : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCartPage();
        }
    }

    void LoadCartPage()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string sql = @"
                SELECT 
                    C.CartID,
                    C.ItemName,
                    C.Price,
                    C.Quantity,
                    (C.Price * C.Quantity) AS Total,
                    F.MainImage
                FROM Cart C
                INNER JOIN FoodItems F ON C.FoodItemID = F.FoodID
                WHERE C.SessionID = @sid";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@sid", Session.SessionID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCartPage.DataSource = dt;
            rptCartPage.DataBind();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object UpdateQuantity(int cartId, int change)
    {
        string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;
        int qty = 1;
        int price = 0;
        int cartCount = 0;
        decimal cartTotal = 0;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // update qty (min 1)
            SqlCommand up = new SqlCommand(@"
            UPDATE Cart
            SET Quantity = Quantity + @c
            WHERE CartID=@id AND Quantity + @c >= 1", con);

            up.Parameters.AddWithValue("@c", change);
            up.Parameters.AddWithValue("@id", cartId);
            up.ExecuteNonQuery();

            // get updated row
            SqlCommand get = new SqlCommand(
                "SELECT Quantity, Price FROM Cart WHERE CartID=@id", con);
            get.Parameters.AddWithValue("@id", cartId);

            SqlDataReader dr = get.ExecuteReader();
            if (dr.Read())
            {
                qty = Convert.ToInt32(dr["Quantity"]);
                price = Convert.ToInt32(dr["Price"]);
            }
            dr.Close();

            // cart summary
            SqlCommand sum = new SqlCommand(@"
            SELECT COUNT(*), ISNULL(SUM(Price*Quantity),0)
            FROM Cart WHERE SessionID=@sid", con);

            sum.Parameters.AddWithValue("@sid", HttpContext.Current.Session.SessionID);
            SqlDataReader sdr = sum.ExecuteReader();
            if (sdr.Read())
            {
                cartCount = Convert.ToInt32(sdr[0]);
                cartTotal = Convert.ToDecimal(sdr[1]);
            }
            sdr.Close();
        }

        return new
        {
            success = true,
            qty = qty,
            itemTotal = qty * price,
            cartCount = cartCount,
            cartTotal = cartTotal
        };
    }



    protected void RemoveFromCart(object sender, CommandEventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Cart WHERE CartID=@id AND SessionID=@sid", con);

            cmd.Parameters.AddWithValue("@id", e.CommandArgument);
            cmd.Parameters.AddWithValue("@sid", Session.SessionID);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        LoadCartPage();
    }
}
