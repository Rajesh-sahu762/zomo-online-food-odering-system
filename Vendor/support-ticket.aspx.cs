using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls; // 🔥 IMPORTANT


public partial class Vendor_Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["zomo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindTickets();
    }


    void BindTickets()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM SupportTickets ORDER BY TicketID DESC",
            constr);

        DataTable dt = new DataTable();
        da.Fill(dt);

        lvTickets.DataSource = dt;
        lvTickets.DataBind();
    }

    protected void lvTickets_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        lvTickets.EditIndex = e.NewEditIndex;
        BindTickets();
    }

    protected void lvTickets_ItemCanceling(object sender, System.Web.UI.WebControls.ListViewCancelEventArgs e)
    {
        lvTickets.EditIndex = -1;
        BindTickets();
    }

    protected void lvTickets_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(lvTickets.DataKeys[e.ItemIndex].Value);

        TextBox txtSubject =
            (TextBox)lvTickets.Items[e.ItemIndex].FindControl("txtSubject");

        DropDownList ddlStatus =
            (DropDownList)lvTickets.Items[e.ItemIndex].FindControl("ddlStatus");

        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(
            "UPDATE SupportTickets SET Subject=@s, Status=@st WHERE TicketID=@id", con);

        cmd.Parameters.AddWithValue("@s", txtSubject.Text);
        cmd.Parameters.AddWithValue("@st", ddlStatus.SelectedValue);
        cmd.Parameters.AddWithValue("@id", id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        lvTickets.EditIndex = -1;
        BindTickets();
    }


    protected void lvTickets_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM SupportTickets WHERE TicketID=@id", con);

            cmd.Parameters.AddWithValue("@id", e.CommandArgument);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            BindTickets();
        }
    }

}
