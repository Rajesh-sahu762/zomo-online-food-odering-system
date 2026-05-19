using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;            // <-- REQUIRED for HttpPostedFile
using System.Web.UI;        // Optional but good
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
        }
    }

    // =============================
    // 1. BIND CATEGORY LIST
    // =============================
    private void BindCategory()
    {
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        SqlConnection con = new SqlConnection(constr);

        SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT *
        FROM VendorFoodCategory
        WHERE VendorID = @vid
        ORDER BY CategoryID DESC
    ", con);

        da.SelectCommand.Parameters.AddWithValue("@vid", vendorId);

        DataTable dt = new DataTable();
        da.Fill(dt);

        ListView1.DataSource = dt;
        ListView1.DataBind();
    }



    // ==================================
    // 2. LISTVIEW ITEM COMMANDS
    // ==================================
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        // DELETE
      if (e.CommandName == "del")
{
    SqlConnection con = new SqlConnection(constr);
    con.Open();

    // Step 1: Check if this category is used in FoodItems
    SqlCommand check = new SqlCommand(
       "SELECT COUNT(*) FROM FoodItems WHERE CategoryID = @id AND VendorID = @vid", con);

    check.Parameters.AddWithValue("@id", id);
    check.Parameters.AddWithValue("@vid", Session["VendorID"]);


    int used = Convert.ToInt32(check.ExecuteScalar());

    if (used > 0)
    {
        // Show popup instead of SQL error
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup",
  "Swal.fire({ icon: 'error', title: 'Cannot Delete!', text: 'This category is used in products.' });", true);


        con.Close();
        return;
    }

    // Step 2: Delete if not used
    SqlCommand cmd = new SqlCommand(
        "DELETE FROM VendorFoodCategory WHERE CategoryID=@id", con);
    cmd.Parameters.AddWithValue("@id", id);
    cmd.ExecuteNonQuery();

    con.Close();

    // Refresh list
    BindCategory();

    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup",
 "Swal.fire({ icon: 'success', title: 'Deleted!', text: 'Category deleted successfully.' });", true);

}


        // ENTER EDIT MODE
        else if (e.CommandName == "editrow")
        {
            ListView1.EditIndex = e.Item.DataItemIndex;
            BindCategory();
        }
        else if (e.CommandName == "toggleHome")
        {
            string catId = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(constr);

            // get current value
            SqlCommand cmdGet = new SqlCommand(
                "SELECT ShowInHomepage FROM VendorFoodCategory WHERE CategoryID=@id", con);
            cmdGet.Parameters.AddWithValue("@id", catId);

            con.Open();
            bool currentValue = Convert.ToBoolean(cmdGet.ExecuteScalar());
            con.Close();

            bool newValue = !currentValue;

            SqlCommand cmdUpdate = new SqlCommand(
                "UPDATE VendorFoodCategory SET ShowInHomepage=@v WHERE CategoryID=@id", con);

            cmdUpdate.Parameters.AddWithValue("@v", newValue);
            cmdUpdate.Parameters.AddWithValue("@id", catId);

            con.Open();
            cmdUpdate.ExecuteNonQuery();
            con.Close();

            BindCategory();
        }


        // UPDATE ROW (Name + Image)
        else if (e.CommandName == "update")
        {
            TextBox txtName = (TextBox)e.Item.FindControl("txtEditName");
            FileUpload fu = (FileUpload)e.Item.FindControl("fuEditImage");

            string newImage = "";

            // ------- If new image uploaded ------
            if (fu.HasFile)
            {
                newImage = SaveImage(fu.PostedFile); // IMAGE UPLOAD function
            }
            else
            {
                // get old image
                SqlConnection conOld = new SqlConnection(constr);
                SqlCommand cmdOld = new SqlCommand("SELECT CategoryImage FROM VendorFoodCategory WHERE CategoryID=@id", conOld);
                cmdOld.Parameters.AddWithValue("@id", id);
                conOld.Open();
                newImage = cmdOld.ExecuteScalar().ToString();
                conOld.Close();
            }

            SqlConnection con2 = new SqlConnection(constr);
            SqlCommand cmd2 = new SqlCommand(@"
            UPDATE VendorFoodCategory 
            SET 
                CategoryName=@n,
                CategoryImage=@img
            WHERE CategoryID=@id", con2);

            cmd2.Parameters.AddWithValue("@n", txtName.Text);
            cmd2.Parameters.AddWithValue("@img", newImage);
            cmd2.Parameters.AddWithValue("@id", id);

            con2.Open();
            cmd2.ExecuteNonQuery();
            con2.Close();

            ListView1.EditIndex = -1;
            BindCategory();
        }

        // CANCEL EDIT
        else if (e.CommandName == "myCancel")
        {
            // Always reset edit mode
            ListView1.EditIndex = -1;

            // Rebind list
            BindCategory();

            // Stop further processing
            return;
        }

    }
    private string SaveImage(HttpPostedFile file)
    {
        Random r = new Random();
        string ext = Path.GetExtension(file.FileName);
        string imgName = r.Next(11111, 99999) + ext;
        string savePath = "~/assets/images/menu/" + imgName;

        using (Bitmap original = new Bitmap(file.InputStream))
        {
            int w = original.Width;
            int h = original.Height;

            using (Bitmap resized = new Bitmap(w, h))
            {
                using (Graphics g = Graphics.FromImage(resized))
                {
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                    g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;

                    g.DrawImage(original, 0, 0, w, h);
                }

                // ✔ Save inside the same using block
                resized.Save(Server.MapPath(savePath), ImageFormat.Png);
            }
        }

        return imgName;
    }


    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {

    }
    protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {

    }
}