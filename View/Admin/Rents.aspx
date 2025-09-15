<%@ Page Title="Manage Rents" Language="C#" 
    MasterPageFile="~/View/Admin/AdminMaster.Master"
    AutoEventWireup="true" 
    CodeBehind="Rents.aspx.cs" 
    Inherits="onlinecarrental.View.Admin.Rents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <form id="form1" runat="server">

        <!-- THEME -->
        <style>
          :root{
            --paper:#E3E5DA;
            --ink:#233836;
            --ink-2:#1b2b2a;
            --accent:#0E8F69;
            --border:#c9cfc9;
          }
          body{ background:var(--paper); }
          h2{ color:var(--ink); font-weight:700; }
          .panel-box{
            background:#fff; border:1px solid var(--border);
            border-radius:12px; box-shadow:0 10px 24px rgba(0,0,0,.06);
            padding:16px;
          }
          .table{ background:#fff; }
          .table thead tr{ background:var(--ink); color:#E3E5DA; }
          .table-hover tbody tr:hover{ background:#f3f5f1; }
          .table-bordered>:not(caption)>*{ border-color:var(--border); }
          .grid-title{ color:var(--ink); font-weight:700; }
          .form-control{ background:#E3E5DA; color:var(--ink); border:1px solid var(--ink); }
          .form-control:focus{ border-color:var(--accent); box-shadow:none; }
          label{ color:var(--ink); font-weight:600; }
          .btn-success{ background:var(--ink); border-color:var(--ink); color:#E3E5DA; }
          .btn-success:hover{ background:var(--ink-2); border-color:var(--ink-2); color:#E3E5DA; }
          #InfoMsg{ display:block; margin-top:.5rem; color:var(--ink); }
          @media (min-width: 992px){ .narrow-10{ max-width: 960px; } }
        </style>

        <div class="container-fluid">

            <!-- Page Title -->
            <div class="row my-3">
                <div class="col text-center">
                    <h2>Rented Cars</h2>
                </div>
            </div>

            <!-- GridView for rented cars -->
            <div class="row">
                <div class="col-lg-10 mx-auto narrow-10">
                    <div class="panel-box">
                        <div class="grid-title mb-2">Active Rentals</div>
                        <asp:GridView ID="RentList" runat="server"
                            CssClass="table table-bordered table-hover text-center"
                            AutoGenerateColumns="False"
                            DataKeyNames="RentId,Car,Customer"
                            AutoGenerateSelectButton="True"
                            OnSelectedIndexChanged="RentList_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="RentId" HeaderText="Rent ID" ReadOnly="True" />
                                <asp:BoundField DataField="Car" HeaderText="Car Plate" />
                                <asp:BoundField DataField="Customer" HeaderText="Customer ID" />
                                <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                                <asp:BoundField DataField="RentDate" HeaderText="Rent Date" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="Fees" HeaderText="Fees" />
                            </Columns>
                            <AlternatingRowStyle BackColor="#f7f9f5" />
                            <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- Delay & Fine input -->
            <div class="row my-3">
                <div class="col-md-6 mx-auto">
                    <div class="panel-box">
                        <div class="mb-3">
                            <label for="Delay">Delay (days)</label>
                            <asp:TextBox ID="Delay" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="Fine">Fine (amount)</label>
                            <asp:TextBox ID="Fine" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="SaveBtn" runat="server" Text="Return Car"
                            CssClass="btn btn-success btn-block w-100" OnClick="SaveBtn_Click" />
                        <asp:Label ID="InfoMsg" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

        </div>
    </form>
</asp:Content>
