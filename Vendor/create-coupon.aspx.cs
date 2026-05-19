using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropdown();
        }
    }

    // ================================
    // LOAD CATEGORY DROPDOWN
    // ================================
    private void LoadDropdown()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT CategoryID, CategoryName FROM VendorFoodCategory ORDER BY CategoryName", con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new ListItem("--Select--", ""));

            while (dr.Read())
            {
                ddlCategory.Items.Add(
                    new ListItem(dr["CategoryName"].ToString(), dr["CategoryName"].ToString()));
            }
        }
    }

    // ================================
    // SAVE COUPON
    // ================================
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text.Trim() == "" || txtCode.Text.Trim() == "")
        {
            ShowMsg("Title and Code are required!");
            return;
        }

        // DUPLICATE CHECK
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand chk = new SqlCommand(
                "SELECT COUNT(*) FROM Coupons WHERE CouponCode=@c", con);
            chk.Parameters.AddWithValue("@c", txtCode.Text.Trim());

            con.Open();
            int count = Convert.ToInt32(chk.ExecuteScalar());
            con.Close();

            if (count > 0)
            {
                ShowMsg("Coupon code already exists!");
                return;
            }
        }

        // ================= IMAGE UPLOAD =================
        string imgName = "";

        if (fuImage.HasFile)
        {
            string ext = Path.GetExtension(fuImage.FileName).ToLower();
            if (ext != ".jpg" && ext != ".jpeg" && ext != ".png")
            {
                ShowMsg("Only JPG, JPEG, PNG allowed");
                return;
            }

            string folder = Server.MapPath("~/Vendor/assets/images/coupons/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            imgName = Guid.NewGuid().ToString() + ext;
            fuImage.SaveAs(folder + imgName);
        }

        // ================= INSERT =================
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(@"
INSERT INTO Coupons
(Title, CouponCode, StartDate, EndDate, Quantity,
 DiscountType, DiscountValue, Products, Category,
 MinSpend, MaxSpend, PerLimit, PerCustomer, image)
VALUES
(@Title, @Code, @Start, @End, @Qty,
 @Type, @DisVal, @Products, @Category,
 @Min, @Max, @PerLimit, @PerCustomer, @Image)", con);

            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Code", txtCode.Text.Trim());
            cmd.Parameters.AddWithValue("@Start",
                txtStart.Text == "" ? (object)DBNull.Value : txtStart.Text);
            cmd.Parameters.AddWithValue("@End",
                txtEnd.Text == "" ? (object)DBNull.Value : txtEnd.Text);

            cmd.Parameters.AddWithValue("@Qty",
                txtQuantity.Text == "" ? 0 : Convert.ToInt32(txtQuantity.Text));

            cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
            cmd.Parameters.AddWithValue("@DisVal", txtdisv.Text.Trim());
            cmd.Parameters.AddWithValue("@Products", txtProducts.Text.Trim());
            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);

            cmd.Parameters.AddWithValue("@Min",
                txtMinSpend.Text == "" ? 0 : Convert.ToDecimal(txtMinSpend.Text));
            cmd.Parameters.AddWithValue("@Max",
                txtMaxSpend.Text == "" ? 0 : Convert.ToDecimal(txtMaxSpend.Text));

            cmd.Parameters.AddWithValue("@PerLimit", txtPerLimit.Text.Trim());
            cmd.Parameters.AddWithValue("@PerCustomer", txtPerCustomer.Text.Trim());
            cmd.Parameters.AddWithValue("@Image", imgName);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        ClearAll();
        ShowMsg("Coupon created successfully!");
    }

    // ================================
    void ClearAll()
    {
        txtTitle.Text = "";
        txtCode.Text = "";
        txtStart.Text = "";
        txtEnd.Text = "";
        txtQuantity.Text = "";
        txtdisv.Text = "";
        txtProducts.Text = "";
        txtMinSpend.Text = "";
        txtMaxSpend.Text = "";
        txtPerLimit.Text = "";
        txtPerCustomer.Text = "";
        ddlType.SelectedIndex = 0;
        ddlCategory.SelectedIndex = 0;
    }

    void ShowMsg(string msg)
    {
        ClientScript.RegisterStartupScript(
            this.GetType(), "msg", "alert('" + msg + "');", true);
    }
}
