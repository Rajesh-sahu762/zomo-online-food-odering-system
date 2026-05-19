
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <!-- Page Body Start -->
        <div class="page-body-wrapper">
          
            <!-- Container-fluid starts-->
            <div class="page-body">
                <!-- All User Table Start -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <div class="title-header option-title">
                                        <h5>All Category</h5>
                                        <form class="d-inline-flex">
                                            <a href="add-new-categorys.aspx"
                                                class="align-items-center btn btn-theme d-flex">
                                                <i data-feather="plus-square"></i>Add New
                                            </a>
                                        </form>
                                    </div>
                                    <div class="table-responsive theme-scrollbar">
                                        <div>
                                            <table class="table category-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th><input id="checkall" class="custom-checkbox" type="checkbox" name="text">
                                                        </th>
                                                       
                                                        <th>Product Name</th>
                                                        <th>Date</th>
                                                        <th>Foods</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:ListView ID="ListView1" OnItemCommand="ListView1_ItemCommand" OnItemUpdating="ListView1_ItemUpdating" OnItemCanceling="ListView1_ItemCanceling" runat="server">
                                                     <ItemTemplate>
<tr>
    <td>
        <asp:CheckBox ID="CheckBox1" runat="server" class="custom-checkbox" />
    </td>

    <td><%# Eval("CategoryName") %></td>

    <td><%# Eval("CreatedAt") %></td>

    <td>4</td>

    <td>
        <ul class="d-flex align-items-center justify-content-center">
            <li>
                <asp:LinkButton ID="btnEdit" runat="server" CommandName="editrow" CommandArgument='<%# Eval("CategoryID") %>'>
                    <i class="ri-pencil-line"></i>
                </asp:LinkButton>
            </li>

            <li>
                <asp:LinkButton ID="btnDelete" runat="server" CommandName="del" CommandArgument='<%# Eval("CategoryID") %>'>
                    <i class="ri-delete-bin-line"></i>
                </asp:LinkButton>
            </li>
           <li>
    <asp:LinkButton ID="btnVisibility" runat="server"
        CommandName="toggleHome"
        CommandArgument='<%# Eval("CategoryID") %>'>

        <%# Convert.ToBoolean(Eval("ShowInHomepage")) 
            ? "<i class='ri-eye-line'></i>" 
            : "<i class='ri-eye-off-line'></i>" %>

    </asp:LinkButton>
</li>

        </ul>
    </td>
</tr>
</ItemTemplate>

                                                       <EditItemTemplate>
<tr>
    <td></td>

    <td>
        <img src="../assets/images/menu/<%# Eval("CategoryImage") %>" width="60" />
        <br />
        <asp:FileUpload ID="fuEditImage" runat="server" />
    </td>

    <td>
        <asp:TextBox ID="txtEditName" runat="server"
            CssClass="form-control" 
            Text='<%# Eval("CategoryName") %>'></asp:TextBox>
    </td>

    <td><%# Eval("CreatedAt") %></td>

    <td>4</td>

    <td>
        <asp:LinkButton ID="btnUpdate" runat="server" 
            CommandName="update" 
            CommandArgument='<%# Eval("CategoryID") %>'
            CssClass="btn btn-success btn-sm">Update</asp:LinkButton>

        <asp:LinkButton ID="btnCancel" runat="server" 
            CommandName="myCancel"
            CssClass="btn btn-danger btn-sm">Cancel</asp:LinkButton>
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
                <!-- All User Table Ends-->

                <div class="container-fluid">
                    <!-- footer start-->
                    <footer class="footer">
                        <div class="row">
                            <div class="col-md-12 footer-copyright text-center">
                                <p class="mb-0">Copyright 2024 ©Zomo template by pixelstrap</p>
                            </div>
                        </div>
                    </footer>
                    <!-- footer end-->
                </div>
            </div>
            <!-- Container-fluid end -->
        </div>
        <!-- Page Body End -->


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

