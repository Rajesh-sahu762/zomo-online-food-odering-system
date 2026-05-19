<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="vendors.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="page-body">
    <div class="container-fluid">

        <div class="card">
            <div class="card-header">
                <h5>Vendor Management</h5>
            </div>

            <div class="card-body">

                <!-- FILTERS -->
                <div class="row mb-3">

                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlApproval" runat="server"
                            CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="FilterChanged">
                            <asp:ListItem Text="All Approval Status" Value=""></asp:ListItem>
                            <asp:ListItem Text="Pending" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Approved" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlActive" runat="server"
                            CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="FilterChanged">
                            <asp:ListItem Text="All Active Status" Value=""></asp:ListItem>
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-4">
                        <asp:TextBox ID="txtSearch" runat="server"
                            CssClass="form-control"
                            placeholder="Search by email"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server"
                            Text="Search"
                            CssClass="btn btn-primary w-100"
                            OnClick="btnSearch_Click" />
                    </div>

                </div>

                <!-- TABLE -->
                <div class="table-responsive">
                    <asp:GridView ID="gvVendors" runat="server"
                        CssClass="table table-striped"
                        AutoGenerateColumns="false"
                        DataKeyNames="VendorID"
                        OnRowCommand="gvVendors_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="CreatedAt" HeaderText="Created On"
                                DataFormatString="{0:dd-MM-yyyy}" />

                            <asp:TemplateField HeaderText="Approval">
                                <ItemTemplate>
                                    <%# Convert.ToBoolean(Eval("IsApproved"))
                                        ? "<span class='badge bg-success'>Approved</span>"
                                        : "<span class='badge bg-warning'>Pending</span>" %>
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

        <asp:LinkButton ID="btnApprove" runat="server"
            CssClass="btn btn-sm btn-success me-1"
            Text="Approve"
            CommandName="Approve"
            CommandArgument='<%# Eval("VendorID") %>'
            Visible='<%# !Convert.ToBoolean(Eval("IsApproved")) %>' />

        <asp:LinkButton ID="btnReject" runat="server"
            CssClass="btn btn-sm btn-danger me-1"
            Text="Reject"
            CommandName="Reject"
            CommandArgument='<%# Eval("VendorID") %>'
            Visible='<%# !Convert.ToBoolean(Eval("IsApproved")) %>' />

        <asp:LinkButton ID="btnToggle" runat="server"
            CssClass="btn btn-sm btn-info"
            Text="Active / Inactive"
            CommandName="Toggle"
            CommandArgument='<%# Eval("VendorID") %>'
            Visible='<%# Convert.ToBoolean(Eval("IsApproved")) %>' />

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

