
<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master" AutoEventWireup="true" CodeFile="add-new-product.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



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
                                            <h5>Product Information</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="input-items">
                                                <div class="row gy-3">
                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>Product Name</h6>
                                                               <asp:TextBox ID="proname" runat="server" placeholder="Product Name"></asp:TextBox>
                                                        </div>
                                                    </div>
                                         
                                                    <div class="col-xl-6">
                                                      
    <div class="input-box">
<h6>Category</h6>
    <asp:DropDownList ID="ddlVendorCategory" runat="server"
        CssClass="js-example-basic-single w-100">
    </asp:DropDownList>
</div>


                                                    
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Description</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="input-items">
                                                <div class="row gy-3">
                                                    <div class="col-12">
                                                        <div class="input-box">
                                                          
                                                            <div id="editor">
                                                                <asp:TextBox ID="desc" runat="server" TextMode="MultiLine"></asp:TextBox> 
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Product Images</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="input-items">
                                                <div class="row gy-3">
                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>Images</h6>
                                                            <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>Thumbnail Image</h6>
                                                            <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Product Price</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="input-items">
                                                <div class="row gy-3">
                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>price</h6>
                                                            <asp:TextBox ID="price" runat="server" TextMode="Number" placeholder="0"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>Compare at price</h6>
                                                           <asp:TextBox ID="compare" runat="server" TextMode="Number" placeholder="0"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Product Inventory</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="input-items">
                                                <div class="row gy-3">
                                                   
                                                    <div class="col-xl-6">
                                                        <div class="input-box">
                                                            <h6>Stock Status</h6>
                                                           <asp:DropDownList ID="stockstatus" runat="server">
    <asp:ListItem Text="In Stock" Value="1"></asp:ListItem>
    <asp:ListItem Text="Out Of Stock" Value="0"></asp:ListItem>
</asp:DropDownList>

                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6">
    <div class="input-box">
        <h6>Food Type</h6>
        <asp:DropDownList ID="foodtype" runat="server">
            <asp:ListItem Text="Veg" Value="Veg"></asp:ListItem>
            <asp:ListItem Text="Non-Veg" Value="Non-Veg"></asp:ListItem>
        </asp:DropDownList>
    </div>
</div>


                

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                                <div class="col-12">
                                    <!-- Attributes area -->
                                    <div class="card">
  <div class="card-header"><h5>Attributes</h5></div>
  <div class="card-body">
    <asp:PlaceHolder ID="phAttributes" runat="server"></asp:PlaceHolder>
    <small class="text-muted">Select value for each attribute (or leave blank).</small>
  </div>
</div>
                                    <div class="col-xl-12">
                                    <div class="input-box">
                                    <asp:Button ID="Button1" runat="server" class="btn restaurant-button mb-5" Text="Save" OnClick="Button1_Click" />
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
                <!-- footer En -->
            </div>
            <!-- Container-fluid End -->
        </div>
        <!-- Page Body End -->
    </div>
    <!-- page-wrapper End -->

    <!-- Modal Start -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
                    <p>Are you sure you want to log out?</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    <div class="button-box">
                        <button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
                        <button type="button" class="btn  btn--yes btn-primary">Yes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End -->

    <!-- latest js -->
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap js -->
    <script src="assets/js/bootstrap/bootstrap.bundle.min.js"></script>

    <!-- feather icon js -->
    <script src="assets/js/icons/feather-icon/feather.min.js"></script>
    <script src="assets/js/icons/feather-icon/feather-icon.js"></script>

    <!-- scrollbar simplebar js -->
    <script src="assets/js/scrollbar/simplebar.js"></script>
    <script src="assets/js/scrollbar/custom.js"></script>

    <!-- Sidebar js -->
    <script src="assets/js/config.js"></script>

    <!-- bootstrap tag-input js -->
    <script src="assets/js/bootstrap-tagsinput.min.js"></script>
    <script src="assets/js/sidebar-menu.js"></script>

    <!-- customizer js -->
    <script src="assets/js/customizer.js"></script>

    <!--Dropzon js -->
    <script src="assets/js/dropzone/dropzone.js"></script>
    <script src="assets/js/dropzone/dropzone-script.js"></script>

    <!-- ck editor js -->
    <script src="assets/js/ckeditor.js"></script>
    <script src="assets/js/ckeditor-custom.js"></script>

    <!-- select2 js -->
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/select2-custom.js"></script>

    <!-- Theme js -->
    <script src="assets/js/script.js"></script>

</asp:Content>

