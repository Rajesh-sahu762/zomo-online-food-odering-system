
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <!-- Page Body Start-->
<div class="page-body-wrapper">

    <div class="page-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-body">

                            <div class="title-header option-title d-sm-flex d-block">
                                <h5>Products List</h5>
                                <div class="right-options">
                                    <ul>
                                        <li><a class="btn btn-dashed" href="add-new-product.aspx">Add Product</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="table-responsive theme-scrollbar">
                                <table class="table category-table dataTable no-footer" id="table_id">

                                    <thead>
                                        <tr>
                                            <th><input id="checkall" type="checkbox" class="custom-checkbox" /></th>
                                            <th>Product Image</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Price</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

<tbody>

<asp:ListView ID="ListView1" runat="server"
    OnItemCommand="ListView1_ItemCommand">

<ItemTemplate>
<tr>

    <td><asp:CheckBox ID="chk" runat="server" CssClass="custom-checkbox" /></td>

    <td>
        <img src="../Vendor/assets/images/product/<%# Eval("MainImage") %>" style="width:55px;" />
    </td>

    <td><%# Eval("FoodName") %></td>

    <td><%# Eval("CategoryName") %></td>

    <td>₹ <%# Eval("Price") %></td>

    <td>
        <%# Convert.ToBoolean(Eval("IsAvailable"))
            ? "<span style='background:#16c13b;color:white;padding:4px 10px;border-radius:6px;'>Approved</span>"
            : "<span style='background:#ff3b3b;color:white;padding:4px 10px;border-radius:6px;'>Pending</span>" %>
    </td>

    <td>
        <ul class="d-flex align-items-center justify-content-center">

            <li>
                <asp:LinkButton ID="btnEdit" runat="server"
                    CommandName="editrow" CommandArgument='<%# Eval("FoodID") %>'>
                    <i class="ri-pencil-line"></i>
                </asp:LinkButton>
            </li>

            <li>
                <asp:LinkButton ID="btnDelete" runat="server"
                    CommandName="del" CommandArgument='<%# Eval("FoodID") %>'>
                    <i class="ri-delete-bin-line"></i>
                </asp:LinkButton>
            </li>

            <li>
                <asp:LinkButton ID="btnToggle" runat="server"
                    CommandName="toggle" CommandArgument='<%# Eval("FoodID") %>'>
                    <%# Convert.ToBoolean(Eval("IsAvailable")) 
                        ? "<i class='ri-eye-line'></i>" : "<i class='ri-eye-off-line'></i>" %>
                </asp:LinkButton>
            </li>

        </ul>
    </td>

</tr>
</ItemTemplate>


<EditItemTemplate>
<tr>

<td><asp:CheckBox ID="chk2" runat="server" /></td>

<td>
    <asp:FileUpload ID="fuEditImage" runat="server" />
    <img src="../Vendor/assets/images/product/<%# Eval("MainImage") %>" width="50" />
</td>

<td>
    <asp:TextBox ID="txtEditName" runat="server" Text='<%# Eval("FoodName") %>' />
</td>

<td><%# Eval("CategoryName") %></td>

<td><asp:TextBox ID="txtEditPrice" runat="server" Text='<%# Eval("Price") %>' /></td>

<td><asp:TextBox ID="txtOfferPrice" runat="server" Text='<%# Eval("OfferPrice") %>' /></td>

<td>
    <asp:DropDownList ID="ddlEditStatus" runat="server">
        <asp:ListItem Text="Approved" Value="1"></asp:ListItem>
        <asp:ListItem Text="Pending" Value="0"></asp:ListItem>
    </asp:DropDownList>
</td>

<td>
    <asp:LinkButton ID="btnUpdate" runat="server"
        CommandName="update" CommandArgument='<%# Eval("FoodID") %>'
        CssClass="btn btn-success btn-sm">Update</asp:LinkButton>

    <asp:LinkButton ID="btnCancel" runat="server"
        CommandName="cancel" CssClass="btn btn-danger btn-sm">Cancel</asp:LinkButton>
</td>

</tr>
</EditItemTemplate>

</asp:ListView>

</tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

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

    <!-- Sidebar js -->
    <script src="assets/js/config.js"></script>

    <!-- customizer js -->
    <script src="assets/js/customizer.js"></script>

     <!-- Plugins JS -->
    <script src="assets/js/sidebar-menu.js"></script>
    <!-- Data table js -->
    <script src="assets/js/jquery.dataTables.js"></script>
    <script src="assets/js/custom-data-table.js"></script>

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

