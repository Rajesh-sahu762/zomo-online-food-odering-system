using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    public int OrderID;
    public string OrderStatus = "";
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

    void LoadOrder()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
            SELECT OrderStatus, TotalAmount
            FROM Orders
            WHERE OrderID=@oid", con);

            cmd.Parameters.AddWithValue("@oid", OrderID);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                OrderStatus = dr["OrderStatus"].ToString();
                GrandTotal = Convert.ToDecimal(dr["TotalAmount"]);
            }
        }
    }




    void LoadItems()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT ItemName, Quantity, Total
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

    // 🔥 Progress helper
    public string StepClass(string step)
    {
        // EXACT same values jo Orders.OrderStatus me save ho rahe hain
        string[] steps = { "Placed", "Preparing", "Out for Delivery", "Delivered" };

        int current = Array.IndexOf(steps, OrderStatus);
        int target = Array.IndexOf(steps, step);

        if (current == -1 || target == -1)
            return "";

        return target <= current ? "done" : "";

        if (OrderStatus == "Cancelled")
            return "";

        if (OrderStatus == step)
            return "done";

        return "";

    }

}
