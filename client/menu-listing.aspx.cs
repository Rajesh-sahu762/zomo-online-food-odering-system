using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class client_Default : System.Web.UI.Page
{
   string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

   int restaurantId = 0;
   int categoryId = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
            Response.Redirect("index.aspx");

        restaurantId = Convert.ToInt32(Request.QueryString["id"]);


        if (Request.QueryString["cat"] != null)
            int.TryParse(Request.QueryString["cat"], out categoryId);

        if (!IsPostBack)
        {
            LoadRestaurant();
            LoadCategories();
            LoadProducts();
        }
    }

    // ==========================
    // RESTAURANT NAME
    // ==========================
    void LoadRestaurant()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
     "SELECT RestaurantName FROM VendorRestaurants WHERE RestaurantID=@rid",
     con);
            cmd.Parameters.AddWithValue("@rid", restaurantId);


            con.Open();
            object name = cmd.ExecuteScalar();
            con.Close();

            litRestaurantName.Text = name != null ? name.ToString() : "Menu";
        }
    }

    protected void AddToCart(object sender, CommandEventArgs e)
    {
        int foodId = Convert.ToInt32(e.CommandArgument);
        string sessionId = Session.SessionID;

        using (SqlConnection con = new SqlConnection(cs))
        {
            // 🔍 Food details
            SqlCommand foodCmd = new SqlCommand(@"
SELECT FoodID, FoodName, Price, RestaurantID
FROM FoodItems
WHERE FoodID=@id
", con);

            foodCmd.Parameters.AddWithValue("@id", foodId);

            con.Open();
            SqlDataReader dr = foodCmd.ExecuteReader();

            if (!dr.Read())
            {
                con.Close();
                return;
            }

            string itemName = dr["FoodName"].ToString();
            int price = Convert.ToInt32(dr["Price"]);
            int restaurantId = Convert.ToInt32(dr["RestaurantID"]);

            dr.Close();

            // 🔍 Same item already in cart?
            SqlCommand check = new SqlCommand(@"
SELECT CartID, Quantity
FROM Cart
WHERE SessionID=@sid AND FoodItemID=@fid", con);

            check.Parameters.AddWithValue("@sid", sessionId);
            check.Parameters.AddWithValue("@fid", foodId);

            SqlDataReader dr2 = check.ExecuteReader();

            if (dr2.Read())
            {
                int cartId = Convert.ToInt32(dr2["CartID"]);
                dr2.Close();

                SqlCommand upd = new SqlCommand(
                    "UPDATE Cart SET Quantity = Quantity + 1 WHERE CartID=@cid", con);
                upd.Parameters.AddWithValue("@cid", cartId);
                upd.ExecuteNonQuery();
            }
            else
            {
                dr2.Close();

                SqlCommand ins = new SqlCommand(@"
INSERT INTO Cart
(SessionID, RestaurantID, FoodItemID, ItemName, Price, Quantity)
VALUES
(@sid, @rid, @fid, @name, @price, 1)", con);

                ins.Parameters.AddWithValue("@sid", sessionId);
                ins.Parameters.AddWithValue("@rid", restaurantId);
                // 🔥 important
                ins.Parameters.AddWithValue("@fid", foodId);
                ins.Parameters.AddWithValue("@name", itemName);
                ins.Parameters.AddWithValue("@price", price);

                ins.ExecuteNonQuery();
            }
        }

        Response.Redirect("cart.aspx");
    }



    // ==========================
    // CATEGORY LIST
    // ==========================
    void LoadCategories()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT CategoryID, CategoryName
                FROM VendorFoodCategory
                WHERE RestaurantID=@rid AND IsActive=1

            ", con);

            cmd.Parameters.AddWithValue("@rid", restaurantId);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCategories.DataSource = dt;
            rptCategories.DataBind();
        }
    }

    // ==========================
    // PRODUCTS
    // ==========================
    void LoadProducts()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (categoryId > 0)
            {
                cmd.CommandText = @"
        SELECT *
        FROM FoodItems
        WHERE RestaurantID=@rid
          AND CategoryID=@c
          AND IsAvailable=1";
                cmd.Parameters.AddWithValue("@c", categoryId);
            }
            else
            {
                cmd.CommandText = @"
        SELECT *
        FROM FoodItems
        WHERE RestaurantID=@rid
          AND IsAvailable=1";
            }

            cmd.Parameters.AddWithValue("@rid", restaurantId);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptProducts.DataSource = dt;
            rptProducts.DataBind();
        }
    }
}