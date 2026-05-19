using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class client_MasterPage : System.Web.UI.MasterPage
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    public string UserName = "Guest";
    public string UserImage = "assets/images/icons/p5.png";
    public string LocationName = "Location";
    public int CartCount = 0;
    public decimal CartTotal = 0;
    public bool IsLoggedIn = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 LOGIN CHECK
        if (Session["UserID"] != null)
        {
            IsLoggedIn = true;
            LoadUser();
        }

        if (Session["Location"] != null)
            LocationName = Session["Location"].ToString();

        if (!IsPostBack)
        {
            LoadCart();
        }
    }

    void LoadUser()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT FullName, ProfileImage
                FROM Users
                WHERE UserID = @uid", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                UserName = dr["FullName"].ToString();

                if (dr["ProfileImage"] != DBNull.Value && dr["ProfileImage"].ToString() != "")
                    UserImage = "assets/images/users/" + dr["ProfileImage"];
            }
        }
    }

    void LoadCart()
    {
        CartCount = 0;
        CartTotal = 0;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    C.CartID,
                    C.ItemName,
                    C.Price,
                    C.Quantity,
                    (C.Price * C.Quantity) AS Total,
                    F.MainImage
                FROM Cart C
                INNER JOIN FoodItems F ON C.FoodItemID = F.FoodID
                WHERE C.SessionID = @sid", con);

            cmd.Parameters.AddWithValue("@sid", Session.SessionID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCart.DataSource = dt;
            rptCart.DataBind();

            CartCount = dt.Rows.Count;

            foreach (DataRow r in dt.Rows)
                CartTotal += Convert.ToDecimal(r["Total"]);
        }
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

        LoadCart();
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("signin.aspx");
    }
}
