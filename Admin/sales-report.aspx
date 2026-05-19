<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="sales-report.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
<div class="page-body">
    <div class="container-fluid">

        <!-- FILTER -->
        <div class="card mb-4">
            <div class="card-header">
                <h5>Sales Filter</h5>
            </div>

            <div class="card-body row g-3">
                <div class="col-md-4">
                    <label>From Date</label>
                    <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" TextMode="Date" />
                </div>

                <div class="col-md-4">
                    <label>To Date</label>
                    <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" TextMode="Date" />
                </div>

                <div class="col-md-4 d-flex align-items-end">
                    <asp:Button ID="btnFilter" runat="server"
                        Text="Apply Filter"
                        CssClass="btn btn-primary w-100"
                        OnClick="btnFilter_Click" />
                </div>
            </div>
        </div>

        <!-- SUMMARY -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h6>Total Orders</h6>
                        <h3><%= TotalOrders %></h3>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h6>Total Sales</h6>
                        <h3>₹ <%= TotalSales %></h3>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h6>Completed Orders</h6>
                        <h3><%= CompletedOrders %></h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- SALES TABLE -->
        <div class="card">
            <div class="card-header">
                <h5>Order Wise Sales</h5>
            </div>

            <div class="card-body table-responsive">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Restaurant</th>
                            <th>Customer</th>
                            <th>Status</th>
                            <th>Amount</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rptSales" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>#<%# Eval("OrderID") %></td>
                                    <td><%# Eval("CreatedAt", "{0:dd MMM yyyy}") %></td>
                                    <td><%# Eval("RestaurantName") %></td>
                                    <td><%# Eval("CustomerName") %></td>
                                    <td>
                                        <span class="badge bg-success">
                                            <%# Eval("OrderStatus") %>
                                        </span>
                                    </td>
                                    <td>₹ <%# Eval("TotalAmount") %></td>
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

