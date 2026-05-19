using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
            BindVendors();
        }
    }

    void BindVendors()
    {
        SqlConnection con = new SqlConnection(conStr);

        string sql = "SELECT * FROM VendorUsers WHERE 1=1";

        if (ddlApproval.SelectedValue != "")
            sql += " AND IsApproved=" + ddlApproval.SelectedValue;

        if (ddlActive.SelectedValue != "")
            sql += " AND IsActive=" + ddlActive.SelectedValue;

        if (txtSearch.Text.Trim() != "")
            sql += " AND Email LIKE '%" + txtSearch.Text.Trim() + "%'";

        sql += " ORDER BY VendorID DESC";

        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvVendors.DataSource = dt;
        gvVendors.DataBind();
    }

    protected void FilterChanged(object sender, EventArgs e)
    {
        BindVendors();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindVendors();
    }

    protected void gvVendors_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int vendorId = Convert.ToInt32(e.CommandArgument);

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (e.CommandName == "Approve")
            {
                cmd.CommandText = "UPDATE VendorUsers SET IsApproved=1, IsActive=1 WHERE VendorID=@id";
            }
            else if (e.CommandName == "Reject")
            {
                cmd.CommandText = "DELETE FROM VendorUsers WHERE VendorID=@id";
            }
            else if (e.CommandName == "Toggle")
            {
                cmd.CommandText = @"UPDATE VendorUsers 
                                SET IsActive = CASE WHEN IsActive=1 THEN 0 ELSE 1 END 
                                WHERE VendorID=@id";
            }

            cmd.Parameters.AddWithValue("@id", vendorId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        BindVendors();
    }
}
