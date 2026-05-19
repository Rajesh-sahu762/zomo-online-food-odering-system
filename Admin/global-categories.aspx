<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="global-categories.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
<div class="page-body">
<div class="container-fluid">

    <div class="card">
        <div class="card-header">
            <h5>Global Categories</h5>
        </div>

        <div class="card-body">

            <!-- ADD / EDIT FORM -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <asp:TextBox ID="txtCategory" runat="server"
                        CssClass="form-control" placeholder="Category Name"></asp:TextBox>
                </div>

                <div class="col-md-3">
                    <asp:FileUpload ID="fuImage" runat="server" />
                </div>
                <div class="col-md-12 mt-2">
    <asp:Image ID="imgPreview" runat="server"
        Width="80"
        Visible="false"
        CssClass="border rounded p-1" />
</div>


                <div class="col-md-2">
                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" /> Active
                </div>

                <div class="col-md-3">
                    <asp:HiddenField ID="hfCategoryID" runat="server" />
                    <asp:Button ID="btnSave" runat="server"
                        Text="Save Category"
                        CssClass="btn btn-primary"
                        OnClick="btnSave_Click" />
                </div>
            </div>

            <hr />

            <!-- LIST -->
            <div class="table-responsive">
                <asp:GridView ID="gvCategories" runat="server"
                    CssClass="table table-striped"
                    AutoGenerateColumns="false"
                    DataKeyNames="GlobalCategoryID"
                    OnRowCommand="gvCategories_RowCommand">

                    <Columns>
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" />

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <img src='<%# "/Admin/assets/images/Category/" + Eval("CategoryImage") %>'
     style="height:40px;" />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("IsActive"))
                                    ? "<span class='badge bg-success'>Active</span>"
                                    : "<span class='badge bg-danger'>Inactive</span>" %>
                            </ItemTemplate>
                        </asp:TemplateField>

<asp:TemplateField HeaderText="Actions">
    <ItemTemplate>

    <asp:LinkButton ID="lnkEdit" runat="server"
    CommandName="EditRow"
    CommandArgument='<%# Eval("GlobalCategoryID") %>'
    CssClass="btn btn-sm btn-info">
    Edit
</asp:LinkButton>


        <asp:LinkButton ID="lnkToggle" runat="server"
            CommandName="Toggle"
            CommandArgument='<%# Eval("GlobalCategoryID") %>'
            CssClass="btn btn-sm btn-warning ms-1">
            Toggle
        </asp:LinkButton>

        <asp:LinkButton ID="lnkDelete" runat="server"
            CommandName="DELETE"
            CommandArgument='<%# Eval("GlobalCategoryID") %>'
            CssClass="btn btn-sm btn-danger ms-1"
            OnClientClick="return confirm('Are you sure you want to delete this category?');">
            Delete
        </asp:LinkButton>

    </ItemTemplate>
</asp:TemplateField>


                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>

</div>
</div>



</asp:Content>

