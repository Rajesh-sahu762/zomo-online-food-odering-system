using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindReviews();
    }
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    void BindReviews()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM ProductReviews ORDER BY ReviewID DESC", constr);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptReviews.DataSource = dt;
        rptReviews.DataBind();
    }
    protected string GetStars(int rating)
    {
        StringBuilder sb = new StringBuilder();

        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<li><i class='fas fa-star theme-color'></i></li>");
            else
                sb.Append("<li><i class='fas fa-star'></i></li>");
        }

        return sb.ToString();
    }
    protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        SqlConnection con = new SqlConnection(constr);

        if (e.CommandName == "toggle")
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE ProductReviews SET IsPublished = CASE WHEN IsPublished=1 THEN 0 ELSE 1 END WHERE ReviewID=@id",
                con);

            cmd.Parameters.AddWithValue("@id", e.CommandArgument);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        if (e.CommandName == "delete")
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM ProductReviews WHERE ReviewID=@id", con);

            cmd.Parameters.AddWithValue("@id", e.CommandArgument);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        BindReviews();
    }


}