using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Vendor_Default : System.Web.UI.Page
{
    // connection string name "zomo" (same as your other pages)
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hfActiveTab.Value = "#Settings";  // default tab
            ViewState["password"] = txtPassword.Text;
            ViewState["confirm"] = txtCPassword.Text;
        }

        if (ViewState["password"] != null)
        {
            string script = @"
        document.getElementById('" + txtPassword.ClientID + @"').value = '" + ViewState["password"] + @"';
        document.getElementById('" + txtCPassword.ClientID + @"').value = '" + ViewState["confirm"] + @"';
    ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "restorePass", script, true);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string driverImg = "";
        string carImg = "";

        if (fuDriverImage.HasFile)
        {
            driverImg = Guid.NewGuid().ToString() + Path.GetExtension(fuDriverImage.FileName);
            fuDriverImage.SaveAs(Server.MapPath("~/Vendor/assets/images/drivers/" + driverImg));
        }

        if (fuCarImage.HasFile)
        {
            carImg = Guid.NewGuid().ToString() + Path.GetExtension(fuCarImage.FileName);
            fuCarImage.SaveAs(Server.MapPath("~/Vendor/assets/images/drivers/" + carImg));
        }

        bool status = rActive.Checked ? true : false;

        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(@"
        INSERT INTO Drivers
        (FirstName, LastName, Email, Phone, Password,
         DriverImage, CarNumber, CarName, CarImage, IsActive)
        VALUES
        (@fn,@ln,@em,@ph,@pw,@di,@cn,@cname,@ci,@st)", con);

        cmd.Parameters.AddWithValue("@fn", txtName.Text);
        cmd.Parameters.AddWithValue("@ln", txtLast.Text);
        cmd.Parameters.AddWithValue("@em", txtEmail.Text);
        cmd.Parameters.AddWithValue("@ph", txtPhone.Text);
        cmd.Parameters.AddWithValue("@pw", txtPassword.Text); // later encrypt
        cmd.Parameters.AddWithValue("@di", driverImg);
        cmd.Parameters.AddWithValue("@cn", txtCarNumber.Text);
        cmd.Parameters.AddWithValue("@cname", txtCarName.Text);
        cmd.Parameters.AddWithValue("@ci", carImg);
        cmd.Parameters.AddWithValue("@st", status);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        ScriptManager.RegisterStartupScript(this, GetType(), "ok",
            "Swal.fire('Saved','Driver added successfully','success');", true);

        ClearForm();
    }
    void ClearForm()
    {
        txtName.Text = "";
        txtLast.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtPassword.Text = "";
        txtCPassword.Text = "";
        txtCarNumber.Text = "";
        txtCarName.Text = "";
        rActive.Checked = true;
        rInactive.Checked = false;
    }

    private string SaveImage(HttpPostedFile file)
    {
        Random r = new Random();
        string ext = Path.GetExtension(file.FileName);
        string img = r.Next(11111, 99999).ToString() + ext;
        string path = Server.MapPath("~/Admin/assets/images/drivers/");

        if (!Directory.Exists(path))
            Directory.CreateDirectory(path);

        file.SaveAs(path + img);
        return img;
    }

}