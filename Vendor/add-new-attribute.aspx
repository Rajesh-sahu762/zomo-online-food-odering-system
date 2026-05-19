<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="add-new-attribute.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
    


    <!-- page-wrapper start -->
    <div class="page-wrapper compact-wrapper" id="pageWrapper">
     
        <!-- Page Body start -->
        <div class="page-body-wrapper">

            <div class="page-body">

                <!-- New Product Add Start -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Category Information</h5>
                                        </div>
                                        <asp:Label ID="lblAttrMsg" runat="server"></asp:Label>
                                        <div class="card-body">
                                            <div class="input-items">
                                                <div class="row gy-3">
                                                    <div class="col-12">
                                                        <div class="input-box">
                                                            <h6>Attribute Name</h6>
                                                             <asp:TextBox ID="txtAttrName" runat="server" CssClass="form-control"  placeholder="Enter Attribute Name" />
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="input-box">
                                                            <h6>Attribute Value</h6>
                                                            <asp:TextBox ID="txtAttrValues" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" Style="height:120px;" placeholder="Small, Medium, Large" />
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <asp:Button ID="btnSaveAttr" runat="server" Text="Save" CssClass="btn restaurant-button mt-3" OnClick="btnSaveAttr_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- New Product Add End -->

                <!-- footer Start -->
                <div class="container-fluid">
                    <footer class="footer">
                        <div class="row">
                            <div class="col-md-12 footer-copyright text-center">
                                <p class="mb-0">Copyright 2024 ©Zomo template by pixelstrap</p>
                            </div>
                        </div>
                    </footer>
                </div>
                <!-- footer End -->
            </div>
            <!-- Container-fluid End -->
        </div>
        <!-- Page Body End -->
    </div>
    <!-- page-wrapper End -->

    <!-- Modal Start -->
    <div class="modal theme-modal fade" id="staticBackdrop" tabindex="-1" role="dialog" aria-modal="true">
        <div class="modal-dialog modal-md modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5>Logging Out</h5>
                    <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ri-close-line"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="mb-0">Are you sure you want to log out?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-cancel" type="button" data-bs-dismiss="modal"
                    aria-label="Close">No</button>
                    <button class="btn btn-submit" type="submit" data-bs-dismiss="modal" aria-label="Close"><a href="login.aspx">Yes</a></button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End -->


</asp:Content>

