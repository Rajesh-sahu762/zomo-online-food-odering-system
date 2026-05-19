using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;
    public int OrderID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["oid"] == null)
            Response.Redirect("my-order.aspx");

        OrderID = Convert.ToInt32(Request.QueryString["oid"]);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                UPDATE Orders
                SET 
                    OrderStatus='Cancelled',
                    IsCancelled=1,
                    CancelReason=@r,
                    CancelledAt=GETDATE()
                WHERE OrderID=@oid
                  AND OrderStatus IN ('Placed','Preparing')
            ", con);

            cmd.Parameters.AddWithValue("@oid", OrderID);
            cmd.Parameters.AddWithValue("@r", txtReason.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("my-order.aspx");
    }
}