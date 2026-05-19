using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindProducts();
    }

    private void BindProducts()
    {
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        SqlConnection con = new SqlConnection(constr);

        SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT 
            F.FoodID,
            F.FoodName,
            F.Price,
            F.OfferPrice,
            F.IsAvailable,
            F.MainImage,
            C.CategoryName
        FROM FoodItems F
        LEFT JOIN VendorFoodCategory C 
            ON F.CategoryID = C.CategoryID
        WHERE F.VendorID = @vid
        ORDER BY F.FoodID DESC
    ", con);

        da.SelectCommand.Parameters.AddWithValue("@vid", vendorId);

        DataTable dt = new DataTable();
        da.Fill(dt);

        ListView1.DataSource = dt;
        ListView1.DataBind();
    }


    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        // DELETE PRODUCT
        if (e.CommandName == "del")
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("DELETE FROM FoodItems WHERE FoodID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindProducts();
        }

        // ENTER EDIT MODE
        else if (e.CommandName == "editrow")
        {
            ListView1.EditIndex = e.Item.DataItemIndex;
            BindProducts();
        }

        // CANCEL EDIT MODE
        else if (e.CommandName == "cancel")
        {
            ListView1.EditIndex = -1;
            BindProducts();
        }

        // UPDATE PRODUCT
        else if (e.CommandName == "update")
        {
            TextBox name = (TextBox)e.Item.FindControl("txtEditName");
            TextBox price = (TextBox)e.Item.FindControl("txtEditPrice");
            TextBox offer = (TextBox)e.Item.FindControl("txtOfferPrice");
            DropDownList status = (DropDownList)e.Item.FindControl("ddlEditStatus");
            FileUpload fu = (FileUpload)e.Item.FindControl("fuEditImage");

            string finalImg;

            // New Image Upload
            if (fu.HasFile)
            {
                finalImg = SaveImage(fu.PostedFile);
            }
            else
            {
                SqlConnection conImg = new SqlConnection(constr);
                SqlCommand cmdImg = new SqlCommand("SELECT MainImage FROM FoodItems WHERE FoodID=@id", conImg);
                cmdImg.Parameters.AddWithValue("@id", id);
                conImg.Open();
                finalImg = cmdImg.ExecuteScalar().ToString();
                conImg.Close();
            }

            SqlConnection con2 = new SqlConnection(constr);
            SqlCommand cmd2 = new SqlCommand(@"
UPDATE FoodItems SET
    FoodName=@n,
    Price=@p,
    OfferPrice=@o,
    IsAvailable=@s,
    MainImage=@m
WHERE FoodID=@id", con2);

            cmd2.Parameters.AddWithValue("@n", name.Text);
            cmd2.Parameters.AddWithValue("@p", price.Text);
            cmd2.Parameters.AddWithValue("@o", offer.Text);
            cmd2.Parameters.AddWithValue("@s", status.SelectedValue);
            cmd2.Parameters.AddWithValue("@m", finalImg);
            cmd2.Parameters.AddWithValue("@id", id);

            con2.Open();
            cmd2.ExecuteNonQuery();
            con2.Close();

            ListView1.EditIndex = -1;
            BindProducts();
        }

        // TOGGLE PRODUCT ACTIVE/PENDING
        else if (e.CommandName == "toggle")
        {
            SqlConnection con = new SqlConnection(constr);

            SqlCommand getCmd = new SqlCommand(
                "SELECT IsAvailable FROM FoodItems WHERE FoodID=@id", con);
            getCmd.Parameters.AddWithValue("@id", id);

            con.Open();
            bool curr = Convert.ToBoolean(getCmd.ExecuteScalar());
            con.Close();

            SqlCommand updateCmd = new SqlCommand(
                "UPDATE FoodItems SET IsAvailable=@v WHERE FoodID=@id", con);
            updateCmd.Parameters.AddWithValue("@v", !curr);
            updateCmd.Parameters.AddWithValue("@id", id);

            con.Open();
            updateCmd.ExecuteNonQuery();
            con.Close();

            BindProducts();
        }
    }

    private string SaveImage(System.Web.HttpPostedFile file)
    {
        string name = Path.GetFileName(file.FileName);
        string path = Server.MapPath("~/assets/images/product/" + name);
        file.SaveAs(path);
        return name;
    }
}