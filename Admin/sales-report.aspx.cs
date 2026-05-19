using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    public int TotalOrders = 0;
    public int CompletedOrders = 0;
    public decimal TotalSales = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Admin security
        if (Session["AdminID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadSales(null, null);
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        DateTime? from = string.IsNullOrEmpty(txtFrom.Text)
            ? (DateTime?)null
            : Convert.ToDateTime(txtFrom.Text);

        DateTime? to = string.IsNullOrEmpty(txtTo.Text)
            ? (DateTime?)null
            : Convert.ToDateTime(txtTo.Text);

        LoadSales(from, to);
    }

    // ==========================
    // LOAD SALES
    // ==========================
    void LoadSales(DateTime? from, DateTime? to)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    O.OrderID,
                    O.CreatedAt,
                    O.OrderStatus,
                    O.TotalAmount,

                    R.RestaurantName,
                    U.FullName AS CustomerName
                FROM Orders O
                INNER JOIN VendorRestaurants R ON O.RestaurantID = R.RestaurantID
                INNER JOIN Users U ON O.UserID = U.UserID
                WHERE O.OrderStatus = 'Delivered'
                  AND (@from IS NULL OR O.CreatedAt >= @from)
                  AND (@to IS NULL OR O.CreatedAt <= @to)
                ORDER BY O.CreatedAt DESC
            ", con);

            cmd.Parameters.AddWithValue("@from", (object)from ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@to", (object)to ?? DBNull.Value);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptSales.DataSource = dt;
            rptSales.DataBind();

            // 📊 SUMMARY
            TotalOrders = dt.Rows.Count;
            CompletedOrders = dt.Rows.Count;

            object sum = dt.Compute("SUM(TotalAmount)", "");
            TotalSales = sum == DBNull.Value ? 0 : Convert.ToDecimal(sum);
        }
    }
}