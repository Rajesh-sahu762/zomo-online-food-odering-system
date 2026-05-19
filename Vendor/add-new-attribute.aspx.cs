using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Default : System.Web.UI.Page
{

    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        //// Vendor must be logged in
        //if (Session["VendorID"] == null || Session["RestaurantID"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
    }

    protected void btnSaveAttr_Click(object sender, EventArgs e)
    {
        string attrName = txtAttrName.Text.Trim();
        string attrValues = txtAttrValues.Text.Trim();

        if (attrName == "")
        {
            lblAttrMsg.ForeColor = System.Drawing.Color.Red;
            lblAttrMsg.Text = "Attribute name is required.";
            return;
        }

        int vendorId = Convert.ToInt32(Session["VendorID"]);
        int restaurantId = Convert.ToInt32(Session["RestaurantID"]);

        using (SqlConnection con = new SqlConnection(constr))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO VendorAttributeMaster
                (VendorID, RestaurantID, AttributeName, AttributeValues)
                VALUES (@VendorID, @RestaurantID, @Name, @Values)", con);

            cmd.Parameters.AddWithValue("@VendorID", vendorId);
            cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);
            cmd.Parameters.AddWithValue("@Name", attrName);
            cmd.Parameters.AddWithValue("@Values",
                string.IsNullOrEmpty(attrValues) ? (object)DBNull.Value : attrValues);

            cmd.ExecuteNonQuery();
        }

        txtAttrName.Text = "";
        txtAttrValues.Text = "";

        lblAttrMsg.ForeColor = System.Drawing.Color.Green;
        lblAttrMsg.Text = "Attribute saved successfully.";
    }
}