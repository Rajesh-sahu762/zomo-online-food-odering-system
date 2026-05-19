<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="vendor-orders-view.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <div class="card">
        <div class="card-header">
            <h5>Vendor Orders</h5>
        </div>

        <div class="card-body">

            <!-- FILTER -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlVendors" runat="server"
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlVendors_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <!-- ORDERS TABLE -->
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
                                <th>Order Date</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex + 1 %></td>
                        <td><%# Eval("OrderCode") %></td>
                        <td><%# Eval("Email") %></td>
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


</asp:Content>

