using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    public int OrderID = 0;
    public string AddressTitle = "";
    public string FullAddress = "";
    public decimal GrandTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["oid"] == null)
        {
            Response.Redirect("index.aspx");
            return;
        }

        OrderID = Convert.ToInt32(Request.QueryString["oid"]);

        if (!IsPostBack)
        {
            LoadOrder();
            LoadItems();
        }
    }

    // =========================
    // LOAD ORDER (ADDRESS + TOTAL)
    // =========================
    void LoadOrder()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    O.TotalAmount,
                    A.Title,
                    A.FullAddress
                FROM Orders O
                INNER JOIN UserAddresses A 
                    ON O.AddressID = A.AddressID
                WHERE O.OrderID = @oid
            ", con);

            cmd.Parameters.AddWithValue("@oid", OrderID);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                GrandTotal = Convert.ToDecimal(dr["TotalAmount"]);
                AddressTitle = dr["Title"].ToString();
                FullAddress = dr["FullAddress"].ToString();
            }
        }
    }

    // =========================
    // LOAD ORDER ITEMS
    // =========================
    void LoadItems()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT 
                    ItemName,
                    Price,
                    Quantity,
                    Total
                FROM OrderItems
                WHERE OrderID = @oid
            ", con);

            da.SelectCommand.Parameters.AddWithValue("@oid", OrderID);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptItems.DataSource = dt;
            rptItems.DataBind();
        }
    }
}
