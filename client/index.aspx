<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <!-- home section start -->
    <section id="home" class="home-wrapper section-b-space overflow-hidden">
        <div class="background-effect">
            <div class="main-circle">
                <div class="main-circle circle-1">
                    <div class="main-circle circle-2"></div>
                </div>
            </div>
        </div>
        <div class="container text-center position-relative">
            <h1>Zomo</h1>
            <h2>Discover restaurants that deliver near you</h2>
            <div class="search-section">
                <form class="auth-form search-head" target="_blank">
                    <div class="form-group">
                        <div class="form-input mb-0">
                           <asp:TextBox ID="txtSearch" runat="server"
    CssClass="form-control search"
    placeholder="Search for Restaurant"></asp:TextBox>


                        </div>
                    </div>
                </form>
               
<asp:Button ID="btnSearch" runat="server"
    CssClass="btn theme-btn mt-0"
    Text="Search"
    OnClick="btnSearch_Click" />
            </div>
            <ul class="home-features-list d-md-flex d-none">
                <li>
                    <div class="home-features-box">
                        <img class="img-fluid icon" src="assets/images/svg/routing.svg" alt="routing">
                        <h6>Wide Map</h6>
                    </div>
                </li>
                <li>
                    <div class="home-features-box">
                        <img class="img-fluid icon" src="assets/images/svg/3d-rotate.svg" alt="3d-rotate">
                        <h6>Easiest Order</h6>
                    </div>
                </li>
                <li>
                    <div class="home-features-box">
                        <img class="img-fluid icon" src="assets/images/svg/truck.svg" alt="truck">
                        <h6>Most Delivery</h6>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- home section end -->

    <!-- categories section starts -->
    <section class="categories-section section-b-space">
        <img src="assets/images/scooter.png" class="scooter-img img-fluid d-md-inline-block d-none"
            alt="animation-scooter">
        <div class="container">
            <div class="title">
                <h2>Categories</h2>
                <div class="loader-line"></div>
                <div class="sub-title">
                    <p>
                        Browse out top categories here to discover different food cuision.
                    </p>
                </div>
            </div>
            <div class="theme-arrow">
                <div class="swiper categories-slider categories-style">
                    <div class="swiper-wrapper">
                        <asp:Repeater ID="rptCategories" runat="server">
<ItemTemplate>
    <div class="swiper-slide">
        <a href="restaurant-listing.aspx?cat=<%# Eval("GlobalCategoryID") %>" class="food-categories">
            <img class="img-fluid categories-img" src='/Admin/assets/images/Category/<%# Eval("CategoryImage") %>' />
            <h4 class="dark-text"><%# Eval("CategoryName") %></h4>
        </a>
    </div>
</ItemTemplate>
</asp:Repeater>

                    </div>
                </div>
                <div class="swiper-button-next categories-next"></div>
                <div class="swiper-button-prev categories-prev"></div>
            </div>
        </div>
    </section>
    <!-- categories section end -->

    <!-- banner section starts -->
    <section class="banner-section section-b-space">
        <div class="container">
            <div class="title">
                <h2>Today’s Deal</h2>
                <div class="loader-line"></div>
                <div class="sub-title">
                    <p>Take a benefit from our latest offers.</p>
                </div>
            </div>
            <div class="position-relative">
                <div class="swiper banner1-slider">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="banner-part">
                                <a href="offer.html">
                                    <img class="img-fluid banner-img" src="assets/images/banner/banner1.jpg"
                                        alt="banner">
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="banner-part">
                                <a href="offer.html">
                                    <img class="img-fluid banner-img" src="assets/images/banner/banner2.jpg"
                                        alt="banner">
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="banner-part">
                                <a href="offer.html">
                                    <img class="img-fluid banner-img" src="assets/images/banner/banner3.jpg"
                                        alt="banner">
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="banner-part">
                                <a href="offer.html">
                                    <img class="img-fluid banner-img" src="assets/images/banner/banner4.jpg"
                                        alt="banner">
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="banner-part">
                                <a href="offer.html">
                                    <img class="img-fluid banner-img" src="assets/images/banner/banner5.jpg"
                                        alt="banner">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner section end -->

    <!-- brand section starts -->
    <section class="brand-section section-b-space">
        <img class="img-fluid item-4" src="assets/images/svg/item4.svg" alt="item-4">
        <div class="container">
            <div class="title">
                <h2>Brand For You</h2>
                <div class="loader-line"></div>
                <div class="sub-title">
                    <p>
                        Browse out top brands here to discover different food cuision.
                    </p>
                </div>
            </div>
            <div class="theme-arrow">
                <div class="swiper brands-logo">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand1.png" alt="brand1">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>La Pino’z</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand2.png" alt="brand2">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Mc'd</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand3.png" alt="brand3">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Starbucks</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand4.png" alt="brand2">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Pizza Hut</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand5.png" alt="brand2">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Wendy's</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand6.png" alt="brand6">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Burger King</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand7.png" alt="brand7">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Subway</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand8.png" alt="brand8">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Domino's</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand9.png" alt="brand9">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Taco Bell</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand10.png" alt="brand5">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>Chipotle</h4>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="brand-box">
                                <a href="menu-listing.html" class="food-brands">
                                    <img class="img-fluid brand-img" src="assets/images/icons/brand11.png"
                                        alt="brand11">
                                </a>
                                <a href="menu-listing.html">
                                    <h4>KFC</h4>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next brand-next"></div>
                <div class="swiper-button-prev brand-prev"></div>
            </div>
        </div>
    </section>
    <!-- brand section end -->

    <!-- popular restaurant section starts -->
  <section class="popular-restaurant banner-section section-b-space overflow-hidden">
    <div class="container">

                  <div class="title restaurant-title w-border pb-0">
                <h2>Order Your Food</h2>
                <div class="loader-line"></div>
            </div>

        <div class="row g-md-4 g-3">
            <asp:Repeater ID="rptRestaurants" runat="server">
                <ItemTemplate>
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="vertical-product-box">

                            <div class="vertical-product-box-img ratio3_2">
                                <a href="menu-listing.aspx?id=<%# Eval("RestaurantID") %>">
                                    <img class="product-img-top bg-img"
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

                                <div class="location-distance d-flex align-items-center justify-content-between">
                                    <h5 class="place"><%# Eval("Address") %></h5>
                                    <ul class="distance">
                                        <li>
                                            <i class="ri-wallet-line"></i>
                                           Cost For Two ₹ <%# Eval("CostForTwo") %>
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

    <!-- popular restaurant section end -->

    

    <!-- app section starts -->
    <section class="app-section">
        <div class="container">
            <div class="d-flex align-items-center">
                <div class="app-img">
                    <img class="img-fluid phone" src="assets/images/service-phone.png" alt="app-phone">
                </div>
                <div class="app-content">
                    <h2>Zomo App : Online & Mobile Ordering</h2>
                    <h5>
                        Get the app for free and place takeout orders online whenever you
                        want.
                    </h5>
                    <div class="app-buttons d-flex align-items-center gap-3">
                        <a href="https://www.apple.com/in/app-store/">
                            <img class="img-fluid app-btn" src="assets/images/svg/app-store.svg" alt="app-store">
                        </a>
                        <a href="https://play.google.com/store/apps">
                            <img class="img-fluid app-btn" src="assets/images/svg/google-play.svg" alt="google-play">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- app section end -->

  

</asp:Content>

