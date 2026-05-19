<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="order-list.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
        <!-- Page Body Start-->
        <div class="page-body-wrapper">
          
            <!-- Order section Start -->
            <div class="page-body">
                <!-- Table Start -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <div class="title-header option-title">
                                        <h5>Order List</h5>
                                        <a href="#" class="btn btn-dashed">Download all orders</a>
                                    </div>
                                    <div>
                                        <div class="table-responsive theme-scrollbar">
                                            <table class="table category-table dataTable no-footer" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>Order Image</th>
                                                        <th>Order Code</th>
                                                        <th>Date</th>
                                                        <th>Payment Method</th>
                                                        <th>Delivery Status</th>
                                                        <th>Amount</th>
                                                        <th class="text-center">Option</th>
                                                        <th>Tracking</th>
                                                        <th>Order-tracking</th>
                                                    </tr>
                                                </thead>

                                               <tbody>
    <asp:Repeater ID="RepeaterOrders" runat="server">
        <ItemTemplate>
            <tr>
                <td>
                    <img src='../Vendor/assets/images/product/<%# Eval("MainImage") %>' class="order-image" />

                </td>

                <td><%# Eval("OrderCode") %></td>
                <td><%# Eval("OrderDate", "{0:MMM dd, yyyy}") %></td>
                <td><%# Eval("PaymentMethod") %></td>

                <td class='<%# Eval("DeliveryStatus").ToString()=="Success" ? "order-success":"order-pending" %>'>
                    <span><%# Eval("DeliveryStatus") %></span>
                </td>

                <td>₹<%# Eval("Amount") %></td>

                <td>
                    <ul>
                        <li>
                            <a href="order-detail.aspx?orderID=<%# Eval("OrderID") %>">
                                <i class="ri-eye-line"></i>
                            </a>
                        </li>

                        <li>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("OrderID") %>'
                                OnClick="DeleteOrder">
                                <i class="ri-delete-bin-line"></i>
                            </asp:LinkButton>
                        </li>
                    </ul>
                </td>

                <td>
                    <a class="btn btn-sm btn-dashed text-white"
                       href="order-tracking.aspx?orderID=<%# Eval("OrderID") %>">
                        Tracking
                    </a>
                </td>
                           <td>
                    <a class="btn btn-sm btn-dashed text-white"
                      href="order-detail.aspx?orderID=<%# Eval("OrderID") %>">
                        order-detail
                    </a>
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
                    </div>
                </div>
                <!-- Table End -->


    <!-- latest js -->
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap js -->
    <script src="assets/js/bootstrap/bootstrap.bundle.min.js"></script>

    <!-- feather icon js -->
    <script src="assets/js/icons/feather-icon/feather.min.js"></script>
    <script src="assets/js/icons/feather-icon/feather-icon.js"></script>

    <!-- customizer js -->
    <script src="assets/js/customizer.js"></script>

    <!-- scrollbar simplebar js -->
    <script src="assets/js/scrollbar/simplebar.js"></script>
    <script src="assets/js/scrollbar/custom.js"></script>

    <!-- Sidebar js -->
    <script src="assets/js/config.js"></script>

     <!-- Plugins JS -->
    <script src="assets/js/sidebar-menu.js"></script>
    <!-- Data table js -->
    <script src="assets/js/jquery.dataTables.js"></script>
    <script src="assets/js/custom-data-table.js"></script>

    <!-- all checkbox select js -->
    <script src="assets/js/checkbox-all-check.js"></script>

    <!-- Theme js -->
    <script src="assets/js/script.js"></script>


</asp:Content>

