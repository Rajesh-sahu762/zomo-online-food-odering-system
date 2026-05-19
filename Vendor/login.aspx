<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Vendor_Login" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Zomo - Vendor Login</title>

    <link rel="icon" href="assets/images/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
</head>

<body>
<form id="form1" runat="server">

<section class="log-in-section section-b-space">
    <a href="#" class="logo-login">
        <img src="assets/images/logo/1.png" class="img-fluid" alt="" />
    </a>

    <div class="container w-100">
        <div class="row">
            <div class="col-xl-5 col-lg-6 me-auto">
                <div class="log-in-box">

                    <div class="log-in-title">
                        <h3>Welcome To Zomo</h3>
                        <h5>Log In Your Vendor Account</h5>
                    </div>

                    <div class="input-box">

                        <div class="col-12">
                            <label class="col-form-label pt-0">Your Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        </div>

                   <div class="col-12" style="position:relative;">
    <label class="col-form-label pt-0">Your Password</label>

    <asp:TextBox ID="txtPassword" runat="server"
        TextMode="Password"
        CssClass="form-control" />

    <span onclick="togglePassword('<%= txtPassword.ClientID %>', this)"
        style="position:absolute;
        right:12px;
        top:70%;
        transform:translateY(-50%);
        cursor:pointer;
        font-size:18px;">
        👁️
    </span>
</div>


                        <div class="col-12 mt-3">
                            <asp:Button ID="btnLogin" runat="server"
                                Text="Login" CssClass="btn btn-primary w-100"
                                OnClick="btnLogin_Click" />
                        </div>

                        <p class="text-center mt-2">
                            Don't have an account?
                            <a href="vendor-register.aspx">Register</a>
                        </p>

                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>


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
</body>
</html>
