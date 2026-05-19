<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="coupon-list.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <!-- Page Body Start-->
        <div class="page-body-wrapper">
        
            <!-- Coupon list table starts-->
            <div class="page-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <div class="title-header option-title">
                                        <h5>Coupon List</h5>
                                        <div class="right-options">
                                            <ul>
                                                <li>
                                                    <a class="btn btn-dashed" href="add-new-product.aspx">Add Coupon</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="table-responsive theme-scrollbar">
                                            <table class="table category-table dataTable no-footer"
                                                id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <input id="checkall" class="custom-checkbox" type="checkbox" name="text">
                                                        </th>
                                                        <th>Title</th>
                                                        <th>Code</th>
                                                        <th>Discount</th>
                                                        <th>Status</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
    <asp:Repeater ID="rptCoupons" runat="server">
        <ItemTemplate>
            <tr>
                <td>
                    <input class="custom-checkbox" type="checkbox" />
                </td>

                <td><%# Eval("Title") %></td>

                <td><%# Eval("CouponCode") %></td>

                <td class="font-secondary"><%# Eval("DiscountValue") %></td>

            <%--    <td class="menu-status">
                    <%# Eval("Status").ToString() == "Success" 
                        ? "<span class='success'>Success</span>" 
                        : "<span class='danger'>Restitute</span>" %>
                </td>--%>

                <td>
                    <ul>
                        <li>
                            <a href='create-coupon.aspx?id=<%# Eval("CouponID") %>'>
                                <i class="ri-pencil-line"></i>
                            </a>
                        </li>

                        <li>
                            <a href='coupon-list.aspx?delete=<%# Eval("CouponID") %>'>
                                <i class="ri-delete-bin-line"></i>
                            </a>
                        </li>
                    </ul>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- Pagination End -->
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
            </div>
            <!-- footer end-->
        </div>

        <!-- Modal Start -->
        <div class="modal theme-modal fade" id="staticBackdrop" tabindex="-1" role="dialog" aria-modal="true">
            <div class="modal-dialog modal-md modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>Logging Out</h5>
                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <i class="ri-close-line"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to log out?</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-cancel" type="button" data-bs-dismiss="modal"
                        aria-label="Close">No</button>
                        <button class="btn btn-submit" type="submit" data-bs-dismiss="modal" aria-label="Close">Yes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->
    </div>
    <!-- page-wrapper End -->

    <!-- Delete Modal Box Start -->
    <div class="modal fade theme-modal remove-coupon" id="exampleModalToggle" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header d-block text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel22">Are You Sure ?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="remove-box">
                        <p>The permission for the use/group, preview is inherited from the object, object will create a
                            new permission for this object</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-dismiss="modal">No</button>
                    <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-target="#exampleModalToggle2"
                        data-bs-toggle="modal" data-bs-dismiss="modal">Yes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade theme-modal remove-coupon" id="exampleModalToggle2" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="exampleModalLabel12">Done!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="remove-box text-center">
                        <div class="wrapper">
                            <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                            </svg>
                        </div>
                        <h4 class="text-content">It's Removed.</h4>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Delete Modal Box End -->

    <!-- latest js -->
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap js -->
    <script src="assets/js/bootstrap/bootstrap.bundle.min.js"></script>

    <!-- feather icon js -->
    <script src="assets/js/icons/feather-icon/feather.min.js"></script>
    <script src="assets/js/icons/feather-icon/feather-icon.js"></script>

    <!-- scrollbar simplebar js -->
    <script src="assets/js/scrollbar/simplebar.js"></script>
    <script src="assets/js/scrollbar/custom.js"></script>

    <!-- customizer js -->
    <script src="assets/js/customizer.js"></script>

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
    <script>
        $("#checkall").change(function () {
            var checked = $(this).is(":checked");
            if (checked) {
                $(".custom-checkbox").each(function () {
                    $(this).prop("checked", true);
                });

            } else {
                $(".custom-checkbox").each(function () {
                    $(this).prop("checked", false);
                });
            }
        });
      </script>


</asp:Content>

