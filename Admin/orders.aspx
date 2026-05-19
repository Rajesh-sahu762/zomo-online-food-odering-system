<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
<div class="page-body">
    <div class="container-fluid">

        <div class="card">
            <div class="card-header">
                <h5>All Orders</h5>
                <p>All vendors orders in one place</p>
            </div>

            <div class="card-body table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>#OrderID</th>
                            <th>Restaurant</th>
                            <th>Customer</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rptOrders" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>#<%# Eval("OrderID") %></td>
                                    <td><%# Eval("RestaurantName") %></td>
                                    <td>
                                        <%# Eval("FullName") %><br />
                                        <small><%# Eval("Email") %></small>
                                    </td>
                                    <td>₹ <%# Eval("TotalAmount") %></td>
                                    <td>
                                        <span class="badge bg-info">
                                            <%# Eval("OrderStatus") %>
                                        </span>
                                    </td>
                                    <td>
                                        <%# Convert.ToDateTime(Eval("CreatedAt"))
                                            .ToString("dd MMM yyyy") %>
                                    </td>
                                    <td>
                                        <a href="order-details.aspx?oid=<%# Eval("OrderID") %>"
                                           class="btn btn-sm btn-primary">
                                            View
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


</asp:Content>

