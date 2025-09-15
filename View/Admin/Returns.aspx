<%@ Page Title="Returned Cars" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="Returns.aspx.cs" Inherits="onlinecarrental.View.Admin.Returns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
  <form id="form1" runat="server">

    <!-- THEME (page-local) -->
    <style>
      :root{
        --paper:#E3E5DA;
        --ink:#233836;
        --ink-2:#1b2b2a;
        --border:#c9cfc9;
      }
      body{ background:var(--paper); }
      h2{ color:var(--ink); font-weight:700; letter-spacing:.02em; }

      .panel-box{
        background:#fff;
        border:1px solid var(--border);
        border-radius:12px;
        box-shadow:0 10px 24px rgba(0,0,0,.06);
        padding:16px;
      }

      .table{ background:#fff; }
      .table thead tr{ background:var(--ink); color:#E3E5DA; }
      .table-hover tbody tr:hover{ background:#f3f5f1; }
      .table-bordered>:not(caption)>*{ border-color:var(--border); }
      .grid-title{ color:var(--ink); font-weight:700; }

      @media (min-width: 992px){
        .narrow-10{ max-width: 960px; }
      }
    </style>

    <div class="container-fluid">
      <div class="row my-3">
        <div class="col text-center">
          <h2>Returned Cars</h2>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-10 mx-auto narrow-10">
          <div class="panel-box">
            <div class="grid-title mb-2">Return History</div>
            <asp:GridView ID="ReturnList" runat="server"
                          CssClass="table table-bordered table-hover text-center"
                          AutoGenerateColumns="False">
              <Columns>
                <asp:BoundField DataField="RetId" HeaderText="Return ID" ReadOnly="True" />
                <asp:BoundField DataField="Car" HeaderText="Car Plate" />
                <asp:BoundField DataField="Customer" HeaderText="Customer ID" />
                <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                <asp:BoundField DataField="Date" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Delay" HeaderText="Delay (days)" />
                <asp:BoundField DataField="Fine" HeaderText="Fine" />
              </Columns>
              <AlternatingRowStyle BackColor="#f7f9f5" />
              <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
            </asp:GridView>
          </div>
        </div>
      </div>
    </div>

  </form>
</asp:Content>
