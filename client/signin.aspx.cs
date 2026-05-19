using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class client_signin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["zomo"].ConnectionString);

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (email == "" || password == "")
        {
            lblMsg.Text = "Please enter email and password";
            return;
        }

        SqlCommand cmd = new SqlCommand(@"
            SELECT UserID, FullName, Email
            FROM Users
            WHERE Email = @e
              AND Password = @pw
              AND ISNULL(IsActive,1) = 1
              AND IsVerified = 1
        ", con);

        cmd.Parameters.AddWithValue("@e", email);
        cmd.Parameters.AddWithValue("@pw", password);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            Session["UserID"] = dr["UserID"].ToString();
            Session["UserName"] = dr["FullName"].ToString();
            Session["UserEmail"] = dr["Email"].ToString();

            con.Close();
            Response.Redirect("index.aspx");
        }
        else
        {
            con.Close();
            lblMsg.Text = "Invalid credentials or account not verified";
        }
    }
}
