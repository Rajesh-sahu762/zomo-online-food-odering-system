using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // DELETE
            if (Request.QueryString["del"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["del"], out id))
                {
                    DeleteAttribute(id);
                    Response.Redirect("attributes.aspx");
                    return;
                }
            }

            BindAttributes();
        }
    }

    // ===============================
    // BIND ATTRIBUTES
    // ===============================
    private void BindAttributes()
    {
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                @"SELECT AttributeID, AttributeName 
              FROM VendorAttributeMaster 
              WHERE VendorID = @vid
              ORDER BY AttributeID DESC", con);

            da.SelectCommand.Parameters.AddWithValue("@vid", vendorId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAttributes.DataSource = dt;
            rptAttributes.DataBind();
        }
    }


    // ===============================
    // DELETE ATTRIBUTE
    // ===============================
    private void DeleteAttribute(int id)
    {
        int vendorId = Convert.ToInt32(Session["VendorID"]);

        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(
                @"DELETE FROM VendorAttributeMaster 
              WHERE AttributeID = @id AND VendorID = @vid", con);

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@vid", vendorId);

            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

}
