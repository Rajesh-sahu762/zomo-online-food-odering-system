<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="restaurant-listing.aspx.cs" Inherits="client_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
<!-- page head section -->
<section class="page-head-section">
    <div class="container page-heading">
        <h2 class="h3 mb-3 text-white text-center">Restaurant Listing</h2>
    </div>
</section>

<!-- restaurant listing -->
<section class="restaurant-list section-b-space ratio3_2">
    <div class="container">

        <div class="title restaurant-title pb-0 w-border">
            <h2>
                <asp:Literal ID="litCategoryName" runat="server" Text="All Restaurants"></asp:Literal>
            </h2>
        </div>

        <div class="row g-lg-4 g-3">

            <asp:Repeater ID="rptRestaurants" runat="server">
                <ItemTemplate>
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="vertical-product-box">

                            <div class="vertical-product-box-img">
                                <a href="menu-listing.aspx?id=<%# Eval("RestaurantID") %>">
                                    <img class="product-img-top w-100 bg-img"
                                         src="../Vendor/assets/images/restaurant/<%# Eval("Logo") %>"
                                         alt="<%# Eval("RestaurantName") %>" />
                                </a>
                            </div>

                            <div class="vertical-product-body">
                                <div class="d-flex align-items-center justify-content-between mt-2">
                                    <h4 class="vertical-product-title">
                                        <%# Eval("RestaurantName") %>
                                    </h4>
                                    <h6 class="rating-star">
                                        <span class="star"><i class="ri-star-s-fill"></i></span>
                                        <%# Eval("AvgRating") %>
                                    </h6>
                                </div>

                                <div class="location-distance d-flex align-items-center justify-content-between pt-2">
                                    <h5 class="place">
                                        <%# Eval("Address") %>
                                    </h5>
                                    <ul class="distance">
                                        <li>
                                            <i class="ri-wallet-line"></i>
                                            ₹ <%# Eval("CostForTwo") %>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</section>

</asp:Content>

