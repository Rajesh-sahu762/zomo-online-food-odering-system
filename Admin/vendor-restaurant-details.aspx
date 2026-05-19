<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="vendor-restaurant-details.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <div class="card">
        <div class="card-header">
            <h5>Vendor Restaurant Details</h5>
        </div>

        <div class="card-body">

            <!-- Vendor Dropdown -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <label>Select Vendor</label>
                    <asp:DropDownList ID="ddlVendor"
                        runat="server"
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Restaurant Details -->
            <asp:Panel ID="pnlRestaurant" runat="server" Visible="false">

                <div class="row">
                    <div class="col-md-6">
                        <label>Restaurant Name</label>
                        <asp:TextBox ID="txtRestaurantName" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-6">
                        <label>Owner Name</label>
                        <asp:TextBox ID="txtOwnerName" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-12 mt-3">
                        <label>Address</label>
                        <asp:TextBox ID="txtAddress" runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="2"
                            ReadOnly="true" />
                    </div>

                    <div class="col-md-4 mt-3">
                        <label>City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-4 mt-3">
                        <label>State</label>
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-4 mt-3">
                        <label>Pincode</label>
                        <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <div class="col-md-6 mt-4">
                        <label>Status</label><br />
                        <asp:CheckBox ID="chkActive" runat="server" Text="Restaurant Active" Enabled="false" />
                    </div>
                </div>

            </asp:Panel>

        </div>
    </div>

</div>

</asp:Content>



