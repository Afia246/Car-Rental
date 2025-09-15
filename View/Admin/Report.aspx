<%@ Page Title="Reports & Analytics" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="onlinecarrental.View.Admin.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
  <form id="form1" runat="server">

    <style>
      :root{
        --paper:#E3E5DA;
        --ink:#233836;
        --border:#c9cfc9;
      }
      body{ background:var(--paper); color:var(--ink); }

      .page-title{
        background:var(--ink); color:#E3E5DA;
        border-radius:14px; padding:16px 18px; margin-top:16px;
        box-shadow:0 8px 22px rgba(0,0,0,.10);
      }
      .page-title h2{ margin:0; font-weight:800; letter-spacing:.02em; text-transform:uppercase; }
      .page-title p{ margin:.25rem 0 0; opacity:.9; }

      .stat-card{
        background:#fff; border:1px solid var(--border); border-radius:12px;
        padding:14px; height:100%;
        box-shadow:0 8px 22px rgba(0,0,0,.06);
      }
      .stat-card .label{ font-size:.9rem; opacity:.85; }
      .stat-card .value{ font-size:1.65rem; font-weight:800; color:var(--ink); line-height:1.1; }

      .section-card{
        background:#fff; border:1px solid var(--border); border-radius:12px;
        padding:14px; box-shadow:0 8px 22px rgba(0,0,0,.06);
      }
      .section-card h5{ margin:0 0 .5rem; font-weight:700; color:var(--ink); }
      .table thead tr{ background:var(--ink); color:#E3E5DA; }
      .table-hover tbody tr:hover{ background:#f3f5f1; }
    </style>

    <div class="container">

      <!-- Title -->
      <div class="page-title mb-4">
        <h2>Reports & Analytics</h2>
        <p>Live overview of cars, customers, rentals, and returns.</p>
      </div>

      <!-- Top stats -->
      <div class="row g-3 mb-2">
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Total Cars</div>
            <div class="value"><asp:Label ID="lblTotalCars" runat="server" Text="0" /></div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Available Cars</div>
            <div class="value"><asp:Label ID="lblAvailableCars" runat="server" Text="0" /></div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Booked Cars</div>
            <div class="value"><asp:Label ID="lblBookedCars" runat="server" Text="0" /></div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Active Rents</div>
            <div class="value"><asp:Label ID="lblActiveRents" runat="server" Text="0" /></div>
          </div>
        </div>
      </div>

      <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Total Customers</div>
            <div class="value"><asp:Label ID="lblTotalCustomers" runat="server" Text="0" /></div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Total Returns</div>
            <div class="value"><asp:Label ID="lblTotalReturns" runat="server" Text="0" /></div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Current Rental Fees (Active)</div>
            <div class="value">৳ <asp:Label ID="lblActiveFees" runat="server" Text="0" /></div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="label">Total Fines (All Time)</div>
            <div class="value">৳ <asp:Label ID="lblTotalFines" runat="server" Text="0" /></div>
          </div>
        </div>
      </div>

      <!-- Grids -->
      <div class="row g-4">
        <!-- Recent Rents -->
        <div class="col-12 col-lg-6">
          <div class="section-card">
            <h5>Recent Rents</h5>
            <asp:GridView ID="gvRecentRents" runat="server"
                          CssClass="table table-bordered table-hover w-100"
                          AutoGenerateColumns="False">
              <Columns>
                <asp:BoundField DataField="RentId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="CarPlate" HeaderText="Car Plate" />
                <asp:BoundField DataField="CustName" HeaderText="Customer" />
                <asp:BoundField DataField="RentDate" HeaderText="Rent Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Fees" HeaderText="Fees" DataFormatString="৳ {0:N0}" />
              </Columns>
              <AlternatingRowStyle BackColor="#f9f9f9" />
              <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
            </asp:GridView>
          </div>
        </div>

        <!-- Recent Returns -->
        <div class="col-12 col-lg-6">
          <div class="section-card">
            <h5>Recent Returns</h5>
            <asp:GridView ID="gvRecentReturns" runat="server"
                          CssClass="table table-bordered table-hover w-100"
                          AutoGenerateColumns="False">
              <Columns>
                <asp:BoundField DataField="RetId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="CarPlate" HeaderText="Car Plate" />
                <asp:BoundField DataField="CustName" HeaderText="Customer" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Delay" HeaderText="Delay (d)" />
                <asp:BoundField DataField="Fine" HeaderText="Fine" DataFormatString="৳ {0:N0}" />
              </Columns>
              <AlternatingRowStyle BackColor="#f9f9f9" />
              <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
            </asp:GridView>
          </div>
        </div>

        <!-- Top Vehicles -->
        <div class="col-12">
          <div class="section-card">
            <h5>Top Vehicles (by completed trips)</h5>
            <asp:GridView ID="gvTopCars" runat="server"
                          CssClass="table table-bordered table-hover w-100"
                          AutoGenerateColumns="False">
              <Columns>
                <asp:BoundField DataField="CarPlate" HeaderText="Car Plate" />
                <asp:BoundField DataField="Brand" HeaderText="Brand" />
                <asp:BoundField DataField="Model" HeaderText="Model" />
                <asp:BoundField DataField="Trips" HeaderText="Trips" />
              </Columns>
              <AlternatingRowStyle BackColor="#f9f9f9" />
              <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
            </asp:GridView>
          </div>
        </div>
      </div>

    </div>
  </form>
</asp:Content>
