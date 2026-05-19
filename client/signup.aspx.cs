using System;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class client_signup : System.Web.UI.Page
{
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        // 🔒 Strong password check
        if (!IsStrongPassword(txtPassword.Text))
        {
            Response.Write("<script>alert('Please enter a strong password');</script>");
            return;
        }

        string otp = new Random().Next(100000, 999999).ToString();

        using (SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["zomo"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO Users
            (FullName, Email, Password, IsVerified, OTP, OTPExpiry)
            VALUES
            (@n,@e,@p,0,@otp,DATEADD(MINUTE,10,GETDATE()))
        ", con);

            cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim()); // later hash
            cmd.Parameters.AddWithValue("@otp", otp);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        SendOTP(txtEmail.Text.Trim(), otp);

        Session["OTPEmail"] = txtEmail.Text.Trim();
        Response.Redirect("otp.aspx");
    }


    private bool IsStrongPassword(string password)
    {
        if (password.Length < 8)
            return false;

        bool hasUpper = false;
        bool hasLower = false;
        bool hasDigit = false;
        bool hasSpecial = false;

        foreach (char c in password)
        {
            if (char.IsUpper(c)) hasUpper = true;
            else if (char.IsLower(c)) hasLower = true;
            else if (char.IsDigit(c)) hasDigit = true;
            else hasSpecial = true;
        }

        return hasUpper && hasLower && hasDigit && hasSpecial;
    }


    void SendOTP(string email, string otp)
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(email);
        mail.Subject = "ZOMO - OTP Verification";
        mail.Body = "Your OTP is: " + otp;

        SmtpClient smtp = new SmtpClient();
        smtp.Send(mail);
    }
}
