<%@ Page Title="" Language="C#" 
    MasterPageFile="~/Vendor/vendor.master"
    AutoEventWireup="true"
    CodeFile="index.aspx.cs"
    Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <!-- Page Body Start-->
        <div class="page-body-wrapper">
           

            <!-- index body start -->
            <div class="page-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xxl-3 col-xl-4 col-md-4 col-12">
                            <div class="card p-0">
                                <div class="cadr-body">
                                    <div class="welcome-card">
                                        <div>
                                            <h5> Exclusive weekend discounts</h5>
                                            <h3>Welcome To Zomo</h3>
                                            <a href="category.aspx" class="btn btn-primary w-50 mx-auto">Check Menu</a>
                                            <img class="offer" src="assets/images/dashboard/offer.gif" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-9 col-xl-8 col-md-8 col-12">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                      <%--  <div class="card-header">
                                            <h5>Menu category</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="categories-section">
                                                <div class="theme-arrow">
                                                    <div class="swiper categories-slider categories-style">
                                                        <div class="swiper-wrapper">
                                                            <asp:ListView ID="ListView1" runat="server">
                                                            <ItemTemplate>
                                                            <div class="swiper-slide">
                                                                <a href="category.aspx" class="food-categories">
                                                                    <img class="img-fluid categories-img" src="../zomo Admin/assets/images/Category/<%# Eval("CategoryImage") %>" alt="p-1">
                                                                    <h4 class="dark-text"><%# Eval("CategoryName") %></h4>
                                                                </a>
                                                            </div>
                                                                </ItemTemplate>
                                                         </asp:ListView>
                                                        </div>
                                                    </div>
                                                    <div class="swiper-button-next categories-next"></div>
                                                    <div class="swiper-button-prev categories-prev"></div>
                                                </div>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="col-xxl-4 col-sm-6 ">
                                    <div class="card widgets-card">
                                        <div class="card-body">
                                           <div class="row align-items-center">
                                                <div class="col-lg-5 d-flex d-lg-block justify-content-between align-items-center">
                                                        <h5>Total Sale</h5>
                                                        <h2 runat="server" id="lblTotalSale"></h2>
                                                </div>
                                                <div class="col-lg-7 col-12 p-0">
                                                    <div id="daily-value"></div>
                                                </div>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-4 col-sm-6 ">
                                    <div class="card widgets-card">
                                        <div class="card-body">
                                           <div class="row align-items-center">
                                                <div class="col-lg-5 d-flex d-lg-block justify-content-between align-items-center">
                                                        <h5>Total Profit</h5>
                                                       <h2 runat="server" id="lblTotalProfit"></h2>
                                                </div>
                                                <div class="col-lg-7 col-12 p-0">
                                                    <div id="order-value"></div>
                                                </div>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-4 col-xl-6 d-none d-xxl-block">
                                    <div class="card widgets-card">
                                        <div class="card-body">
                                           <div class="row align-items-center">
                                                <div class="col-5">
                                                        <h5>Customer rate</h5>
                                                       <h2 runat="server" id="lblCustomerRate"></h2>

                                                </div>
                                                <div class="col-7 p-0">
                                                    <div id="admissionRatio"></div>
                                                </div>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-7">
                            <div class="card">
                                <div class="card-header">
                                    <h5>Order Reports</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive theme-scrollbar">
                                        <div>
                                            <table class="table user-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th><input id="checkall​" class="custom-checkbox" type="checkbox" name="text"></th>
                                                        <th>Food</th>
                                                        <th>Customer</th>
                                                        <th>Order Date</th>
                                                        <th>Price</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
<asp:Repeater ID="rptOrders" runat="server">
<ItemTemplate>
<tr>
    <td><input class="custom-checkbox" type="checkbox" /></td>

    <td>
        <div class="table-image">
            <img src='../Vendor/assets/images/product/<%# Eval("MainImage") %>' class="img-fluid" />
            <h5><%# Eval("FoodName") %></h5>
        </div>
    </td>

    <td><%# Eval("CustomerName") %></td>

    <td><%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd/MM/yyyy") %></td>

    <td>₹<%# Eval("TotalAmount") %></td>

    <td>
        <div class="status">
                <%# Eval("OrderStatus") %>

        </div>
    </td>
</tr>
</ItemTemplate>
</asp:Repeater>
</tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5">
                            <div class="card">
                                <div class="card-header mb-0">
                                    <h5>Sales Figures</h5>
                                </div>
                                <div class="card-body">
                                    <div id="earning-average"></div>
                                    <div class="special-items-box">
                                        <h5>Today's Special Dish</h5>
                                        <div class="dish-img"> </div>
                                        <h6>Spicy Burger with Extra Cheese</h6>
                                        <ul>
                                            <li>₹10.53</li>
                                            <li>
                                                <i class="ri-heart-fill"></i>
                                                200k</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="trending-orders">
                                <div class="trnding-title">
                                    <h5>Trending orders</h5>
                                    <a href="media.aspx">View All
                                        <i class="ri-arrow-right-s-line"></i>
                                    </a>
                                </div>
                                <div class="swiper trending-slider">
                                    <div class="swiper-wrapper">
                                    <asp:Repeater ID="rptTrending" runat="server">
<ItemTemplate>
<div class="swiper-slide trending-box">
    <div class="card-body trending-items">
        <img class="img-fluid product-img" src="../Vendor/assets/images/product/<%# Eval("MainImage") %>" width="70" />

        <div class="d-flex align-items-center justify-content-between">
            <h5><%# Eval("FoodName") %></h5>
            <h6>₹<%# Eval("OfferPrice") %></h6>
        </div>

        <p>Top trending food item</p>

        <ul class="rating">
            <li>
                <h6>200 <span>Sale</span></h6>
            </li>
            <li>
                <p><i class="ri-star-fill"></i> 4.5</p>
            </li>
        </ul>
    </div>
</div>
</ItemTemplate>
</asp:Repeater>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->

                <!-- footer start-->
                <div class="container-fluid">
                    <footer class="footer">
                        <div class="row">
                            <div class="col-md-12 footer-copyright text-center">
                                <p class="mb-0">Copyright 2024 ©Zomo template by pixelstrap</p>
                            </div>
                        </div>
                    </footer>
                </div>
                <!-- footer End-->
            </div>
            <!-- index body end -->

        </div>
        <!-- Page Body End -->
    </div>
    <!-- page-wrapper End-->

  

    <!-- Theme js -->
    <script src="assets/js/script.js"></script>
    <script>
        ₹("#checkall").change(function () {
            var checked = ₹(this).is(":checked");
            if (checked) {
                ₹(".custom-checkbox").each(function () {
                    ₹(this).prop("checked", true);
                });

            } else {
                ₹(".custom-checkbox").each(function () {
                    ₹(this).prop("checked", false);
                });
            }
        });
      </script>
</asp:Content>

