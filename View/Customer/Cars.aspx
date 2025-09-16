<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master"
    AutoEventWireup="true" CodeBehind="Cars.aspx.cs"
    Inherits="onlinecarrental.View.Customer.Cars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
  <style>
    /* ===== Green theme polish ===== */
    :root{
      --ink:#233836;
      --paper:#E3E5DA;
    }
    .page-title h3, .page-title h4{ color:var(--ink); }

    /* Showcase cards */
    .gmg-card{
      background:#fff;
      border:1px solid #cfd6d3;
      border-radius:14px;
      box-shadow:0 8px 18px rgba(0,0,0,.06);
      overflow:hidden;
      height:100%;
    }
    .gmg-card .card-img-top{
      height:180px; object-fit:contain; background:#F4F6F2; border-bottom:1px solid #eef1ef;
    }
    .gmg-card .card-body{ padding:14px 14px 12px; color:var(--ink); }
    .gmg-card .price{ font-weight:800; letter-spacing:.3px; color:var(--ink); }
    .gmg-card .meta{ color:#4a625e; font-size:.95rem; }
    .gmg-card .badge{ background:var(--ink); color:var(--paper); font-weight:600; }

    /* Buttons in theme */
    .btn-gmg{
      background:var(--ink); color:var(--paper); border-color:var(--ink);
    }
    .btn-gmg:hover{ background:#1b2b2a; border-color:#1b2b2a; color:var(--paper); }
    .btn-gmg-outline{
      border:1px solid var(--ink); color:var(--ink); background:transparent;
    }
    .btn-gmg-outline:hover{ background:var(--ink); color:var(--paper); }

    /* GridView header -> theme */
    .cars-grid thead tr{
      background:var(--ink) !important; color:var(--paper) !important;
    }
    .cars-grid tbody tr:hover{ background:#f3f6f2 !important; }
  </style>

  <div class="container mt-4">
    <!-- ===== Page Title / Header ===== -->
    <div class="text-center mb-3 page-title">
      <h3 class="fw-bold mb-1">Welcome, 
        <asp:Label ID="CustName" runat="server" CssClass="fw-bold"></asp:Label>
      </h3>
    </div>

    <!-- ============ Showcase cards (visual, non-disruptive) ============ -->
    <section class="mb-4">
      <div class="row g-4">
        <!-- 1 -->
        <div class="col-md-6 col-lg-4">
          <div class="gmg-card">
            <img class="card-img-top" src="<%= ResolveUrl("~/Assets/Img/Car-PNG-Picture.png") %>" alt="BMW 3 Series">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>BMW 3 Series (E90)</strong>
                <span class="badge rounded-pill">Available</span>
              </div>
              <div class="meta mb-2">Auto • 4 seats • AC • Hybrid • 2 bags</div>
              <div class="d-flex align-items-baseline gap-3 mb-3">
                <div><span class="price">৳5,500</span> <small class="text-muted">/ day</small></div>
                <div><span class="fw-semibold">৳700</span> <small class="text-muted">/ hour</small></div>
              </div>
              <div class="d-flex gap-2">
                <a href="#booking" class="btn btn-gmg btn-sm">Book Now</a>
                <a href="#CarList" class="btn btn-gmg-outline btn-sm">See details</a>
              </div>
            </div>
          </div>
        </div>

        <!-- 2 -->
        <div class="col-md-6 col-lg-4">
          <div class="gmg-card">
            <img class="card-img-top" src="<%= ResolveUrl("~/Assets/Img/Exotic-Car.png") %>" alt="Maserati MC20">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>Maserati MC20</strong>
                <span class="badge rounded-pill">Booked</span>
              </div>
              <div class="meta mb-2">Auto • 2 seats • AC • Petrol • 1 bag</div>
              <div class="d-flex align-items-baseline gap-3 mb-3">
                <div><span class="price">৳12,000</span> <small class="text-muted">/ day</small></div>
                <div><span class="fw-semibold">৳1,800</span> <small class="text-muted">/ hour</small></div>
              </div>
              <div class="d-flex gap-2">
                <a href="#booking" class="btn btn-gmg btn-sm">Book Now</a>
                <a href="#CarList" class="btn btn-gmg-outline btn-sm">See details</a>
              </div>
            </div>
          </div>
        </div>

        <!-- 3 -->
        <div class="col-md-6 col-lg-4">
          <div class="gmg-card">
            <img class="card-img-top" src="<%= ResolveUrl("~/Assets/Img/car-png--2000.png") %>" alt="Honda Accord">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>Honda Accord</strong>
                <span class="badge rounded-pill">Available</span>
              </div>
              <div class="meta mb-2">Auto • 5 seats • AC • Hybrid • 3 bags</div>
              <div class="d-flex align-items-baseline gap-3 mb-3">
                <div><span class="price">৳4,800</span> <small class="text-muted">/ day</small></div>
                <div><span class="fw-semibold">৳650</span> <small class="text-muted">/ hour</small></div>
              </div>
              <div class="d-flex gap-2">
                <a href="#booking" class="btn btn-gmg btn-sm">Book Now</a>
                <a href="#CarList" class="btn btn-gmg-outline btn-sm">See details</a>
              </div>
            </div>
          </div>
        </div>

        <!-- 4 -->
        <div class="col-md-6 col-lg-4">
          <div class="gmg-card">
            <img class="card-img-top" src="<%= ResolveUrl("~/Assets/Img/Car-PNG-HD.png") %>" alt="Mercedes-Benz M-Class">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>Mercedes-Benz M-Class</strong>
                <span class="badge rounded-pill">Available</span>
              </div>
              <div class="meta mb-2">Auto • 5 seats • AC • Diesel • 4 bags</div>
              <div class="d-flex align-items-baseline gap-3 mb-3">
                <div><span class="price">৳7,200</span> <small class="text-muted">/ day</small></div>
                <div><span class="fw-semibold">৳950</span> <small class="text-muted">/ hour</small></div>
              </div>
              <div class="d-flex gap-2">
                <a href="#booking" class="btn btn-gmg btn-sm">Book Now</a>
                <a href="#CarList" class="btn btn-gmg-outline btn-sm">See details</a>
              </div>
            </div>
          </div>
        </div>

        <!-- 5 -->
        <div class="col-md-6 col-lg-4">
          <div class="gmg-card">
            <img class="card-img-top" src="<%= ResolveUrl("~/Assets/Img/Car-High-Quality-PNG.png") %>" alt="Audi A4 (B8)">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>Audi A4 (B8)</strong>
                <span class="badge rounded-pill">Available</span>
              </div>
              <div class="meta mb-2">Auto • 5 seats • AC • Petrol • 3 bags</div>
              <div class="d-flex align-items-baseline gap-3 mb-3">
                <div><span class="price">৳5,200</span> <small class="text-muted">/ day</small></div>
                <div><span class="fw-semibold">৳700</span> <small class="text-muted">/ hour</small></div>
              </div>
              <div class="d-flex gap-2">
                <a href="#booking" class="btn btn-gmg btn-sm">Book Now</a>
                <a href="#CarList" class="btn btn-gmg-outline btn-sm">See details</a>
              </div>
            </div>
          </div>
        </div>

        <!-- 6 -->
        <div class="col-md-6 col-lg-4">
          <div class="gmg-card">
            <img class="card-img-top" src="<%= ResolveUrl("~/Assets/Img/Car-PNG-Clipart.png") %>" alt="BMW 7 Series (F01)">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>BMW 7 Series (F01)</strong>
                <span class="badge rounded-pill">Booked</span>
              </div>
              <div class="meta mb-2">Auto • 5 seats • AC • Petrol • 4 bags</div>
              <div class="d-flex align-items-baseline gap-3 mb-3">
                <div><span class="price">৳8,200</span> <small class="text-muted">/ day</small></div>
                <div><span class="fw-semibold">৳1,050</span> <small class="text-muted">/ hour</small></div>
              </div>
              <div class="d-flex gap-2">
                <a href="#booking" class="btn btn-gmg btn-sm">Book Now</a>
                <a href="#CarList" class="btn btn-gmg-outline btn-sm">See details</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    <div class="text-center mb-3">
      <h4 class="fw-semibold">Available Cars</h4>
    </div>

    <div class="row justify-content-center">
      <div class="col-md-10">
        <!-- Your existing GridView (kept) -->
        <asp:GridView ID="CarList" runat="server" CssClass="table table-bordered table-hover cars-grid"
              AutoGenerateColumns="False"
              AutoGenerateSelectButton="true"
              DataKeyNames="CPlateNum,Price"
              OnSelectedIndexChanged="CarList_SelectedIndexChanged">
            <Columns>
        <asp:BoundField DataField="CPlateNum" HeaderText="Plate Number" />
        <asp:BoundField DataField="Brand" HeaderText="Brand" />
        <asp:BoundField DataField="Model" HeaderText="Model" />
        <asp:BoundField DataField="Price" HeaderText="Daily Price" />
        <asp:BoundField DataField="Color" HeaderText="Color" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
    </Columns>
    <AlternatingRowStyle BackColor="#f7f9f5" />
    <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
</asp:GridView>


        <!-- Booking controls (kept; added an id for anchor target only) -->
        <div id="booking" class="mt-3 d-flex">
          <asp:TextBox ID="BookingDate" runat="server" CssClass="form-control"
                        placeholder="Select Booking Date" TextMode="Date"></asp:TextBox>

          <asp:TextBox ID="ReturnDate" runat="server" CssClass="form-control ms-3"
                        placeholder="Select Return Date" TextMode="Date"></asp:TextBox>

          <asp:Button ID="BookBtn" runat="server" Text="Book" CssClass="btn btn-success ms-3"
                      OnClick="BookBtn_Click" />
        </div>

        <!-- Error/Status message (kept) -->
        <div class="mt-2">
          <asp:Label ID="ErrorMsg" runat="server" CssClass="fw-bold"></asp:Label>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
