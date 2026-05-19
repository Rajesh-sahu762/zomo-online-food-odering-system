using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // login hone par sirf text hide
            if (Session["UserID"] != null)
                divAccountText.Visible = false;

            LoadCheckout();
        }
    }

    void LoadCheckout()
    {
        decimal subTotal = 0;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    ItemName,
                    Price,
                    Quantity,
                    (Price * Quantity) AS Total
                FROM Cart
                WHERE SessionID = @sid
            ", con);

            cmd.Parameters.AddWithValue("@sid", Session.SessionID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCheckoutItems.DataSource = dt;
            rptCheckoutItems.DataBind();

            foreach (DataRow r in dt.Rows)
                subTotal += Convert.ToDecimal(r["Total"]);
        }

        lblSubTotal.InnerText = "₹ " + subTotal.ToString("0");
        lblGrandTotal.InnerText = "₹ " + subTotal.ToString("0"); // no delivery/discount yet
    }
}
