
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="support-ticket.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
  
        <!-- Page Body Start-->
        <div class="page-body-wrapper">
          

            <!-- Ticket Section Start -->
            <div class="page-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <!-- Table Start -->
                                <div class="card-body">
                                    <div class="title-header option-title">
                                        <h5>Support Ticket</h5>
                                    </div>
                                    <div>
                                        <div class="table-responsive theme-scrollbar">
                                            <table class="table category-table dataTable no-footer" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <div class="check-box-contain">
                                                                <input id="checkall" class="custom-checkbox" type="checkbox"
                                                                    name="text">
                                                                <span>Ticket Number</span>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <span>Date</span>
                                                        </th>
                                                        <th>
                                                            <span>Subject</span>
                                                        </th>
                                                        <th>
                                                            <span>Status</span>
                                                        </th>
                                                        <th>
                                                            <span>Options</span>
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                             <asp:ListView ID="lvTickets" runat="server"
    DataKeyNames="TicketID"
    OnItemEditing="lvTickets_ItemEditing"
    OnItemCanceling="lvTickets_ItemCanceling"
    OnItemUpdating="lvTickets_ItemUpdating"
    OnItemCommand="lvTickets_ItemCommand">

    
    <ItemTemplate>
        <tr>
           <%-- <td>#<%# Eval("TicketID") %></td>--%>
            <td>#<%# Eval("TicketNumber") %></td>
            <td><%# Eval("CreatedDate","{0:dd-MM-yyyy}") %></td>
            <td><%# Eval("Subject") %></td>
            <td>
                <%# Eval("Status").ToString()=="Open"
                    ? "<span class='badge bg-warning'>Open</span>"
                    : "<span class='badge bg-success'>Closed</span>" %>
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server"
                    CommandName="Edit"
                    CssClass="btn btn-sm btn-primary">
                    Edit
                </asp:LinkButton>

                <asp:LinkButton ID="LinkButton2" runat="server"
                    CommandName="Delete"
                    CommandArgument='<%# Eval("TicketID") %>'
                    CssClass="btn btn-sm btn-danger"
                    OnClientClick="return confirm('Delete this ticket?');">
                    <i class="ri-delete-bin-line"></i>
                </asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>

    
    <EditItemTemplate>
        <tr>
            
            <td>#<%# Eval("TicketID") %></td>
            <td><%# Eval("CreatedDate","{0:dd-MM-yyyy}") %></td>

            <td>
                <asp:TextBox ID="txtSubject"
                    runat="server"
                    Text='<%# Bind("Subject") %>'
                    CssClass="form-control" />
            </td>

            <td>
                <asp:DropDownList ID="ddlStatus"
                    runat="server"
                    CssClass="form-select">
                    <asp:ListItem Text="Open" Value="Open" />
                    <asp:ListItem Text="Closed" Value="Closed" />
                </asp:DropDownList>
            </td>

            <td>
                <asp:LinkButton ID="LinkButton3" runat="server"
                    CommandName="Update"
                    CssClass="btn btn-sm btn-success">
                    Update
                </asp:LinkButton>

                <asp:LinkButton ID="LinkButton4" runat="server"
                    CommandName="Cancel"
                    CssClass="btn btn-sm btn-secondary">
                    Cancel
                </asp:LinkButton>
            </td>
        </tr>
    </EditItemTemplate>
</asp:ListView>


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

                <!-- Footer Start -->
                <div class="container-fluid">
                    <footer class="footer">
                        <div class="row">
                            <div class="col-md-12 footer-copyright text-center">
                                <p class="mb-0">Copyright 2024 ©Zomo template by pixelstrap</p>
                            </div>
                        </div>
                    </footer>
                </div>
                <!-- Footer End -->
            </div>
            <!-- Ticket Section End -->
        </div>
        <!-- Page Body End-->

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
                        <button class="btn btn-submit" type="submit" data-bs-dismiss="modal"
                            aria-label="Close">Yes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->
    </div>
    <!-- page-wrapper End-->

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

