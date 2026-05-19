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
   string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVendors();
        }
    }

    void LoadVendors()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT VendorID, Email FROM VendorUsers WHERE IsApproved=1",
                con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlVendor.DataSource = dt;
            ddlVendor.DataTextField = "Email";
            ddlVendor.DataValueField = "VendorID";
            ddlVendor.DataBind();

            ddlVendor.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Vendor --", "0"));
        }
    }

    protected void ddlVendor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlVendor.SelectedValue == "0")
        {
            pnlRestaurant.Visible = false;
            return;
        }

        LoadRestaurant(Convert.ToInt32(ddlVendor.SelectedValue));
    }

    void LoadRestaurant(int vendorId)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM VendorRestaurants WHERE VendorID=@vid",
                con);

            cmd.Parameters.AddWithValue("@vid", vendorId);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                pnlRestaurant.Visible = true;

                txtRestaurantName.Text = dr["RestaurantName"].ToString();
                txtOwnerName.Text = dr["OwnerName"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtCity.Text = dr["City"].ToString();
                txtState.Text = dr["State"].ToString();
                txtPincode.Text = dr["Pincode"].ToString();

                chkActive.Checked = Convert.ToBoolean(dr["IsActive"]);
            }
            else
            {
                pnlRestaurant.Visible = false;
            }
        }
    }
}