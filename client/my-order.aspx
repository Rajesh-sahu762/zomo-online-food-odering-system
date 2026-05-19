<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="my-order.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
    <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">My Order</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">My Order</li>
                </ol>
            </nav>
        </div>
    </section>
    <!-- page head section end -->

    <!-- profile section starts -->
    <section class="profile-section section-b-space">
        <div class="container">
            <div class="row g-3">
                <div class="col-lg-3">
                    <div class="profile-sidebar sticky-top">
                        <div class="profile-cover">
                       <img class="img-fluid profile-pic" src="<%= UserImage %>" alt="profile">
</div>
<div class="profile-name">
    <h5 class="user-name"><%= UserName %></h5>
    <h6><%= UserEmail %></h6>
</div>

                        <ul class="profile-list">
                            <li>
                                <i class="ri-user-3-line"></i>
                                <a href="profile.aspx">Change Profile</a>
                            </li>
                            <li class="active">
                                <i class="ri-shopping-bag-3-line"></i>
                                <a href="my-order.aspx">My Order</a>
                            </li>
                        
                            <li>
                                <i class="ri-question-line"></i><a href="faq.aspx">Help</a>
                            </li>
                          
                            <li>
                                <i class="ri-logout-box-r-line"></i>
                                <a href="logout.aspx" data-bs-toggle="modal">Log Out</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="my-order-content">
                        <div class="title">
                            <div class="loader-line"></div>
                            <h3>My Order</h3>
                        </div>
                       <ul class="order-box-list">
    <asp:Repeater ID="rptOrders" runat="server">
        <ItemTemplate>
            <li>
                <div class="order-box">
                    <div class="order-box-content">
                        <div class="brand-icon">
                            <img class="img-fluid icon"
                                 src="assets/images/icons/brand2.png" />
                        </div>

                        <div class="order-details">
                            <div class="d-flex align-items-center justify-content-between w-100">
                                <h5 class="brand-name dark-text fw-medium">
                                    <%# Eval("RestaurantName") %>
                                </h5>
                                <h6 class="fw-medium content-color text-end">
                                    <%# Convert.ToDateTime(Eval("CreatedAt"))
                                           .ToString("dd MMM yyyy, hh:mm tt") %>
                                </h6>
                            </div>

                            <h6 class="fw-medium dark-text">
                                <span class="fw-normal content-color">
                                    Order ID :
                                </span>
                                #<%# Eval("OrderID") %>
                            </h6>

                            <h6 class="fw-medium dark-text">
                                <span class="fw-normal content-color">
                                    Status :
                                </span>
                                <%# Eval("OrderStatus") %>
                            </h6>
                        </div>
                    </div>

                    <div class="d-flex align-items-center justify-content-between mt-sm-3 mt-2">
                        <h6 class="fw-medium dark-text">
                            <span class="fw-normal content-color">
                                Total Amount :
                            </span>
                            ₹ <%# Eval("TotalAmount") %>
                        </h6>

                        <a href='order-tracking.aspx?oid=<%# Eval("OrderID") %>'
   class="btn theme-outline details-btn">
    Track
</a>

<%# 
(Eval("OrderStatus").ToString() == "Placed" 
 || Eval("OrderStatus").ToString() == "Preparing")
? "<a href='cancel-order.aspx?oid=" + Eval("OrderID") + 
  "' class='btn btn-danger btn-sm ms-2'>Cancel</a>"
: ""
%>

                    </div>
                </div>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- profile section end -->

</asp:Content>

