<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="confirm-order.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Confirm Order</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        Confirm Order
                    </li>
                </ol>
            </nav>
        </div>
    </section>
    <!-- page head section end -->

    <!--  account section starts -->
    <section class="account-section section-b-space pt-0">
        <div class="container">
            <div class="layout-sec">
                <div class="row g-lg-4 g-4">
                    <div class="col-lg-8">
                        <div class="process-section">
                            <ul class="process-list">
                                <li class="done">
                                    <a href="checkout.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/user.svg" alt="user">
                                        </div>
                                        <h6>Account</h6>
                                    </a>
                                </li>
                                <li class="done">
                                    <a href="address.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/location-active.svg"
                                                alt="location">
                                        </div>
                                        <h6>Address</h6>
                                    </a>
                                </li>
                                <li class="done">
                                    <a href="payment.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/wallet-add-active.svg"
                                                alt="wallet-add">
                                        </div>
                                        <h6>Payment</h6>
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="confirm-order.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/verify-active.svg"
                                                alt="verify">
                                        </div>
                                        <h6>Confirm</h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="account-part confirm-part">
                            <img class="img-fluid account-img w-25" src="assets/images/gif/confirm.gif" alt="confirm">
                            <h3>Your order has been successfully placed</h3>
<p>
    Order ID : <strong>#<%= OrderID %></strong>
</p>

                            <p>
                                Sit and relax while your order is being worked on. It’ll take
                                5 min before you get it.
                            </p>
                            <div class="account-btn d-flex justify-content-center gap-2">
                                <a href="order-tracking.aspx?oid=<%= OrderID %>" class="btn theme-btn mt-0">
    TRACK ORDER
</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="order-summery-section sticky-top">
                            <div class="checkout-detail">
                                <div class="cart-address-box">
                                    <div class="add-img">
                                        <img class="img-fluid img sm-size" src="assets/images/svg/location.svg"
                                            alt="rp1">
                                    </div>
                                    <div class="add-content">
                                        <div class="d-flex align-items-center justify-content-between">
                                        <h5 class="dark-text deliver-place">
    Deliver to : <%= AddressTitle %>
</h5>
                                        </div>
                                     <h6 class="address mt-2 content-color">
    <%= FullAddress %>
</h6>
                                    </div>
                                </div>
                                <div class="cart-address-box mt-3">
                                    <div class="add-img">
                                        <img class="img-fluid img sm-size" src="assets/images/svg/wallet-add.svg"
                                            alt="rp1">
                                    </div>
                                    <div class="add-content">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h5 class="dark-text deliver-place">Payment Method:</h5>
                                        </div>
                                     <h6 class="address mt-2 content-color">
    Cash on Delivery
</h6>

                                    </div>
                                </div>
<ul>
    <asp:Repeater ID="rptItems" runat="server">
        <ItemTemplate>
            <li>
                <div class="horizontal-product-box">
                    <div class="product-content">
                        <div class="d-flex align-items-center justify-content-between">
                            <h5><%# Eval("ItemName") %></h5>
                            <h6 class="product-price">₹ <%# Eval("Total") %></h6>
                        </div>
                        <h6 class="ingredients-text">
                            Qty : <%# Eval("Quantity") %>
                        </h6>
                    </div>
                </div>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>

                                <h5 class="bill-details-title fw-semibold dark-text">
                                    Bill Details
                                </h5>
                                <div class="sub-total">
    <h6 class="content-color fw-normal">Sub Total</h6>
    <h6 class="fw-semibold">₹ <%= GrandTotal %></h6>
</div>

<div class="sub-total">
    <h6 class="content-color fw-normal">Delivery Charge</h6>
    <h6 class="fw-semibold success-color">Free</h6>
</div>

<div class="grand-total">
    <h6 class="fw-semibold dark-text">Total</h6>
    <h6 class="fw-semibold amount">₹ <%= GrandTotal %></h6>
</div>

                                <img class="dots-design" src="assets/images/svg/dots-design.svg" alt="dots">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- account section end -->


</asp:Content>

