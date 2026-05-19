using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;
    public decimal SubTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("signin.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadAddresses();
            LoadCartSummary(); // 🔥 NEW
        }
    }



    void LoadCartSummary()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT 
                ItemName,
                Price,
                Quantity,
                (Price * Quantity) AS Total
            FROM Cart
            WHERE SessionID = @sid
        ", con);

            da.SelectCommand.Parameters.AddWithValue("@sid", Session.SessionID);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCart.DataSource = dt;
            rptCart.DataBind();

            foreach (DataRow r in dt.Rows)
            {
                SubTotal += Convert.ToDecimal(r["Total"]);
            }
        }
    }



    void LoadAddresses()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT AddressID, Title, FullAddress, Phone
                FROM UserAddresses
                WHERE UserID = @uid
                ORDER BY CreatedAt DESC", con);

            da.SelectCommand.Parameters.AddWithValue("@uid", Session["UserID"]);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAddress.DataSource = dt;
            rptAddress.DataBind();
        }
    }

    protected void SaveAddress_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO UserAddresses
                (UserID, Title, FullAddress, Phone)
                VALUES
                (@uid, @t, @a, @p)", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
            cmd.Parameters.AddWithValue("@t", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@a", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtPhone.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
        }

        txtTitle.Text = "";
        txtAddress.Text = "";
        txtPhone.Text = "";

        LoadAddresses();
    }

    protected void SelectAddress(object sender, CommandEventArgs e)
    {
        Session["SelectedAddressID"] = e.CommandArgument.ToString();
        Response.Redirect("payment.aspx");
    }
}
