using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class client_otp : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnResendOtp.Visible = false;
        }
    }


    protected void btnResendOtp_Click(object sender, EventArgs e)
    {
        string email = Session["OTPEmail"] as string;
        if (string.IsNullOrEmpty(email))
        {
            Response.Redirect("signup.aspx");
            return;
        }

        string newOtp = new Random().Next(100000, 999999).ToString();

        using (SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager
            .ConnectionStrings["zomo"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(@"
            UPDATE Users
            SET OTP = @o,
                OTPExpiry = DATEADD(MINUTE, 5, GETDATE())
            WHERE Email = @e
        ", con);

            cmd.Parameters.AddWithValue("@o", newOtp);
            cmd.Parameters.AddWithValue("@e", email);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        // 📧 SEND MAIL
        SendOtpMail(email, newOtp);

        btnResendOtp.Visible = false;

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "msg",
            "alert('New OTP sent to your email');",
            true
        );
    }

    void SendOtpMail(string email, string otp)
    {
        System.Net.Mail.MailMessage mail =
            new System.Net.Mail.MailMessage();

        mail.To.Add(email);
        mail.Subject = "Your OTP Verification Code";
        mail.Body = "Your OTP is: " + otp;

        System.Net.Mail.SmtpClient smtp =
            new System.Net.Mail.SmtpClient();

        smtp.Send(mail);
    }



    protected void btnVerify_Click(object sender, EventArgs e)
    {
        string enteredOtp =
            otp1.Text +
            otp2.Text +
            otp3.Text +
            otp4.Text +
            otp5.Text +
            otp6.Text;

        string email = Session["OTPEmail"] as string;

        if (string.IsNullOrEmpty(email))
        {
            Response.Redirect("signup.aspx");
            return;
        }

        using (SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager
            .ConnectionStrings["zomo"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT UserID
                FROM Users
                WHERE Email = @e
                  AND OTP = @o
                  AND IsVerified = 0
                  AND OTPExpiry >= GETDATE()
            ", con);

            cmd.Parameters.AddWithValue("@e", email);
            cmd.Parameters.AddWithValue("@o", enteredOtp);

            con.Open();
            object userId = cmd.ExecuteScalar();

            if (userId != null)
            {
                // ✅ OTP VALID → verify user
                SqlCommand update = new SqlCommand(@"
                    UPDATE Users
                    SET IsVerified = 1,
                        OTP = NULL,
                        OTPExpiry = NULL
                    WHERE UserID = @id
                ", con);

                update.Parameters.AddWithValue("@id", userId);
                update.ExecuteNonQuery();

                // 🔐 LOGIN SESSION
                Session["UserID"] = userId;
                Session["UserEmail"] = email;

                // 👇 ADD THIS
                Session["UserName"] = GetUserName(userId.ToString());


                Session.Remove("OTPEmail");

                Response.Redirect("index.aspx");
            }
            else
            {
                // ❌ Invalid OTP
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alert",
                    "alert('Invalid or expired OTP');",
                    true
                );
                btnResendOtp.Visible = true;
            }
        }
    }

    string GetUserName(string userId)
    {
        string name = "User";

        using (SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["zomo"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT FullName FROM Users WHERE UserID = @id",
                con);

            cmd.Parameters.AddWithValue("@id", userId);
            con.Open();

            object result = cmd.ExecuteScalar();
            if (result != null)
                name = result.ToString();
        }

        return name;
    }

}
