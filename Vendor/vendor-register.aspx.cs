using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zomo_Admin_vendor_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    string conStr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text != txtConfirm.Text)
        {
            Response.Write("<script>alert('Passwords do not match');</script>");
            return;
        }

        // 🔒 Strong password check
        if (!IsStrongPassword(txtPassword.Text))
        {
            Response.Write("<script>alert('Password is weak. Use strong password.');</script>");
            return;
        }

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand check = new SqlCommand(
                "SELECT COUNT(*) FROM VendorUsers WHERE Email=@e", con);
            check.Parameters.AddWithValue("@e", txtEmail.Text);

            con.Open();
            int exists = Convert.ToInt32(check.ExecuteScalar());

            if (exists > 0)
            {
                Response.Write("<script>alert('Email already registered');</script>");
                return;
            }

            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO VendorUsers (Email, Password, IsApproved, IsActive)
            VALUES (@e, @p, 0, 1)", con);

            cmd.Parameters.AddWithValue("@e", txtEmail.Text);
            cmd.Parameters.AddWithValue("@p", txtPassword.Text); // later encrypt

            cmd.ExecuteNonQuery();
        }

        Response.Write("<script>alert('Request sent! Admin approval required');</script>");
        txtEmail.Text = txtPassword.Text = txtConfirm.Text = "";
    }


    private bool IsStrongPassword(string password)
    {
        if (password.Length < 8)
            return false;

        bool hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;

        foreach (char c in password)
        {
            if (char.IsUpper(c)) hasUpper = true;
            else if (char.IsLower(c)) hasLower = true;
            else if (char.IsDigit(c)) hasDigit = true;
            else hasSpecial = true;
        }

        return hasUpper && hasLower && hasDigit && hasSpecial;
    }


}