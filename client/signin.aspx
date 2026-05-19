<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="client_signin" %>

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
    <title>Electronics</title>
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
    <link rel="stylesheet" id="rtl-link" type="text/css" href="assets/css/vendors/bootstrap.css">

    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/remixicon.css">

    <!-- Theme css -->
    <link rel="stylesheet" id="change-link" type="text/css" href="assets/css/style.css">
</head>
<body>
    <form id="form1" runat="server">
     

    <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Login</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.html"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Login</li>
                </ol>
            </nav>
        </div>
    </section>
    <!-- page head section end -->

    <!-- signin page start -->
    <section class="login-hero-section section-b-space">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-6 col-md-10 m-auto">
                    <div class="login-data">
                       <div class="auth-form">
    <h2>Sign in</h2>
    <h5>
        or
        <a href="signup.aspx">
            <span class="theme-color">create an a account</span>
        </a>
    </h5>

    <div class="form-input">
       <asp:TextBox ID="txtEmail" runat="server"
    CssClass="form-control"
    placeholder="Enter your email" />

        <i class="ri-phone-line"></i>
    </div>

  <div class="form-input" style="position:relative;">
    <asp:TextBox ID="txtPassword" runat="server"
        CssClass="form-control"
        TextMode="Password"
        placeholder="Enter your password" />

    <i class="ri-lock-password-line"></i>

    <span onclick="togglePassword('<%= txtPassword.ClientID %>', this)"
        style="position:absolute;right:15px;top:50%;
        transform:translateY(-50%);
        cursor:pointer;font-size:18px;">
        👁️
    </span>
</div>


    <asp:Button ID="btnLogin"
        runat="server"
        Text="CONTINUE"
        CssClass="btn theme-btn submit-btn w-100 rounded-2"
        OnClick="btnLogin_Click" />

    <asp:Label ID="lblMsg" runat="server"
        CssClass="text-danger mt-2 d-block"></asp:Label>

    <p class="fw-normal content-color">
        By creating an account, I accept the
        <span class="fw-semibold">
            Terms & Conditions & Privacy Policy
        </span>
    </p>
</div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- signin page end -->

    

  

    <!-- tap to top start -->
    <button class="scroll scroll-to-top">
        <i class="ri-arrow-up-s-line arrow"></i>
    </button>
    <!-- tap to top end -->

    <!-- location offcanvas start -->
    <div class="modal fade location-modal" id="location" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title">
                        <h5 class="fw-semibold">Select a Location</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="search-section">
                        <form class="form_search" role="form">
                            <input type="search" placeholder="Search Location" class="nav-search nav-search-field">
                        </form>
                    </div>
                    <a href="#!" class="current-location">
                        <div class="current-address">
                            <i class="ri-focus-3-line focus"></i>
                            <div>
                                <h5>Use current-location</h5>
                                <h6>Wellington St., Ottawa, Ontario, Canada</h6>
                            </div>
                        </div>
                        <i class="ri-arrow-right-s-line arrow"></i>
                    </a>
                    <h5 class="mt-sm-3 mt-2 fw-medium recent-title dark-text">
                        Recent Location
                    </h5>
                    <a href="#!" class="recent-location">
                        <div class="recant-address">
                            <i class="ri-map-pin-line theme-color"></i>
                            <div>
                                <h5>Bayshore</h5>
                                <h6>kingston St., Ottawa, Ontario, Canada</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn gray-btn" data-bs-dismiss="modal">Close</a>
                    <a href="#" class="btn theme-btn mt-0" data-bs-dismiss="modal">Save</a>
                </div>
            </div>
        </div>
    </div>
    <!-- location offcanvas end -->


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
