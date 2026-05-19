using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class client_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    public string UserName = "";
    public string UserEmail = "";
    public string UserPhone = "";
    public string UserImage = "assets/images/icons/p5.png";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("signin.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadProfile();
        }
    }

    void LoadProfile()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT FullName, Email, Phone, ProfileImage FROM Users WHERE UserID=@uid", con);
            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                UserName = dr["FullName"].ToString();
                UserEmail = dr["Email"].ToString();
                UserPhone = dr["Phone"].ToString();

                if (dr["ProfileImage"] != DBNull.Value && dr["ProfileImage"].ToString() != "")
                    UserImage = "client/assets/images/users/" + dr["ProfileImage"];
            }
        }

        txtName.Text = UserName;
        txtPhone.Text = UserPhone;
    }

    protected void SaveName(object sender, EventArgs e)
    {
        UpdateField("FullName", txtName.Text);
    }

    protected void SavePhone(object sender, EventArgs e)
    {
        UpdateField("Phone", txtPhone.Text);
    }

    protected void SaveImage(object sender, EventArgs e)
    {
        if (!fuImage.HasFile) return;

        string file = DateTime.Now.Ticks + Path.GetExtension(fuImage.FileName);
        fuImage.SaveAs(Server.MapPath("~/client/assets/images/users/") + file);

        UpdateField("ProfileImage", file);
    }

    void UpdateField(string column, string value)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE Users SET " + column + "=@v WHERE UserID=@uid", con);
            cmd.Parameters.AddWithValue("@v", value);
            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            cmd.ExecuteNonQuery();
        }
        Response.Redirect("profile.aspx");
    }
}
