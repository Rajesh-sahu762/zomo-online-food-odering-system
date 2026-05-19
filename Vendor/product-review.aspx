
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="product-review.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



        <!-- Page Body Start-->
        <div class="page-body-wrapper">
   

            <!-- product review section start -->
            <div class="page-body">

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <!-- Table Start -->
                                <div class="card-body">
                                    <div class="title-header option-title">
                                        <h5>Product Reviews</h5>
                                    </div>
                                    <div>
                                        <div class="table-responsive theme-scrollbar">
                                            <table class="table category-table product-review dataTable no-footer"
                                                id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Customer Name</th>
                                                        <th>Product Name</th>
                                                        <th>Rating</th>
                                                        <th>Comment</th>
                                                        <th>Published</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
    <asp:Repeater ID="rptReviews" runat="server" OnItemCommand="rptReviews_ItemCommand">
        <ItemTemplate>
            <tr>
                <td><%# Container.ItemIndex + 1 %></td>
                <td><%# Eval("UserName") %></td>
                <td><%# Eval("ProductName") %></td>

                <td>
                    <ul class="rating">
                        <%# GetStars(Convert.ToInt32(Eval("Rating"))) %>
                    </ul>
                </td>

                <td><%# Eval("Comment") %></td>

                <td class="text-center">
                    <asp:LinkButton ID="LinkButton1" runat="server"
                        CommandName="toggle"
                        CommandArgument='<%# Eval("ReviewID") %>'>
                        <%# Convert.ToBoolean(Eval("IsPublished")) 
                            ? "<i class='ri-checkbox-circle-line font-success'></i>"
                            : "<i class='ri-close-circle-line font-danger'></i>" %>
                    </asp:LinkButton>

                    &nbsp;

                    <asp:LinkButton ID="LinkButton2" runat="server"
                        CommandName="delete"
                        CommandArgument='<%# Eval("ReviewID") %>'
                        OnClientClick="return confirm('Delete this review?')">
                        <i class="ri-delete-bin-line text-danger"></i>
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- Table End -->
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Container-fluid Ends-->

                <div class="container-fluid">
                    <!-- footer start-->
                    <footer class="footer">
                        <div class="row">
                            <div class="col-md-12 footer-copyright text-center">
                                <p class="mb-0">Copyright 2024 ©Zomo template by pixelstrap</p>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
            <!-- product review section End -->
        </div>
        <!-- Page Body end-->

        <!-- Modal start -->
        <div class="modal theme-modal fade" id="staticBackdrop" tabindex="-1" role="dialog" aria-modal="true">
            <div class="modal-dialog modal-md modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>Logging Out</h5>
                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <i class="ri-close-line"></i>
                        </button>
                    </div>
                    <div class="modal-body ">
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
        <!-- Modal end -->
    </div>
    <!-- page-wrapper end-->

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

    <!-- Theme js -->
    <script src="assets/js/script.js"></script>


</asp:Content>

