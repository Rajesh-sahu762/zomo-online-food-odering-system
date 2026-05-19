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
            LoadVendors();
            LoadOrders(0);
        }
    }

    void LoadVendors()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT VendorID, Email FROM VendorUsers ORDER BY Email", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlVendors.DataSource = dt;
            ddlVendors.DataTextField = "Email";
            ddlVendors.DataValueField = "VendorID";
            ddlVendors.DataBind();

            ddlVendors.Items.Insert(0,
                new System.Web.UI.WebControls.ListItem("All Vendors", "0"));
        }
    }

    void LoadOrders(int vendorId)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"
                SELECT 
                    O.OrderCode,
                    O.Amount,
                    O.DeliveryStatus,
                    O.OrderDate,
                    V.Email
                FROM Orders O
                INNER JOIN VendorUsers V ON O.VendorID = V.VendorID
                WHERE O.IsDeleted = 0";

            if (vendorId > 0)
            {
                query += " AND O.VendorID=@vid";
            }

            query += " ORDER BY O.OrderID DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            if (vendorId > 0)
            {
                da.SelectCommand.Parameters.AddWithValue("@vid", vendorId);
            }

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrders.DataSource = dt;
            rptOrders.DataBind();
        }
    }

    protected void ddlVendors_SelectedIndexChanged(object sender, EventArgs e)
    {
        int vendorId = Convert.ToInt32(ddlVendors.SelectedValue);
        LoadOrders(vendorId);
    }
}