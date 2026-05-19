using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Default2 : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Vendor security
        if (Session["VendorID"] == null || Session["Role"] == null ||
            Session["Role"].ToString() != "VENDOR")
        {
            Response.Redirect("login.aspx");
            return;
        }

        // 🔁 Agar restaurant already setup
        if (!IsPostBack && Session["RestaurantID"] != null)
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        string logo = UploadFile(fuLogo);
        string banner = UploadFile(fuBanner);

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO VendorRestaurants
                (VendorID, RestaurantName, OwnerName, Email, Phone,
                 Address, City, State, Pincode, Logo, BannerImage)
                VALUES
                (@v, @r, @o, @e, @p, @a, @c, @s, @pin, @l, @b);
                SELECT SCOPE_IDENTITY()", con);

            cmd.Parameters.AddWithValue("@v", vendorId);
            cmd.Parameters.AddWithValue("@r", txtRestaurant.Text.Trim());
            cmd.Parameters.AddWithValue("@o", txtOwner.Text.Trim());
            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@a", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@c", txtCity.Text.Trim());
            cmd.Parameters.AddWithValue("@s", txtState.Text.Trim());
            cmd.Parameters.AddWithValue("@pin", txtPincode.Text.Trim());
            cmd.Parameters.AddWithValue("@l", logo);
            cmd.Parameters.AddWithValue("@b", banner);

            con.Open();
            int restId = Convert.ToInt32(cmd.ExecuteScalar());

            // 🔑 Update VendorUsers
            SqlCommand up = new SqlCommand(
                "UPDATE VendorUsers SET RestaurantID=@rid WHERE VendorID=@vid", con);
            up.Parameters.AddWithValue("@rid", restId);
            up.Parameters.AddWithValue("@vid", vendorId);
            up.ExecuteNonQuery();

            // ✅ Proper session value
            Session["RestaurantID"] = restId;
        }

        Response.Redirect("index.aspx");
    }

    string UploadFile(FileUpload fu)
    {
        if (!fu.HasFile) return null;

        string ext = Path.GetExtension(fu.FileName);
        string name = DateTime.Now.Ticks + ext;

        string path = Server.MapPath("~/Vendor/assets/images/restaurant/");
        if (!Directory.Exists(path))
            Directory.CreateDirectory(path);

        fu.SaveAs(path + name);
        return name;
    }
}