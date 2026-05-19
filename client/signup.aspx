<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="client_signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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


<link href="assets/css/vendors/bootstrap.css" rel="stylesheet" />
    <!-- swiper css -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/swiper-bundle.min.css">

    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors/remixicon.css">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">

    <style>
        .password-wrapper {
    position: relative;
}

/* input padding for icons */
.password-wrapper input {
    padding-left: 40px;
    padding-right: 45px;
}

/* LEFT icon (lock) */
.password-wrapper .left-icon {
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 18px;
    color: #777;
    pointer-events: none; /* 👈 VERY IMPORTANT */
}

/* RIGHT eye button */
.password-wrapper .eye-btn {
    position: absolute;
    right: 3rem;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    z-index: 5;
}

/* eye icon style */
.password-wrapper .eye-btn i {
    font-size: 18px;
    color: #666;
}

.password-wrapper .eye-btn i:hover {
    color: #000;
}

    </style>

</head>
<body>
    <form id="form1" runat="server">
    

    <!-- page head section starts -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Create Account</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-star">
                    <li class="breadcrumb-item">
                        <a href="index.html"><i class="ri-home-line"></i>Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Signup</li>
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
                       <div class="auth-form">
    <h2>Sign up</h2>
    <h5>
        or
        <a href="signin.aspx">
            <span class="theme-color">login to your account</span>
        </a>
    </h5>

    <div class="form-input">
        <asp:TextBox ID="txtName" runat="server"
            CssClass="form-control"
            placeholder="Enter your name" />
        <i class="ri-user-3-line"></i>
    </div>

    <div class="form-input">
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter your email" />
        <i class="ri-phone-line"></i>
    </div>

   <div class="form-input password-wrapper">
    <asp:TextBox ID="txtPassword" runat="server"
        CssClass="form-control"
        TextMode="Password"
        placeholder="Enter your password"
        onkeyup="checkStrength(this.value)" />

    <!-- existing lock icon (LEFT) -->
    <i class="ri-lock-password-line left-icon"></i>

    <!-- eye icon (RIGHT – ONLY CLICKABLE PART) -->
    <span class="eye-btn"
          onclick="togglePassword('<%= txtPassword.ClientID %>', this)">
        <i class="ri-eye-off-line"></i>
    </span>
</div>

<asp:Label ID="Label1" runat="server"
    Style="font-size:13px;font-weight:600;margin-top:6px;display:block;">
</asp:Label>


<asp:Label ID="lblStrength" runat="server"
    Text=""
    Style="font-size:13px;font-weight:600;margin-top:5px;display:block;">
</asp:Label>


    <asp:Button ID="btnSignup"
        runat="server"
        Text="CONTINUE"
        CssClass="btn theme-btn submit-btn w-100 rounded-2"
        OnClick="btnSignup_Click" />

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
    <!-- signup page end -->


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

        var input = document.getElementById(inputId);
        var icon = el.querySelector("i");

        if (!input) return;

        if (input.type === "password") {
            input.type = "text";
            icon.className = "ri-eye-line";
        } else {
            input.type = "password";
            icon.className = "ri-eye-off-line";
        }
    }

    function checkStrength(pwd) {

        var lbl = document.getElementById('<%= lblStrength.ClientID %>');

    if (pwd.length === 0) {
        lbl.innerHTML = "";
        return;
    }

    var strong =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$/;

    if (strong.test(pwd)) {
        lbl.innerHTML = "Strong Password";
        lbl.style.color = "green";
    } else {
        lbl.innerHTML =
            "Weak Password (min 8 chars, A-Z, a-z, number, symbol)";
        lbl.style.color = "red";
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
