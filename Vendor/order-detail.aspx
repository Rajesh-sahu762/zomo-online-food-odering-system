<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="order-detail.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
    <!-- Page Body Start-->
    <div class="page-body-wrapper">
        <!-- tracking section start -->
        <div class="page-body">
            <!-- tracking table start -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-7">
                        <div class="card">
                            <div class="delivery-root">
                                <!-- Map iframe (static src kept same) -->
                                <iframe id="ifMap" runat="server"
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d158857.8415665736!2d-0.26674604057231066!3d51.52873932359012!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C%20UK!5e0!3m2!1sen!2sin!4v1714986124652!5m2!1sen!2sin"
                                        width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <ul class="nav setting-main-box driver-main-box sticky theme-scrollbar" id="v-pills-tab" role="tablist"
                                            aria-orientation="vertical">
                                         
    <li class="nav-item">
        <button class="nav-link active"
            data-bs-toggle="pill"
            data-bs-target="#tabStatus"
            type="button">
            Order Status
        </button>
    </li>

    <li class="nav-item">
        <button class="nav-link"
            data-bs-toggle="pill"
            data-bs-target="#tabDetails"
            type="button">
            Order Details
        </button>


                                        </ul>
                                    </div>

                                    <div class="col-12">
                                        <div class="restaurant-tab">
                                           <div class="tab-content">

    <!-- STATUS TAB -->
    <div class="tab-pane fade show active" id="tabStatus">
        <div class="card p-3">

            <h5>Update Order Status</h5>

         <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control mt-2">
    <asp:ListItem Text="Placed" />
    <asp:ListItem Text="Preparing" />
    <asp:ListItem Text="Out for Delivery" />
    <asp:ListItem Text="Delivered" />
</asp:DropDownList>

<asp:Button ID="btnUpdateStatus" runat="server"
    Text="Update Status"
    CssClass="btn btn-primary mt-3"
    OnClick="btnUpdateStatus_Click" />


        </div>
    </div>

    <!-- DETAILS TAB -->
    <div class="tab-pane fade" id="tabDetails">
        <div class="card p-3">

            <h5>Order Items</h5>

            <asp:Repeater ID="rptOrderItems" runat="server">
                <ItemTemplate>
                    <div class="d-flex justify-content-between border-bottom py-2">
                        <div>
                            <strong><%# Eval("ItemName") %></strong><br />
                            Qty: <%# Eval("Quantity") %>
                        </div>
                        <div>
                            ₹ <%# Eval("Total") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="mt-3 text-end">
                <strong>Total : ₹ <asp:Label ID="lblTotal" runat="server"></asp:Label></strong>
            </div>

        </div>
    </div>

</div>

                                        </div> <!-- restaurant-tab -->
                                    </div> <!-- col-12 -->
                                </div> <!-- row -->
                            </div> <!-- card-body -->
                        </div> <!-- card -->
                    </div> <!-- col-xl-5 -->
                </div> <!-- row -->
            </div> <!-- container-fluid -->
            <!-- tracking table end -->

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
        <!-- tracking section End -->
    </div>
    <!-- Page Body End-->

    <!-- Offcanvas / Modals (kept same as original) -->
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
                    <p class="mb-0">Are you sure you want to log out?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-cancel" type="button" data-bs-dismiss="modal" aria-label="Close">No</button>
                    <button class="btn btn-submit" type="submit" data-bs-dismiss="modal" aria-label="Close"><a href="login.aspx">Yes</a></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Offcanvas for delivery details (same as original) -->
    <div class="offcanvas offcanvas-end order-offcanvas" tabindex="-1" id="order-details"
        aria-labelledby="offcanvasExampleLabel" aria-expanded="false">
        <div class="offcanvas-header">
            <h4 class="offcanvas-title" id="offcanvasExampleLabel"><asp:Label ID="lblOffcanvasOrderCode" runat="server" Text="#573-685572"></asp:Label></h4>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="offcanvas-body">
            <div class="order-date">
                <h6><asp:Label ID="lblOffcanvasDate" runat="server" Text="September 17, 2024"></asp:Label> <span class="ms-3"><asp:Label ID="lblOffcanvasTime" runat="server" Text="8:12 PM"></asp:Label></span></h6>
                <a href="javascript:void(0)" class="d-block mt-1">Cancel Order</a>
            </div>

            <div class="accordion accordion-flush custome-accordion" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Status
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <ul class="status-list">
                                <li>
                                    <a href="javascript:void(0)">Shipped</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">Pending</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- other accordion items unchanged -->
            </div>
        </div>
    </div>
    <!-- Offcanvas Box End -->
</asp:Content>

