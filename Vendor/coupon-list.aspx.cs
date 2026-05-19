using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["delete"] != null)
            {
                DeleteCoupon(Request.QueryString["delete"]);
            }

            BindCoupons();
        }
    }

    // ===============================
    // BIND COUPONS
    // ===============================
    void BindCoupons()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT CouponID, Title, CouponCode, DiscountValue FROM Coupons ORDER BY CouponID DESC",
                con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCoupons.DataSource = dt;
            rptCoupons.DataBind();
        }
    }

    // ===============================
    // DELETE COUPON
    // ===============================
    void DeleteCoupon(string id)
    {
        int cid = 0;
        if (!int.TryParse(id, out cid))
            return;

        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Coupons WHERE CouponID=@id", con);
            cmd.Parameters.AddWithValue("@id", cid);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("coupon-list.aspx");
    }
}
