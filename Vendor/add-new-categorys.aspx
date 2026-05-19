<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/vendor.master"
    AutoEventWireup="true" CodeFile="add-new-categorys.aspx.cs"
    Inherits="Vendor_AddCategory" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="page-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Add Vendor Category</h5>
                    </div>

                    <div class="card-body">
                        <div class="input-box mb-3">
                            <h6>Category Name</h6>
                            <asp:TextBox ID="txtname" runat="server"
                                CssClass="form-control"
                                placeholder="Enter category name"></asp:TextBox>
                        </div>
                        <asp:DropDownList ID="ddlGlobalCategory" runat="server"></asp:DropDownList>
                        <div class="input-box mb-3">
                            <asp:CheckBox ID="chkActive" runat="server" />
                            <label class="ms-2">Active</label>
                        </div>

                        <asp:Button ID="btnSave" runat="server"
                            Text="Save Category"
                            CssClass="btn restaurant-button"
                            OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
