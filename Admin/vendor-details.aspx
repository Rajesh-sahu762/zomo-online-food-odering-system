<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="vendor-details.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
<div class="page-body">
<div class="container-fluid">

<div class="card">
<div class="card-header">
    <h5>Vendor Details</h5>
</div>

<div class="card-body">
<div class="row g-3">

    <!-- Vendor Info -->
    <div class="col-md-6">
        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <div class="col-md-6">
        <label>Status</label>
        <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <hr />

    <!-- Restaurant Info -->
    <div class="col-md-6">
        <label>Restaurant Name</label>
        <asp:TextBox ID="txtRestaurant" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <div class="col-md-6">
        <label>Owner Name</label>
        <asp:TextBox ID="txtOwner" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <div class="col-md-6">
        <label>Phone</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <div class="col-md-6">
        <label>City</label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <div class="col-md-12">
        <label>Address</label>
        <asp:TextBox ID="txtAddress" runat="server"
            CssClass="form-control" TextMode="MultiLine"
            Rows="2" ReadOnly="true" />
    </div>

    <div class="col-md-6">
        <label>FSSAI No</label>
        <asp:TextBox ID="txtFssai" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <div class="col-md-6">
        <label>GST No</label>
        <asp:TextBox ID="txtGst" runat="server" CssClass="form-control" ReadOnly="true" />
    </div>

    <!-- Images -->
    <div class="col-md-6">
        <label>Restaurant Logo</label><br />
        <asp:Image ID="imgLogo" runat="server" Height="80" />
    </div>

    <div class="col-md-6">
        <label>Banner Image</label><br />
        <asp:Image ID="imgBanner" runat="server" Height="80" />
    </div>

</div>
</div>
</div>

</div>
</div>


</asp:Content>

