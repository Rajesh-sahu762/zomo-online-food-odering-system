using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Vendor_AddCategory : System.Web.UI.Page
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
            BindGlobalCategories();
        }
    }

    void BindGlobalCategories()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT GlobalCategoryID, CategoryName FROM GlobalCategories WHERE IsActive=1",
                con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlGlobalCategory.DataSource = dt;
            ddlGlobalCategory.DataTextField = "CategoryName";
            ddlGlobalCategory.DataValueField = "GlobalCategoryID";
            ddlGlobalCategory.DataBind();

            ddlGlobalCategory.Items.Insert(0,
                new System.Web.UI.WebControls.ListItem("-- Select Global Category --", ""));
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Trim() == "")
        {
            Show("Enter category name", "warning");
            return;
        }

        if (ddlGlobalCategory.SelectedValue == "")
        {
            Show("Select global category", "warning");
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO VendorFoodCategory
                (VendorID, RestaurantID, CategoryName, GlobalCategoryID, IsActive, CreatedAt)
                VALUES
                (@VendorID, @RestaurantID, @Name, @GlobalCategoryID, @IsActive, GETDATE())
            ", con);

            cmd.Parameters.AddWithValue("@VendorID", Session["VendorID"]);
            cmd.Parameters.AddWithValue("@RestaurantID", Session["RestaurantID"]);
            cmd.Parameters.AddWithValue("@Name", txtname.Text.Trim());
            cmd.Parameters.AddWithValue("@GlobalCategoryID", ddlGlobalCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@IsActive", chkActive.Checked ? 1 : 0);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        txtname.Text = "";
        chkActive.Checked = false;

        Show("Category added successfully", "success");
    }

    void Show(string msg, string type)
    {
        ScriptManager.RegisterStartupScript(
            this, GetType(),
            "m",
            "Swal.fire({icon:'" + type + "',text:'" + msg + "'});",
            true);
    }
}
