<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Checkout</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
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
                                <li class="active">
                                    <a href="checkout.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/user.svg" alt="user">
                                        </div>
                                        <h6>Account</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="address.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/location.svg"
                                                alt="location">
                                        </div>
                                        <h6>Address</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="payment.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/wallet-add.svg"
                                                alt="wallet-add">
                                        </div>
                                        <h6>Payment</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="confirm-order.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/verify.svg" alt="verify">
                                        </div>
                                        <h6>Confirm</h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                  <div class="account-part">
    
    <!-- IMAGE ALWAYS VISIBLE -->
    <img class="img-fluid account-img" src="assets/images/account.svg" alt="account">

    <!-- TEXT + BUTTONS (LOGIN CHECK) -->
    <div class="title mb-0" runat="server" id="divAccountText">
        <div class="loader-line"></div>
        <h3>Account</h3>
        <p>
            To place your order now, log in to in your existing account
            or sign up
        </p>
        <div class="account-btn d-flex justify-content-center gap-2">
            <a href="signin.aspx" class="btn theme-outline mt-0">SIGN IN</a>
            <a href="signup.aspx" class="btn theme-outline mt-0">SIGN UP</a>
        </div>
    </div>

</div>

                    </div>
                    <div class="col-lg-4">
                        <div class="order-summery-section sticky-top">
                            <div class="checkout-detail">
                                <ul>
                                   <asp:Repeater ID="rptCheckoutItems" runat="server">
    <ItemTemplate>
        <li>
            <div class="horizontal-product-box">
                <div class="product-content">
                    <div class="d-flex align-items-center justify-content-between">
                        <h5><%# Eval("ItemName") %></h5>
                        <h6 class="product-price">₹ <%# Eval("Price") %></h6>
                    </div>
                    <h6 class="ingredients-text">Qty: <%# Eval("Quantity") %></h6>
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
                                    <h6 class="content-color fw-normal">
                                        Delivery Charge
                                    </h6>
                                    <h6 class="fw-semibold success-color">Free</h6>
                                </div>
                               
                                <div class="sub-total">
                                    <h6 class="content-color fw-normal">Sub Total</h6>
                               <h6 class="fw-semibold" id="lblSubTotal" runat="server"></h6>
                                </div>
                                
                                <div class="grand-total">
                                    <h6 class="fw-semibold dark-text">To Pay</h6>
                                   <h6 class="fw-semibold amount" id="lblGrandTotal" runat="server"></h6>
                                </div>
                                <a href="address.aspx" class="btn theme-btn restaurant-btn w-100 rounded-2">CHECKOUT</a>
                                <img class="dots-design" src="assets/images/svg/dots-design.svg" alt="dots">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- account section end --

</asp:Content>

