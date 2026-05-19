<%@ Page Language="C#" AutoEventWireup="true" CodeFile="vendor-register.aspx.cs" Inherits="zomo_Admin_vendor_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vendor Registration</title>
    
    <link href="assets/css/vendors/bootstrap.css" rel="stylesheet" />
    <!-- swiper css -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/swiper-bundle.min.css">

    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/remixicon.css">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>
    <form id="form1" runat="server">
<section class="log-in-section">
    <a class="logo-login">
        <img src="assets/images/logo/1.png" />
    </a>

    <div class="log-in-box w-50 mx-5">
        <div class="log-in-title">
            <h3>Vendor Registration</h3>
            <h5>Request access to sell on platform</h5>
        </div>

        <div class="input-box">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />

    <label>Password</label>
<div style="position:relative;">
    <asp:TextBox ID="txtPassword" runat="server"
        TextMode="Password"
        CssClass="form-control"
        onkeyup="checkStrength(this.value)" />

    <span onclick="togglePassword('<%= txtPassword.ClientID %>', this)"
        style="position:absolute;right:12px;top:50%;transform:translateY(-50%);
        cursor:pointer;font-size:18px;">
        👁️
    </span>
</div>

<asp:Label ID="lblStrength" runat="server"
    Text=""
    Style="font-size:13px;font-weight:600;"></asp:Label>



     <label>Confirm Password</label>
<div style="position:relative;">
    <asp:TextBox ID="txtConfirm" runat="server"
        TextMode="Password"
        CssClass="form-control" />

    <span onclick="togglePassword('<%= txtConfirm.ClientID %>', this)"
        style="position:absolute;right:12px;top:50%;transform:translateY(-50%);
        cursor:pointer;font-size:18px;">
        👁️
    </span>
</div>

            <br />
            <asp:Button ID="btnRegister" runat="server"
                Text="Send Approval Request"
                CssClass="btn btn-animation w-100"
                OnClick="btnRegister_Click" />
        </div>

        <p class="text-center mt-2">
            Already approved?
            <a href="login.aspx">Login</a>
        </p>
    </div>
</section>




        <script>
            function checkStrength(pwd) {
                var lbl = document.getElementById('<%= lblStrength.ClientID %>');

        var strongRegex = new RegExp(
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*]).{8,}$"
        );

        if (pwd.length == 0) {
            lbl.innerHTML = "";
            return;
        }

        if (strongRegex.test(pwd)) {
            lbl.innerHTML = "Strong Password";
            lbl.style.color = "green";
        } else {
            lbl.innerHTML = "Weak Password (Min 8 chars, A-Z, a-z, 0-9, symbol)";
            lbl.style.color = "red";
        }
    }
</script>

        <script>
            function togglePassword(inputId, el) {
                var txt = document.getElementById(inputId);

                if (txt.type === "password") {
                    txt.type = "text";
                    el.innerHTML = "🙈";
                } else {
                    txt.type = "password";
                    el.innerHTML = "👁️";
                }
            }
</script>




         <!-- bootstrap js -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- footer accordion js -->
    <script src="assets/js/footer-accordion.js"></script>

    <!-- script js -->
    <script src="assets/js/script.js"></script>

    </form>
</body>
</html>
