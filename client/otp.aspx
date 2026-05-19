<%@ Page Language="C#" AutoEventWireup="true" CodeFile="otp.aspx.cs" Inherits="client_otp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="zomo">
    <meta name="keywords" content="zomo">
    <meta name="author" content="zomo">
    <link rel="icon" href="assets/images/logo/favicon.png" type="image/x-icon">
    <title>zomo Web</title>
    <link rel="apple-touch-icon" href="assets/images/logo/favicon.png">
    <meta name="theme-color" content="#ff8d2f">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="zomo">
    <meta name="msapplication-TileImage" content="assets/images/logo/favicon.png">
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
        rel="stylesheet">

    <!-- bootstrap css -->
    <link rel="stylesheet" type="text/css" id="rtl-link" href="assets/css/vendors/bootstrap.css">

    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/remixicon.css">

    <!-- Theme css -->
    <link rel="stylesheet" id="change-link" type="text/css" href="assets/css/style.css">

    <!-- bootstrap css -->
<link rel="stylesheet" id="Link1" type="text/css" href="assets/css/vendors/bootstrap.css">

<!-- swiper css (🔥 MISSING FILE यही issue था) -->
<link rel="stylesheet" type="text/css" href="assets/css/vendors/swiper-bundle.min.css">

<!-- remixicon css -->
<link rel="stylesheet" type="text/css" href="assets/css/vendors/remixicon.css">

<!-- Theme css -->
<link rel="stylesheet" id="Link2" type="text/css" href="assets/css/style.css">

    <style>
.resend-otp{
    display:block;
    margin-top:15px;
    text-align:center;
    color:#ff8d2f;
    font-weight:600;
}
        </style>
</head>
<body>
    <form id="form1" runat="server">
       <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">One Time Password</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.html"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">OTP</li>
                </ol>
            </nav>
        </div>
    </section>
    <!-- page head section end -->


    <!-- signup page start -->
    <section class="login-hero-section section-b-space">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-6 col-md-10 m-auto">
                    <div class="login-data">
                        <div class="otp-form">
                            <h2 class="mb-0 dark-text">OTP</h2>
                            <h6>We have sent a verification code to</h6>
                            <h5 class="otp-number dark-text">+1 (692)52 - 95555</h5>
                            <div class="otp-box d-flex gap-sm-3 gap-2">
                                <div class="form-input mb-0">
                                    <asp:TextBox ID="otp1" runat="server" CssClass="form-control otp-input" MaxLength="1" />
                                </div>
                                <div class="form-input mb-0">
                                    <asp:TextBox ID="otp2" runat="server" CssClass="form-control otp-input" MaxLength="1" />
                                </div>
                                <div class="form-input mb-0">
                              <asp:TextBox ID="otp3" runat="server" CssClass="form-control otp-input" MaxLength="1" />

                                </div>
                                <div class="form-input mb-0">
                                    <asp:TextBox ID="otp4" runat="server" CssClass="form-control otp-input" MaxLength="1" />
                                </div>
                                <div class="form-input mb-0">
                                        <asp:TextBox ID="otp5" runat="server" CssClass="form-control otp-input" MaxLength="1" />
                                </div>
                                <div class="form-input mb-0">
                                        <asp:TextBox ID="otp6" runat="server" CssClass="form-control otp-input" MaxLength="1" />

                                </div>
                            </div>
                      <asp:Button ID="btnVerify" runat="server"
        Text="VERIFY OTP"
        CssClass="btn theme-btn submit-btn w-100 rounded-2"
        OnClick="btnVerify_Click" />
                            <asp:LinkButton 
    ID="btnResendOtp"
    runat="server"
    CssClass="resend-otp"
    OnClick="btnResendOtp_Click">
    Resend OTP
</asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- signup page end -->
    </form>


    
    <!-- bootstrap js -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- footer accordion js -->
    <script src="assets/js/footer-accordion.js"></script>

    <!-- otp js -->
    <script src="assets/js/otp.js"></script>

    <!-- script js -->
    <script src="assets/js/script.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const inputs = document.querySelectorAll(".otp-input");

            inputs.forEach((input, index) => {
                input.addEventListener("input", function () {
                    if (this.value.length === 1 && index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                });

            input.addEventListener("keydown", function (e) {
                if (e.key === "Backspace" && this.value === "" && index > 0) {
                    inputs[index - 1].focus();
                }
            });
        });
        });
</script>


</body>
</html>
