using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategories();
        }
    }

    void BindCategories()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM GlobalCategories ORDER BY GlobalCategoryID DESC", conStr);

        DataTable dt = new DataTable();
        da.Fill(dt);

        gvCategories.DataSource = dt;
        gvCategories.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string fileName = "";

        if (fuImage.HasFile)
        {
            fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuImage.FileName);
            fuImage.SaveAs(Server.MapPath("~/Admin/assets/images/Category/") + fileName);
        }

        SqlConnection con = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        if (hfCategoryID.Value == "")
        {
            cmd.CommandText = @"INSERT INTO GlobalCategories
                (CategoryName, CategoryImage, IsActive)
                VALUES (@n,@i,@a)";
        }
        else
        {
            cmd.CommandText = @"UPDATE GlobalCategories SET
                CategoryName=@n,
                IsActive=@a
                " + (fileName != "" ? ", CategoryImage=@i" : "") +
                " WHERE GlobalCategoryID=@id";

            cmd.Parameters.AddWithValue("@id", hfCategoryID.Value);
        }

        cmd.Parameters.AddWithValue("@n", txtCategory.Text);
        cmd.Parameters.AddWithValue("@a", chkActive.Checked);
        if (fileName != "") cmd.Parameters.AddWithValue("@i", fileName);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        ClearForm();
        BindCategories();
    }



    protected void gvCategories_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        // 🔹 EDIT
        if (e.CommandName == "EditRow")
        {
            
            hfCategoryID.Value = id.ToString();

            SqlConnection con = new SqlConnection(conStr);
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM GlobalCategories WHERE GlobalCategoryID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtCategory.Text = dr["CategoryName"].ToString();
                chkActive.Checked = Convert.ToBoolean(dr["IsActive"]);

                if (dr["CategoryImage"] != DBNull.Value)
                {
                    imgPreview.ImageUrl =
                        "~/Owner/assets/images/Category/" + dr["CategoryImage"];
                    imgPreview.Visible = true;
                }
            }
            con.Close();
        }


        // 🔹 TOGGLE
        if (e.CommandName == "Toggle")
        {
            SqlConnection con = new SqlConnection(conStr);
            SqlCommand cmd = new SqlCommand(
                "UPDATE GlobalCategories SET IsActive = CASE WHEN IsActive=1 THEN 0 ELSE 1 END WHERE GlobalCategoryID=@id",
                con);

            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            BindCategories();
        }

        // 🔹 DELETE
        if (e.CommandName == "DELETE")
        {
            SqlConnection con = new SqlConnection(conStr);

            SqlCommand getImg = new SqlCommand(
                "SELECT CategoryImage FROM GlobalCategories WHERE GlobalCategoryID=@id", con);
            getImg.Parameters.AddWithValue("@id", id);

            con.Open();
            object img = getImg.ExecuteScalar();

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM GlobalCategories WHERE GlobalCategoryID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            con.Close();
            if (img != null && img.ToString() != "")
            {
                string path = Server.MapPath("~/Admin/assets/images/Category/" + img);
                if (File.Exists(path))
                    File.Delete(path);
            }

            BindCategories();
        }
    }


    void ClearForm()
    {
        txtCategory.Text = "";
        chkActive.Checked = true;
        hfCategoryID.Value = "";
    }
}