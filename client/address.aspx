<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Address</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Address</li>
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
                                <li class="active">
                                    <a href="address.aspx">
                                        <div class="process-icon">
                                            <img class="img-fluid icon" src="assets/images/svg/location-active.svg"
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

                        <div class="address-section">
                            <div class="title">
                                <div class="loader-line"></div>
                                <h3>Select Saved Address</h3>
                                <h6>
                                    You’ve add some address before, You can select one of below.
                                </h6>
                            </div>
                          <div class="row g-3">

    <asp:Repeater ID="rptAddress" runat="server">
        <ItemTemplate>
            <div class="col-md-6">
                <div class="address-box">
                    <div class="address-title">
                        <div class="d-flex align-items-center gap-2">
                            <i class="ri-home-4-fill icon"></i>
                            <h6><%# Eval("Title") %></h6>
                        </div>
                    </div>

                    <div class="address-details">
                        <h6><%# Eval("FullAddress") %></h6>
                        <h6 class="phone-number"><%# Eval("Phone") %></h6>

                        <div class="option-section">
                            <asp:LinkButton 
                                ID="btnDeliver" 
                                runat="server"
                                CssClass="btn gray-btn rounded-2 mt-0"
                                CommandArgument='<%# Eval("AddressID") %>'
                                OnCommand="SelectAddress">
                                Deliver Here
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <!-- ADD NEW ADDRESS BOX -->
    <div class="col-md-6">
        <div class="address-box new-address-box">
            <a href="#addAddressModal" class="btn theme-outline rounded-2"
               data-bs-toggle="modal">
                Add New Address
            </a>
        </div>
    </div>

</div>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="order-summery-section sticky-top">
                            <div class="checkout-detail">
                                <ul>
                              <ul>
    <asp:Repeater ID="rptCart" runat="server">
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
    <h6 class="fw-semibold">₹ <%= SubTotal %></h6>
</div>

<div class="sub-total">
    <h6 class="content-color fw-normal">Delivery Charge</h6>
    <h6 class="fw-semibold success-color">Free</h6>
</div>

<div class="grand-total">
    <h6 class="fw-semibold dark-text">To Pay</h6>
    <h6 class="fw-semibold amount">₹ <%= SubTotal %></h6>
</div>


                                <a href="payment.aspx" class="btn theme-btn restaurant-btn rounded-2 w-100">CHECKOUT</a>

                                <img class="dots-design" src="assets/images/svg/dots-design.svg" alt="dots">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- account section end -->

    <div class="modal fade" id="addAddressModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5>Add Address</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <asp:TextBox ID="txtTitle" runat="server"
                    CssClass="form-control mb-2"
                    placeholder="Home / Office"></asp:TextBox>

                <asp:TextBox ID="txtAddress" runat="server"
                    CssClass="form-control mb-2"
                    TextMode="MultiLine"
                    placeholder="Full Address"></asp:TextBox>

                <asp:TextBox ID="txtPhone" runat="server"
                    CssClass="form-control mb-2"
                    placeholder="Phone Number"></asp:TextBox>

                <asp:Button ID="btnSaveAddress" runat="server"
                    CssClass="btn theme-btn w-100"
                    Text="Save Address"
                    OnClick="SaveAddress_Click" />
            </div>
        </div>
    </div>
</div>

</asp:Content>



