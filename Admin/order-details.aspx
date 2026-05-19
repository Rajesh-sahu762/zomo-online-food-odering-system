<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="order-details.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
<div class="page-body">
    <div class="container-fluid">

        <!-- ORDER SUMMARY -->
        <div class="card mb-4">
            <div class="card-header">
                <h5>Order Summary</h5>
            </div>

            <div class="card-body row">
                <div class="col-md-4">
                    <p><b>Order ID:</b> #<%= OrderID %></p>
                    <p><b>Status:</b> <span class="badge bg-info"><%= OrderStatus %></span></p>
                </div>

                <div class="col-md-4">
                    <p><b>Restaurant:</b> <%= RestaurantName %></p>
                    <p><b>Total Amount:</b> ₹ <%= TotalAmount %></p>
                </div>

                <div class="col-md-4">
                    <p><b>Customer:</b> <%= CustomerName %></p>
                    <p><b>Email:</b> <%= CustomerEmail %></p>
                </div>
            </div>
        </div>

        <!-- DELIVERY ADDRESS -->
        <div class="card mb-4">
            <div class="card-header">
                <h5>Delivery Address</h5>
            </div>

            <div class="card-body">
                <p><%= FullAddress %></p>
            </div>
        </div>

        <!-- ORDER ITEMS -->
        <div class="card">
            <div class="card-header">
                <h5>Ordered Items</h5>
            </div>

            <div class="card-body table-responsive">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Item</th>
                            <th>Qty</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rptItems" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ItemName") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td>₹ <%# Eval("Price") %></td>
                                    <td>₹ <%# Eval("Total") %></td>
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

