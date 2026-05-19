<%@ Page Title="Cart" Language="C#" MasterPageFile="~/client/MasterPage.master"
    AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="client_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .cart-item-box {
    background: #fff;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.cart-img img {
    width: 90px;
    height: 90px;
    object-fit: cover;
    border-radius: 10px;
}

.cart-details h5 {
    font-weight: 600;
}

.cart-details p {
    margin-bottom: 4px;
}

.qty {
    display: inline-block;
    background: #f2f2f2;
    padding: 3px 10px;
    border-radius: 6px;
    font-size: 13px;
}

.remove-btn {
    display: inline-block;
    margin-left: 10px;
    color: #ff4d4d;
    font-size: 13px;
    text-decoration: none;
}

.cart-total {
    font-weight: 600;
    font-size: 16px;
}

.cart-summary {
    background: #fff;
    padding: 20px;
    border-radius: 14px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- page head -->
<section class="page-head-section">
    <div class="container page-heading">
        <h2 class="h3 mb-3 text-white text-center">Your Cart</h2>
    </div>
</section>

<section class="cart-section section-b-space">
    <div class="container">
        <div class="row g-4">

            <!-- LEFT : CART ITEMS -->
            <div class="col-lg-8">

                <asp:Repeater ID="rptCartPage" runat="server">
                    <ItemTemplate>
                        <div class="cart-item-box d-flex align-items-center gap-3 mb-3">

                            <div class="cart-img">
                                <img src="../assets/images/product/<%# Eval("MainImage") %>"
                                     alt="<%# Eval("ItemName") %>" />
                            </div>

                            <div class="cart-details flex-grow-1">
                                <h5><%# Eval("ItemName") %></h5>
                                <p>₹ <%# Eval("Price") %></p>
                               <div class="d-flex align-items-center gap-2 mt-1">
    <button type="button" class="qty"
        onclick="updateQty(<%# Eval("CartID") %>, -1, this)">−</button>

    <span class="qty qty-val"><%# Eval("Quantity") %></span>

    <button type="button" class="qty"
        onclick="updateQty(<%# Eval("CartID") %>, 1, this)">+</button>
</div>


                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    CssClass="remove-btn"
                                    CommandArgument='<%# Eval("CartID") %>'
                                    OnCommand="RemoveFromCart">
                                    Remove
                                </asp:LinkButton>
                            </div>

                            <div class="cart-total">
                                ₹ <%# Eval("Total") %>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>

            <!-- RIGHT : SUMMARY -->
            <div class="col-lg-4">
                <div class="cart-summary">
                    <h4>Bill Summary</h4>

                    <div class="summary-row">
                        <span>Total Items</span>
                        <strong><%= ((client_MasterPage)Master).CartCount %></strong>


                    </div>

                    <div class="summary-row">
                        <span>Total Amount</span>
                        <strong>₹ <%= ((client_MasterPage)Master).CartTotal %></strong>
                    </div>

                    <a href="checkout.aspx" class="btn theme-btn w-100 mt-3">
                        Proceed to Checkout
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>


    <script>
        function updateQty(cartId, change, btn) {

            fetch("cart.aspx/UpdateQuantity", {
                method: "POST",
                headers: { "Content-Type": "application/json; charset=utf-8" },
                body: JSON.stringify({ cartId: cartId, change: change })
            })
            .then(r => r.json())
            .then(res => {

                if (!res.d || !res.d.success) return;

            let box = btn.parentElement;
            box.querySelector(".qty-val").innerText = res.d.qty;

            // update item total
            let totalBox = box.closest(".cart-item-box")
                              .querySelector(".cart-total");
            totalBox.innerText = "₹ " + res.d.itemTotal;

            // update bill summary
            document.querySelector(".summary-items").innerText = res.d.cartCount;
            document.querySelector(".summary-total").innerText = "₹ " + res.d.cartTotal;
        });
        }
</script>


</asp:Content>
