<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master" AutoEventWireup="true" CodeFile="menu-listing.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style>
        /* ===== MENU LISTING PRODUCT IMAGE FIX ===== */

.vertical-product-box-img {
    height: 180px;
    overflow: hidden;
    border-radius: 12px;
    background: #f7f7f7;
    display: flex;
    align-items: center;
    justify-content: center;
}

.vertical-product-box-img img {
    width: 100%;
    height: 100%;
    object-fit: contain;   /* 🔥 IMPORTANT */
}
/* ===== LEFT CATEGORY FILTER UI ===== */

.filter-box {
    background: #ffffff;
    border-radius: 14px;
    padding: 20px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
    position: sticky;
    top: 90px;
}

.filter-box h5 {
    font-size: 18px;
    font-weight: 600;
    color: #222;
    margin-bottom: 15px;
}

.filter-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.filter-list li {
    margin-bottom: 10px;
}

.filter-list li a {
    display: block;
    padding: 10px 14px;
    border-radius: 10px;
    font-size: 14px;
    font-weight: 500;
    color: #555;
    background: #f6f6f6;
    transition: all 0.25s ease;
    text-decoration: none;
}

.filter-list li a:hover {
    background: #ff8d2f;
    color: #fff;
}
.filter-list li a.active {
    background: #ff8d2f;
    color: #fff;
}

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
  <!-- PAGE TITLE -->
<section class="page-head-section">
    <div class="container text-center">
        <h2 class="text-white">
            <asp:Literal ID="litRestaurantName" runat="server"></asp:Literal>
        </h2>
    </div>
</section>

<section class="restaurant-list section-b-space ratio3_2">
    <div class="container">
        <div class="row">

            <!-- LEFT : CATEGORY LIST -->
            <div class="col-xl-3 col-lg-4 col-md-5">
                <div class="filter-box">
                    <h5 class="mb-3">Categories</h5>

                    <ul class="filter-list">
                        <asp:Repeater ID="rptCategories" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href="menu-listing.aspx?id=<%= Request.QueryString["id"] %>&cat=<%# Eval("CategoryID") %>">
                                        <%# Eval("CategoryName") %>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>

            <!-- RIGHT : PRODUCTS -->
            <div class="col-xl-9 col-lg-8 col-md-7">
                <div class="row g-md-4 g-3">

                    <asp:Repeater ID="rptProducts" runat="server">
                        <ItemTemplate>

                            <div class="col-xl-4 col-lg-6 col-sm-6">
                                <div class="vertical-product-box">

                                    <!-- IMAGE -->
                                    <div class="vertical-product-box-img">
                                        <img class="product-img-top w-100 bg-img"
                                             src="assets/images/product/<%# Eval("MainImage") %>"
                                             alt="<%# Eval("FoodName") %>" />
                                    </div>

                                    <!-- BODY -->
                                    <div class="vertical-product-body">
                                        <h4 class="vertical-product-title">
                                            <%# Eval("FoodName") %>
                                        </h4>

                                        <div class="price">
                                            ₹ <%# Eval("OfferPrice").ToString() == "0"
                                                    ? Eval("Price")
                                                    : Eval("OfferPrice") %>
                                        </div>

                                      <asp:LinkButton ID="LinkButton1" 
    runat="server"
    CssClass="btn theme-btn add-cart-btn"
    CommandArgument='<%# Eval("FoodID") %>'
    OnCommand="AddToCart">
    Add to Cart
</asp:LinkButton>

                                    </div>

                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

        </div>
    </div>
</section>



    <script>
        function showRestaurantWarning() {
            alert("Your cart contains items from another restaurant. Cart has been cleared.");
        }
</script>



    <!-- bootstrap js -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- swiper js -->
    <script src="assets/js/swiper-bundle.min.js"></script>
    <script src="assets/js/custom-swiper.js"></script>

    <!-- footer accordion js -->
    <script src="assets/js/footer-accordion.js"></script>

    <!-- menu button js -->
    <script src="assets/js/menu-button.js"></script>

    <!-- fancybox js -->
    <script src="assets/js/fancybox.js"></script>

    <!-- toast js -->
    <script src="assets/js/toast.js"></script>

    <!-- script js -->
    <script src="assets/js/script.js"></script>

</asp:Content>

