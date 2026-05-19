
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="drivers.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:HiddenField ID="hfActiveTab" runat="server" />

<!-- page-wrapper Start-->
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    <div class="page-body-wrapper">

        <!-- index body start -->
        <div class="page-body">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header"><h5>Drivers</h5></div>

                    <div class="card-body">
                        <div class="row">

                            <!-- LEFT MENU -->
                            <div class="col-12">
                                <ul class="nav setting-main-box driver-main-box sticky theme-scrollbar" id="v-pills-tab" role="tablist">
                                    
                                    <li>
                                        <button class="nav-link active"
                                            onclick="setActiveTab('#Settings')"
                                            data-bs-toggle="pill" data-bs-target="#Settings">
                                            <i class="ri-settings-line"></i> Driver Details
                                        </button>
                                    </li>

                                    <li>
                                        <button class="nav-link"
                                            onclick="setActiveTab('#Info')"
                                            data-bs-toggle="pill" data-bs-target="#Info">
                                            <i class="ri-information-2-line"></i> Driver (Activate/Deactivate)
                                        </button>
                                    </li>

                                    <li>
                                        <button class="nav-link"
                                            onclick="setActiveTab('#Image')"
                                            data-bs-toggle="pill" data-bs-target="#Image">
                                            <i class="ri-image-circle-fill"></i> Car Details
                                        </button>
                                    </li>

                                </ul>
                            </div>

                            <!-- RIGHT CONTENT -->
                            <div class="col-12">
                                <div class="restaurant-tab">
                                    <div class="tab-content" id="v-pills-tabContent">

                                        <!-- ========== TAB 1 ========== -->
                                        <div class="tab-pane fade show active" id="Settings">

                                            <div class="input-items">
                                                <div class="row gy-3">

                                                    <div class="col-md-6">
                                                        <div class="input-box">
                                                            <h6>Name</h6>
                                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="input-box">
                                                            <h6>Last Name</h6>
                                                            <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="input-box">
                                                            <h6>Email</h6>
                                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="input-box">
                                                            <h6>Phone</h6>
                                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter Phone"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <!-- PASSWORD -->
                                                    <div class="col-md-6">
                                                        <div class="input-box" style="position:relative;">
                                                            <h6>Password</h6>
                                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password" ></asp:TextBox>
                                                            <span class="toggle-eye" onclick="togglePass('<%= txtPassword.ClientID %>', this)" 
                                                                  style="position:absolute; right:10px; top:47px; cursor:pointer; font-size:20px;">👁</span>
                                                        </div>
                                                    </div>

                                                    <!-- CONFIRM PASSWORD -->
                                                    <div class="col-md-6">
                                                        <div class="input-box" style="position:relative;">
                                                            <h6>Confirm Password</h6>
                                                            <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Confirm Password" ></asp:TextBox>
                                                            <span class="toggle-eye" onclick="togglePass('<%= txtCPassword.ClientID %>', this)"
                                                                  style="position:absolute; right:10px; top:47px; cursor:pointer; font-size:20px;">👁</span>
                                                        </div>
                                                    </div>
<div class="col-md-12">
    <div class="input-box">
        <h6>Upload Driver Image</h6>
        <asp:FileUpload ID="fuDriverImage" runat="server" />
    </div>
</div>

                                                </div>
                                            </div>

                                        </div>

                                        <!-- ========== TAB 2 ========== -->
                                        <div class="tab-pane fade" id="Info">
                                            <div class="service-box">
                                                <div class="row gy-3">
                                                    <div class="col-12">
                                                        <div class="service-item">
                                                            <asp:RadioButton ID="rActive" GroupName="status" runat="server" />
                                                            <label>Active</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="service-item">
                                                            <asp:RadioButton ID="rInactive" GroupName="status" runat="server" />
                                                            <label>Inactive</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- ========== TAB 3 ========== -->
                                        <div class="tab-pane fade" id="Image">
                                            <div class="input-items">
                                                <div class="row gy-3">

                                                    <div class="col-md-6">
                                                        <div class="input-box">
                                                            <h6>Car Number</h6>
                                                            <asp:TextBox ID="txtCarNumber" runat="server" CssClass="form-control" placeholder="Enter Number"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="input-box">
                                                            <h6>Car Name</h6>
                                                            <asp:TextBox ID="txtCarName" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
    <div class="input-box">
        <h6>Upload Car Image</h6>
        <asp:FileUpload ID="fuCarImage" runat="server" />
    </div>
</div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn save-button mt-2"
                            OnClick="btnSave_Click" OnClientClick="return validateDriver();" />

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- SWEETALERT -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- ================= JS ================= -->

<script type="text/javascript">

    // -----------------------
    // Save active tab on click
    // -----------------------
    function setActiveTab(tabId) {
        document.getElementById("<%= hfActiveTab.ClientID %>").value = tabId;
}

// -----------------------
// Restore tab WITHOUT bootstrap JS
// -----------------------
window.onload = function () {

    var saved = document.getElementById("<%= hfActiveTab.ClientID %>").value;

    if (saved !== "" && document.getElementById(saved.replace("#", ""))) {

        // Remove all active classes
        var tabs = document.querySelectorAll(".nav-link");
        for (var i = 0; i < tabs.length; i++) {
            tabs[i].classList.remove("active");
        }

        var panes = document.querySelectorAll(".tab-pane");
        for (var j = 0; j < panes.length; j++) {
            panes[j].classList.remove("show");
            panes[j].classList.remove("active");
        }

        // Add active class WITHOUT Bootstrap JS
        var button = document.querySelector("[data-bs-target='" + saved + "']");
        if (button) button.classList.add("active");

        var pane = document.querySelector(saved);
        if (pane) {
            pane.classList.add("show");
            pane.classList.add("active");
        }
    }
};


// -----------------------
// Eye Toggle Function
// -----------------------
function togglePass(id, eye) {
    var t = document.getElementById(id);
    if (t.type === "password") {
        t.type = "text";
        eye.style.opacity = "0.6";
    } else {
        t.type = "password";
        eye.style.opacity = "1";
    }
}


// -----------------------
// SweetAlert Validation
// -----------------------
function validateDriver() {

    var name = document.getElementById("<%= txtName.ClientID %>").value;
    var pass = document.getElementById("<%= txtPassword.ClientID %>").value;
    var cpass = document.getElementById("<%= txtCPassword.ClientID %>").value;

    if (name === "" || pass === "" || cpass === "") {
        Swal.fire("Missing!", "Please enter required fields", "error");
        return false;
    }

    if (pass !== cpass) {
        Swal.fire("Error", "Passwords do not match!", "warning");
        return false;
    }

    return true;
}
</script>


</asp:Content>

