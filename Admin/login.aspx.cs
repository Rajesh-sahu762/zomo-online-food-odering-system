using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Owner_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT AdminID 
                FROM AdminUsers 
                WHERE Email=@e AND Password=@p AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim());

            con.Open();
            object id = cmd.ExecuteScalar();

            if (id != null)
            {
                Session["AdminID"] = id.ToString();
                Response.Redirect("admin-dashboard.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid email or password";
            }
        }
    }

}