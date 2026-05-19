<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="admin-dashboard.aspx.cs" Inherits="Admin_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="page-body">
        <div class="container-fluid">


    <div class="row">

        <div class="col-md-3">
            <div class="card text-center">
                <h5>Total Vendors</h5>
                <h3><asp:Label ID="lblTotalVendors" runat="server" /></h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center">
                <h5>Approved Vendors</h5>
                <h3><asp:Label ID="lblApprovedVendors" runat="server" /></h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center">
                <h5>Total Orders</h5>
                <h3><asp:Label ID="lblOrders" runat="server" /></h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center">
                <h5>Total Sales</h5>
                <h3>₹ <asp:Label ID="lblSales" runat="server" /></h3>
            </div>
        </div>

    </div>

    <!-- ===== LATEST ORDERS ===== -->
    <div class="card mt-4">
        <div class="card-header">
            <h5>Latest Orders</h5>
        </div>

        <div class="card-body table-responsive">

            <asp:Repeater ID="rptOrders" runat="server">

                <HeaderTemplate>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Order Code</th>
                                <th>Vendor Email</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex + 1 %></td>
                        <td><%# Eval("OrderCode") %></td>
                        <td><%# Eval("VendorEmail") %></td>
                        <td>₹ <%# Eval("Amount") %></td>
                        <td><%# Eval("DeliveryStatus") %></td>
                        <td><%# Eval("OrderDate", "{0:dd-MMM-yyyy}") %></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>

            </asp:Repeater>

        </div>
    </div>

</div>

        </div>


</asp:Content>

