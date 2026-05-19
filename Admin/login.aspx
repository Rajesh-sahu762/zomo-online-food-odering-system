<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Owner_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Zomo | Owner Login</title>

    <!-- Zomo CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/remixicon.css" />

</head>
<body>
    <form id="form1" runat="server">

    <!-- login section start -->
    <section class="log-in-section section-b-space">
        <a href="#" class="logo-login">
            <img src="assets/images/logo/1.png" class="img-fluid" alt="">
        </a>

        <div class="container w-100">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-6">
                    <div class="log-in-box">

                        <div class="log-in-title text-center">
                            <h3>Owner Login</h3>
                            <h5>Login to manage vendors & restaurants</h5>
                        </div>

                        <div class="input-box">

                            <!-- EMAIL -->
                            <div class="form-floating theme-form-floating log-in-form mb-3">
                                <asp:TextBox ID="txtEmail" runat="server"
                                    CssClass="form-control"
                                    placeholder="Email"></asp:TextBox>
                                <label>Email</label>
                            </div>

                            <!-- PASSWORD -->
                           <div class="form-floating theme-form-floating log-in-form mb-3" style="position:relative;">
    <asp:TextBox ID="txtPassword" runat="server"
        TextMode="Password"
        CssClass="form-control"
        placeholder="Password"></asp:TextBox>
    <label>Password</label>

    <span onclick="togglePassword('<%= txtPassword.ClientID %>', this)"
        style="position:absolute;
        right:15px;
        top:50%;
        transform:translateY(-50%);
        cursor:pointer;
        font-size:18px;
        z-index:10;">
        👁️
    </span>
</div>


                            <!-- ERROR -->
                            <asp:Label ID="lblMsg" runat="server"
                                CssClass="text-danger d-block mb-2"></asp:Label>

                            <!-- LOGIN BUTTON -->
                            <asp:Button ID="btnLogin" runat="server"
                                Text="Login"
                                CssClass="btn btn-animation w-100 justify-content-center"
                                OnClick="btnLogin_Click" />

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- login section end -->


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



</form>
    <!-- Zomo JS -->
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
