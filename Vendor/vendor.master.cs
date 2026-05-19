using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_vendor : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["zomo"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔐 Vendor Authentication
        if (Session["VendorID"] == null || Session["Role"] == null)
        {
            Response.Redirect("~/Vendor/login.aspx");
            return;
        }

        if (Session["Role"].ToString() != "VENDOR")
        {
            Response.Redirect("~/Vendor/login.aspx");
            return;
        }

        // 🔒 Back button disable
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));

        if (!IsPostBack)
        {
            LoadVendorInfo();
            LoadNotifications();
        }
    }

    private void LoadVendorInfo()
    {
        try
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT OwnerName, Logo FROM VendorRestaurants WHERE VendorID=@VendorID", con);

            cmd.Parameters.AddWithValue("@VendorID", Session["VendorID"]);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblAdminName.Text = dr["OwnerName"].ToString();

                // ✅ Vendor Image Fix
                if (dr["Logo"] != DBNull.Value && dr["Logo"].ToString() != "")
                {
                    imgAdmin.ImageUrl = "~/Vendor/assets/images/restaurant/" + dr["Logo"].ToString();
                }
                else
                {
                    imgAdmin.ImageUrl = "~/Vendor/assets/images/restaurant/default-user.png";
                }
            }

            con.Close();
        }
        catch
        {
            con.Close();
            imgAdmin.ImageUrl = "~/Vendor/assets/images/restaurant/default-user.png";
        }
    }

    private void LoadNotifications()
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TOP 5 Title FROM AdminNotifications ORDER BY CreatedAt DESC", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptNotifications.DataSource = dt;
            rptNotifications.DataBind();

            lblNotificationCount.Text = dt.Rows.Count.ToString();
        }
        catch
        {
            lblNotificationCount.Text = "0";
        }
    }
}