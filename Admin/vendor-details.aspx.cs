using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["vid"] == null)
                Response.Redirect("vendors.aspx");

            LoadVendor();
        }
    }

    void LoadVendor()
    {
        int vendorId = Convert.ToInt32(Request.QueryString["vid"]);

        SqlConnection con = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand(@"
            SELECT V.Email, V.IsApproved, V.IsActive,
                   R.RestaurantName, R.OwnerName, R.Phone,
                   R.Address, R.City, R.FSSAI_No, R.GST_No,
                   R.Logo, R.BannerImage
            FROM VendorUsers V
            LEFT JOIN Restaurants R ON V.VendorID = R.VendorID
            WHERE V.VendorID=@vid", con);

        cmd.Parameters.AddWithValue("@vid", vendorId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            txtEmail.Text = dr["Email"].ToString();

            bool approved = Convert.ToBoolean(dr["IsApproved"]);
            bool active = Convert.ToBoolean(dr["IsActive"]);

            txtStatus.Text = approved ? (active ? "Approved & Active" : "Inactive") : "Pending Approval";

            txtRestaurant.Text = dr["RestaurantName"].ToString();
            txtOwner.Text = dr["OwnerName"].ToString();
            txtPhone.Text = dr["Phone"].ToString();
            txtCity.Text = dr["City"].ToString();
            txtAddress.Text = dr["Address"].ToString();
            txtFssai.Text = dr["FSSAI_No"].ToString();
            txtGst.Text = dr["GST_No"].ToString();

            if (dr["Logo"].ToString() != "")
                imgLogo.ImageUrl = "~/" + dr["Logo"].ToString();

            if (dr["BannerImage"].ToString() != "")
                imgBanner.ImageUrl = "~/" + dr["BannerImage"].ToString();
        }

        con.Close();
    }
}