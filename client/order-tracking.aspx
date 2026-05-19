<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="order-tracking.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   <style>

       .process-list.vertical li {
    list-style: none;
    padding: 12px 0;
    border-left: 3px solid #ddd;
    margin-left: 12px;
    padding-left: 25px; /* ⬅️ yaha gap badhaya */
    position: relative;
}

.process-list.vertical li span {
    margin-left: 8px; /* ⬅️ circle aur text ke beech gap */
    display: inline-block;
}

.process-list.vertical li::before {
    content: '';
    width: 12px;
    height: 12px;
    background: #ddd;
    border-radius: 50%;
    position: absolute;
    left: -7px;
    top: 18px;
}



.process-list.vertical li.done {
    border-color: #ff8d2f;
    color: #ff8d2f;
    font-weight: 600;
}

.process-list.vertical li.done::before {
    background: #ff8d2f;
}
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Order Tracking</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        Order Tracking
                    </li>
                </ol>
            </nav>
        </div>
    </section>
    <!-- page head section end -->

    <!-- order tracking section starts -->
    <section class="section-b-space">
        <div class="container">
            <div class="row">

                <% if (OrderStatus == "Cancelled") { %>
<div class="alert alert-danger">
    This order has been cancelled.
</div>
<% } %>



               <div class="col-xl-7">
    <div class="order-progress-box p-4 bg-white rounded-3 shadow-sm">
        <h4 class="mb-4">Order Progress</h4>

     <% if (OrderStatus != "Cancelled") { %>

<ul class="process-list vertical">
    <li class="<%= StepClass("Placed") %>"><span>Order Placed</span></li>
    <li class="<%= StepClass("Preparing") %>"><span>Preparing Food</span></li>
    <li class="<%= StepClass("Out for Delivery") %>"><span>Out for Delivery</span></li>
    <li class="<%= StepClass("Delivered") %>"><span>Delivered</span></li>
</ul>

<% } %>

    </div>
</div>

               <div class="col-xl-5">
    <div class="order-summery-section sticky-top">
        <div class="checkout-detail">

            <!-- Address -->
            <div class="cart-address-box">
                <div class="add-content">
                    <h5>Deliver to : <%= AddressTitle %></h5>
                    <h6 class="content-color"><%= FullAddress %></h6>
                </div>
            </div>

            <!-- Payment -->
            <div class="cart-address-box mt-3">
                <div class="add-content">
                    <h5>Payment Method</h5>
                    <h6 class="content-color">Cash on Delivery</h6>
                </div>
            </div>

            <!-- Items -->
            <ul class="mt-3">
                <asp:Repeater ID="rptItems" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="horizontal-product-box">
                                <div class="product-content">
                                    <div class="d-flex justify-content-between">
                                        <h5><%# Eval("ItemName") %></h5>
                                        <h6>₹ <%# Eval("Total") %></h6>
                                    </div>
                                    <h6 class="content-color">
                                        Qty : <%# Eval("Quantity") %>
                                    </h6>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

            <!-- Bill -->
            <div class="grand-total mt-3">
                <h5>Total Amount</h5>
                <h4 class="theme-color">₹ <%= GrandTotal %></h4>
            </div>

        </div>
    </div>
</div>

            </div>
        </div>
    </section>
    <!-- order tracking section end -->


</asp:Content>

