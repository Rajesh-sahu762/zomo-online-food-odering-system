<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- page head -->
<section class="page-head-section">
    <div class="container page-heading">
        <h2 class="h3 mb-3 text-white text-center">Payment</h2>
    </div>
</section>

<section class="account-section section-b-space pt-0">
    <div class="container">
        <div class="layout-sec">
            <div class="row g-lg-4 g-4">

                <!-- ================= LEFT SIDE ================= -->
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
                    <img class="img-fluid icon" src="assets/images/svg/location-active.svg" alt="location">
                </div>
                <h6>Address</h6>
            </a>
        </li>

        <li class="active">
            <a href="payment.aspx">
                <div class="process-icon">
                    <img class="img-fluid icon" src="assets/images/svg/wallet-add-active.svg" alt="wallet-add">
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

                    <!-- PAYMENT -->
                    <div class="payment-section">
                        <div class="title mb-0">
                            <div class="loader-line"></div>
                            <h3>Choose Payment Method</h3>
                            <h6>Cash on Delivery only</h6>
                        </div>

                        <div class="accordion payment-accordion">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button">
                                        Cash on Delivery
                                    </button>
                                </h2>
                                <div class="accordion-body">
                                    <div class="form-check form-check-reverse">
                                        <label class="form-check-label">
                                            <img class="img-fluid img"
                                                 src="assets/images/icons/svg/cash.svg" />
                                            <span class="card-name dark-text">
                                                Pay when order is delivered
                                            </span>
                                        </label>
                                        <input class="form-check-input" type="radio" checked />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ================= RIGHT SIDE ================= -->
                <div class="col-lg-4">
                    <div class="order-summery-section sticky-top">
                        <div class="checkout-detail">

                            <!-- ADDRESS -->
                            <div class="cart-address-box">
                                <div class="add-img">
                                    <img class="img-fluid img" src="assets/images/home.png" />
                                </div>
                                <div class="add-content">
                                    <h5 class="dark-text">
                                        Deliver to : <%= AddressTitle %>
                                    </h5>
                                    <h6 class="address mt-2 content-color">
                                        <%= FullAddress %>
                                    </h6>
                                </div>
                            </div>

                            <!-- ORDER SUMMARY -->
                            <h3 class="fw-semibold dark-text checkout-title">
                                Order Summary
                            </h3>

                            <ul>
                                <asp:Repeater ID="rptOrderSummary" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <div class="horizontal-product-box">
                                                <div class="product-content">
                                                    <div class="d-flex justify-content-between">
                                                        <h5><%# Eval("ItemName") %></h5>
                                                        <h6>₹ <%# Eval("Total") %></h6>
                                                    </div>
                                                    <h6 class="ingredients-text">
                                                        Qty: <%# Eval("Quantity") %>
                                                    </h6>
                                                </div>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>

                            <!-- TOTAL -->
                            <div class="grand-total">
                                <h6 class="fw-semibold dark-text">Total</h6>
                                <h6 class="fw-semibold amount">
                                    ₹ <%= GrandTotal %>
                                </h6>
                            </div>

                            <asp:Button ID="btnPlaceOrder" runat="server"
                                Text="PAY NOW"
                                CssClass="btn theme-btn restaurant-btn w-100 rounded-2"
                                OnClick="PlaceOrder_Click" />

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

</asp:Content>


