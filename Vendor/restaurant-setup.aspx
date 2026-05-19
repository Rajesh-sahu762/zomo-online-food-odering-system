<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="restaurant-setup.aspx.cs" Inherits="Vendor_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="page-body">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">

                    <div class="card">
                        <div class="card-header">
                            <h5>Restaurant Details</h5>
                            <p>Complete setup to continue</p>
                        </div>

                        <div class="card-body row g-3">

                            <div class="col-md-6">
                                <label>Restaurant Name</label>
                                <asp:TextBox ID="txtRestaurant" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-6">
                                <label>Owner Name</label>
                                <asp:TextBox ID="txtOwner" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-6">
                                <label>Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-12">
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" runat="server"
                                    CssClass="form-control" TextMode="MultiLine" />
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-4">
                                <label>State</label>
                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-4">
                                <label>Pincode</label>
                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" />
                            </div>

                            <div class="col-md-6">
                                <label>Restaurant Logo</label>
                                <asp:FileUpload ID="fuLogo" runat="server" />
                            </div>

                            <div class="col-md-6">
                                <label>Banner Image</label>
                                <asp:FileUpload ID="fuBanner" runat="server" />
                            </div>

                            <div class="col-md-12 text-end">
                                <asp:Button ID="btnSave" runat="server"
                                    Text="Save & Continue"
                                    CssClass="btn btn-primary"
                                    OnClick="btnSave_Click" />
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>




</asp:Content>

