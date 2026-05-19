<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master"
    AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- page head section starts -->
<section class="page-head-section">
    <div class="container page-heading">
        <h2 class="h3 mb-3 text-white text-center">Profile</h2>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb flex-lg-nowrap justify-content-center">
                <li class="breadcrumb-item">
                    <a href="index.aspx"><i class="ri-home-line"></i> Home</a>
                </li>
                <li class="breadcrumb-item active">Profile</li>
            </ol>
        </nav>
    </div>
</section>
<!-- page head section end -->

<section class="profile-section section-b-space">
<div class="container">
<div class="row g-3">

<!-- LEFT -->
<div class="col-lg-3">
    <div class="profile-sidebar sticky-top">
        <div class="profile-cover">
            <img class="img-fluid profile-pic" src="/<%= UserImage %>" alt="profile">
        </div>
        <div class="profile-name">
            <h5 class="user-name"><%= UserName %></h5>
            <h6><%= UserEmail %></h6>
        </div>
        <ul class="profile-list">
            <li class="active">
                <i class="ri-user-3-line"></i>
                <a href="profile.aspx">Change Profile</a>
            </li>
            <li>
                <i class="ri-shopping-bag-3-line"></i>
                <a href="my-order.aspx">My Order</a>
            </li>
            <li>
                <i class="ri-logout-box-r-line"></i>
                <a href="logout.aspx">Log Out</a>
            </li>
        </ul>
    </div>
</div>

<!-- RIGHT -->
<div class="col-lg-9">
<div class="change-profile-content">
<div class="title">
    <div class="loader-line"></div>
    <h3>Change Profile</h3>
</div>

<ul class="profile-details-list">

<li>
    <div class="profile-content">
        <div class="d-flex align-items-center gap-sm-2 gap-1">
            <i class="ri-user-3-fill"></i>
            <span>Name :</span>
        </div>
        <h6><%= UserName %></h6>
    </div>
    <a href="#nameModal" class="btn theme-outline" data-bs-toggle="modal">Edit</a>
</li>

<li>
    <div class="profile-content">
        <div class="d-flex align-items-center gap-sm-2 gap-1">
            <i class="ri-mail-fill"></i>
            <span>Email :</span>
        </div>
        <h6><%= UserEmail %></h6>
    </div>
</li>

<li>
    <div class="profile-content">
        <div class="d-flex align-items-center gap-sm-2 gap-1">
            <i class="ri-phone-fill"></i>
            <span>Phone Number :</span>
        </div>
        <h6><%= UserPhone %></h6>
    </div>
    <a href="#phoneModal" class="btn theme-outline" data-bs-toggle="modal">Change</a>
</li>

<li>
    <div class="profile-content">
        <div class="d-flex align-items-center gap-sm-2 gap-1">
            <i class="ri-image-fill"></i>
            <span>Profile Image :</span>
        </div>
        <h6>Change profile photo</h6>
    </div>
    <a href="#imageModal" class="btn theme-outline" data-bs-toggle="modal">Change</a>
</li>

</ul>
</div>
</div>

</div>
</div>
</section>

<!-- ============ MODALS (INSIDE CONTENT) ============ -->

<div class="modal fade" id="nameModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h5>Edit Name</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>
<div class="modal-body">
<asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="modal-footer">
<asp:Button ID="btnSaveName" runat="server"
Text="Save" CssClass="btn theme-btn"
UseSubmitBehavior="false" OnClick="SaveName" />
</div>
</div>
</div>
</div>

<div class="modal fade" id="phoneModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h5>Edit Phone</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>
<div class="modal-body">
<asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="modal-footer">
<asp:Button ID="btnSavePhone" runat="server"
Text="Save" CssClass="btn theme-btn"
UseSubmitBehavior="false" OnClick="SavePhone" />
</div>
</div>
</div>
</div>

<div class="modal fade" id="imageModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h5>Change Profile Image</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>
<div class="modal-body">
<asp:FileUpload ID="fuImage" runat="server" />
</div>
<div class="modal-footer">
<asp:Button ID="btnSaveImage" runat="server"
Text="Upload" CssClass="btn theme-btn"
UseSubmitBehavior="false" OnClick="SaveImage" />
</div>
</div>
</div>
</div>

</asp:Content>
