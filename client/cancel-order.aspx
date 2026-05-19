<%@ Page Title="" Language="C#" MasterPageFile="~/client/MasterPage.master"
    AutoEventWireup="true" CodeFile="cancel-order.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .cancel-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .cancel-card h3 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .order-id {
            font-size: 15px;
            font-weight: 500;
            color: #555;
            margin-bottom: 20px;
        }

        .cancel-card label {
            font-weight: 500;
            margin-bottom: 6px;
        }

        .cancel-actions {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- page head -->
    <section class="page-head-section">
        <div class="container page-heading">
            <h2 class="h3 mb-3 text-white text-center">Cancel Order</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ri-home-line"></i> Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="my-order.aspx">My Orders</a>
                    </li>
                    <li class="breadcrumb-item active">Cancel</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- cancel order box -->
    <section class="section-b-space">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">

                    <div class="cancel-card">
                        <h3>Cancel Your Order</h3>

                        <div class="order-id">
                            Order ID : <strong>#<%= OrderID %></strong>
                        </div>

                        <div class="mb-3">
                            <label>Reason for cancellation</label>
                            <asp:TextBox ID="txtReason"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="4"
                                placeholder="Please tell us why you want to cancel this order">
                            </asp:TextBox>
                        </div>

                        <div class="cancel-actions">
                            <a href="my-order.aspx"
                               class="btn btn-light">
                                Back
                            </a>

                            <asp:Button ID="btnCancel"
                                runat="server"
                                Text="Confirm Cancel"
                                CssClass="btn btn-danger"
                                OnClick="btnCancel_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

</asp:Content>
