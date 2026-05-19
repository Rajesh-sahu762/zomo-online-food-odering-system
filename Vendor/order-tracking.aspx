<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master"
    AutoEventWireup="true" CodeFile="order-tracking.aspx.cs"
    Inherits="Vendor_OrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="page-body-wrapper">
<div class="page-body">
<div class="container-fluid">
<div class="row">


<!-- RIGHT -->
<div class="col-xl-12">
<div class="card">
<div class="card-body">

<!-- ORDER INFO -->
<h4>Order #<asp:Label ID="lblOrderID" runat="server" /></h4>
<p>Placed on <asp:Label ID="lblOrderDate" runat="server" /></p>

<!-- PROGRESS BAR -->
<ol class="progtrckr">
    <li id="stepPlaced" runat="server" class="progtrckr-todo"><br />Placed</li>
    <li id="stepPreparing" runat="server" class="progtrckr-todo"><br />Preparing</li>
    <li id="stepOut" runat="server" class="progtrckr-todo"><br />Out for Delivery</li>
    <li id="stepDelivered" runat="server" class="progtrckr-todo"><br />Delivered</li>
</ol>

<!-- TRACKING TABLE -->
<div class="table-responsive mt-3">
<table class="table">
<thead>
<tr>
    <th>Date</th>
    <th>Time</th>
    <th>Description</th>
    <th>Location</th>
</tr>
</thead>
<tbody>
<asp:Repeater ID="rptTrack" runat="server">
<ItemTemplate>
<tr>
    <td><%# Eval("Date") %></td>
    <td><%# Eval("Time") %></td>
    <td><%# Eval("Description") %></td>
    <td><%# Eval("Location") %></td>
</tr>
</ItemTemplate>
</asp:Repeater>
</tbody>
</table>
</div>

</div>
</div>
</div>

</div>
</div>
</div>

</asp:Content>
