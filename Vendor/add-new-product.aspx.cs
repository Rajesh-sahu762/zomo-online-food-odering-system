using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VendorID"] == null || Session["RestaurantID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindVendorCategories();
        }
    }

    void BindVendorCategories()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT CategoryID, CategoryName
                FROM VendorFoodCategory
                WHERE VendorID=@v
                  AND RestaurantID=@r
                  AND IsActive=1
            ", con);

            cmd.Parameters.AddWithValue("@v", Session["VendorID"]);
            cmd.Parameters.AddWithValue("@r", Session["RestaurantID"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlVendorCategory.DataSource = dt;
            ddlVendorCategory.DataTextField = "CategoryName";
            ddlVendorCategory.DataValueField = "CategoryID";
            ddlVendorCategory.DataBind();

            ddlVendorCategory.Items.Insert(0,
                new ListItem("-- Select Category --", ""));
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ddlVendorCategory.SelectedValue == "")
        {
            Show("Select category");
            return;
        }

        decimal priceVal = Convert.ToDecimal(price.Text);
        decimal offerVal = compare.Text == "" ? 0 : Convert.ToDecimal(compare.Text);

        List<string> gallery = new List<string>();
        foreach (HttpPostedFile f in FileUpload1.PostedFiles)
            gallery.Add(SaveImage(f));

        string mainImage = FileUpload2.HasFile
            ? SaveImage(FileUpload2.PostedFile)
            : gallery[0];

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
INSERT INTO FoodItems
(
 VendorID,
 CategoryID,
 RestaurantID,
 FoodName,
 FoodType,
 Description,
 Price,
 OfferPrice,
 IsAvailable,
 MainImage,
 GalleryImages,
 CreatedAt
)
VALUES
(
 @VendorID,
 @CategoryID,
 @RestaurantID,
 @FoodName,
 @FoodType,
 @Description,
 @Price,
 @OfferPrice,
 @IsAvailable,
 @MainImage,
 @GalleryImages,
 GETDATE()
)
", con);


            cmd.Parameters.AddWithValue("@VendorID", Session["VendorID"]);
            cmd.Parameters.AddWithValue("@CategoryID", ddlVendorCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@RestaurantID", Session["RestaurantID"]);

            cmd.Parameters.AddWithValue("@FoodName", proname.Text.Trim());
            cmd.Parameters.AddWithValue("@FoodType", foodtype.SelectedValue);
            cmd.Parameters.AddWithValue("@Description", desc.Text.Trim());
            cmd.Parameters.AddWithValue("@Price", priceVal);
            cmd.Parameters.AddWithValue("@OfferPrice", offerVal);
            cmd.Parameters.AddWithValue("@IsAvailable", stockstatus.SelectedValue);
            cmd.Parameters.AddWithValue("@MainImage", mainImage);
            cmd.Parameters.AddWithValue("@GalleryImages", string.Join(",", gallery));

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Show("Product added successfully");
    }

    string SaveImage(HttpPostedFile file)
    {
        string name = Path.GetFileName(file.FileName);
        string path = Server.MapPath("~/Vendor/assets/images/product/" + name);
        file.SaveAs(path);
        return name;
    }

    void Show(string msg)
    {
        ScriptManager.RegisterStartupScript(
            this, GetType(),
            "m",
            "Swal.fire({icon:'success',text:'" + msg + "'});",
            true);
    }
}
