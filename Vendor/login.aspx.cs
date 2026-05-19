using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Vendor_Login : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔒 Back button prevention
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));

        // 🔁 Already logged-in vendor
        if (!IsPostBack && Session["VendorID"] != null && Session["Role"] != null)
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT VendorID, RestaurantID
                FROM VendorUsers
                WHERE Email=@Email 
                  AND Password=@Password
                  AND IsActive=1 
                  AND IsApproved=1", con);

            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                // ✅ BASIC SESSION
                Session["VendorID"] = dr["VendorID"].ToString();
                Session["Role"] = "VENDOR";

                // ✅ CRITICAL FIX (DBNull handling)
                if (dr["RestaurantID"] == DBNull.Value)
                {
                    Session["RestaurantID"] = null;
                    Response.Redirect("restaurant-setup.aspx");
                }
                else
                {
                    Session["RestaurantID"] = dr["RestaurantID"].ToString();
                    Response.Redirect("index.aspx");
                }
            }
            else
            {
                lblMsg.Text = "Invalid login or account not approved.";
            }

            con.Close();
        }
    }
}
