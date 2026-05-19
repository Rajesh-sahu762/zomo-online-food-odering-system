
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="create-coupon.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<!-- Page Body Start-->
<div class="page-body-wrapper">

    <!-- index body start -->
    <div class="page-body">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h5>Create Coupon</h5>
                </div>

                <div class="card-body">
                    <div class="row">

                        <!-- TABS -->
                        <div class="col-12">
                            <ul class="nav setting-main-box driver-main-box sticky theme-scrollbar" id="v-pills-tab"
                                role="tablist">

                                <li>
                                    <button class="nav-link active" id="Settings-tab"
                                       data-tab="Settings" data-bs-toggle="pill" data-bs-target="#Settings">
                                        <i class="ri-settings-line"></i>General</button>
                                </li>

                                <li>
                                    <button class="nav-link" id="Info-tab" data-bs-toggle="pill"
                                       data-tab="Info" data-bs-target="#Info">
                                        <i class="ri-information-2-line"></i>Restriction</button>
                                </li>

                                <li>
                                    <button class="nav-link" id="Image-tab" data-bs-toggle="pill"
                                       data-tab="Image" data-bs-target="#Image">
                                        <i class="ri-timer-2-line"></i>Usage Limits</button>
                                </li>

                            </ul>
                        </div>

                        <!-- TAB CONTENT -->
                        <div class="col-12">
                            <div class="restaurant-tab">
                                <div class="tab-content" id="v-pills-tabContent">

                                    <!-- ⭐ GENERAL TAB -->
                                    <div class="tab-pane fade show active" id="Settings">
                                        <div class="input-items">
                                            <div class="row gy-3">

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Coupon Title</h6>
                                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter Your Coupon Title" />
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Coupon Code</h6>
                                                        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" placeholder="Enter Coupon Code" />
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Start Date</h6>
                                                        <asp:TextBox ID="txtStart" runat="server" TextMode="Date" CssClass="form-control" />
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>End Date</h6>
                                                        <asp:TextBox ID="txtEnd" runat="server" TextMode="Date" CssClass="form-control" />
                                                    </div>
                                                </div>

                                               
                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Discount Type</h6>
                                                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-select">
                                                            <asp:ListItem>--Select--</asp:ListItem>
                                                            <asp:ListItem Value="Percent">Percent</asp:ListItem>
                                                            <asp:ListItem Value="Fixed">Fixed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>Images</h6>
                                                            <asp:FileUpload ID="fuImage" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                 <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Quantity</h6>
                                                        <asp:TextBox ID="txtQuantity" placeholder="Enter Quantity" runat="server" TextMode="Number" CssClass="form-control" />
                                                    </div>
                                                </div>

                                                   <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Discountvalue</h6>
                                                        <asp:TextBox ID="txtdisv" placehoder="Enter Discount Value" runat="server" TextMode="Number" CssClass="form-control" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <!-- ⭐ RESTRICTIONS TAB -->
                                    <div class="tab-pane fade" id="Info">
                                        <div class="input-items">
                                            <div class="row gy-3">

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Products</h6>
                                                        <asp:TextBox ID="txtProducts" runat="server" CssClass="form-control" placeholder="Enter Products" />
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Category</h6>
                                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                                            <asp:ListItem>--Select--</asp:ListItem>
                                                            
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Minimum Spend</h6>
                                                        <asp:TextBox placeholder="Enter Amount" ID="txtMinSpend" runat="server" CssClass="form-control" TextMode="Number" />
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Maximum Spend</h6>
                                                        <asp:TextBox placeholder="Enter Amount" ID="txtMaxSpend" runat="server" CssClass="form-control" TextMode="Number" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <!-- ⭐ USAGE LIMIT TAB -->
                                    <div class="tab-pane fade" id="Image">
                                        <div class="input-items">
                                            <div class="row gy-3">

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Per Limited</h6>
                                                        <asp:TextBox ID="txtPerLimit" placeholder="Enter Limit" runat="server" CssClass="form-control" />
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="input-box">
                                                        <h6>Per Customer</h6>
                                                        <asp:TextBox ID="txtPerCustomer" runat="server" placeholder="Enter customer" CssClass="form-control" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div> <!-- tab content -->
                            </div>
                        </div>

                    </div>

                    <!-- SAVE BUTTON -->
                    <asp:Button ID="btnSave" runat="server" CssClass="btn save-button mt-2" Text="Save" OnClick="btnSave_Click" />

                </div>

            </div>
        </div>

        <!-- footer start-->
        <div class="container-fluid">
            <footer class="footer">
                <p class="mb-0 text-center">Copyright 2024 © Zomo Template</p>
            </footer>
        </div>
        <!-- footer end-->

    </div><!-- page body -->

</div><!-- wrapper -->

<script type="text/javascript">
    (function () {
        // guard flag to ignore clicks caused by programmatic show
        var programmatic = false;
        var storageKey = "activeAdminTab";

        // store user clicks (only real user clicks, not programmatic)
        var nodes = document.querySelectorAll("[data-tab]");
        for (var i = 0; i < nodes.length; i++) {
            (function (btn) {
                btn.addEventListener("click", function (ev) {
                    if (programmatic) return; // ignore programmatic events
                    try {
                        var tab = btn.getAttribute("data-tab");
                        if (tab) sessionStorage.setItem(storageKey, tab);
                    } catch (e) { /* ignore storage errors */ }
                }, false);
            })(nodes[i]);
        }

        // on load — restore tab using Bootstrap Tab API (no click())
        window.addEventListener("load", function () {
            try {
                var tab = sessionStorage.getItem(storageKey);
                if (!tab) return;

                // find trigger by data-bs-target attribute
                var selector = "[data-bs-target='#" + tab + "']";
                var triggerEl = document.querySelector(selector);
                if (!triggerEl) return;

                // set flag so click handler won't save or cause loops
                programmatic = true;

                // use Bootstrap's Tab API to show the tab (works for bootstrap 4/5)
                if (typeof bootstrap !== "undefined" && bootstrap.Tab) {
                    var bsTab = new bootstrap.Tab(triggerEl);
                    bsTab.show();
                } else {
                    // fallback: just call click but it's less safe — try only if needed
                    try { triggerEl.click(); } catch (ex) { /* ignore */ }
                }

                // small timeout to reset flag (ensures Bootstrap finished)
                setTimeout(function () { programmatic = false; }, 150);
            } catch (e) {
                // silent fail — do not break page
                programmatic = false;
            }
        }, false);
    })();
</script>


</asp:Content>

