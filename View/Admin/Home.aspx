<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="onlinecarrental.View.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">

<!-- Theme & card styles -->
<style>
  /* Make the banner match site colors without changing your markup */
  .jumbotron.bg-warning{
    background:#233836 !important;
    color:#E3E5DA !important;
    border-radius:12px;
    padding:1.5rem 1rem;
  }

  /* Uniform car images */
  .car-card img{
    height:180px;
    object-fit:contain;
    background:#E3E5DA;
    border-bottom:1px solid rgba(0,0,0,.06);
    border-top-left-radius:12px;
    border-top-right-radius:12px;
  }

  /* Card theming */
  .car-card{
    background:#233836;
    color:#E3E5DA;
    border:1px solid #1b2b2a;
    border-radius:12px;
    box-shadow:0 8px 22px rgba(0,0,0,.15);
    transition:transform .18s ease, box-shadow .18s ease;
  }
  .car-card:hover{
    transform:translateY(-2px);
    box-shadow:0 12px 28px rgba(0,0,0,.22);
  }
  .car-card .card-title{ color:#E3E5DA; margin-bottom:.25rem; }

  /* Status badge + price line */
  .status-badge{ font-weight:700; letter-spacing:.02em; }
  .badge-available{ background:#0E8F69; }
  .badge-booked{ background:#8a3a3a; }

  .price{
    font-weight:700;
    color:#E3E5DA;
    white-space:nowrap;
    font-size:.95rem;
  }

  /* Meta chips */
  .meta{ gap:.35rem; flex-wrap:wrap; }
  .amenity{
    background:rgba(227,229,218,.06);
    color:#E3E5DA;
    border:1px solid rgba(227,229,218,.25);
    padding:.15rem .5rem;
    border-radius:999px;
    font-size:.8rem;
  }
</style>

<div class="container mt-5">
  <!-- Header Section -->
  <div class="row mb-4">
    <div class="jumbotron bg-warning text-center shadow rounded w-100">
      <div class="container">
        <h1 class="display-6 mb-1">Car Rental Management System — Admin Panel</h1>
        <p class="lead mb-0">Manage Cars, Customers, Rentals and Returns</p>
      </div>
    </div>
  </div>

  <!-- Cars Grid -->
  <div class="row">
    <!-- ===== Existing 1 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\Car-PNG-Picture.png" alt="BMW 3 Series (E90)" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">BMW 3 Series (E90)</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 6,500/day · ৳ 800/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span>
            <span class="amenity">2 bags</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 2 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\Exotic-Car.png" alt="Maserati MC20" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Maserati MC20</h6>
            <span class="badge status-badge badge-booked">Booked</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 28,000/day · ৳ 3,500/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">2 seats</span>
            <span class="amenity">1 bag</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 3 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\car-png--2000.png" alt="Honda Accord" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Honda Accord</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 5,800/day · ৳ 750/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span>
            <span class="amenity">3 bags</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 4 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\Car-PNG-HD.png" alt="Mercedes-Benz M-Class" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Mercedes-Benz M-Class</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 9,500/day · ৳ 1,200/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span>
            <span class="amenity">4 bags</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 5 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\Car-High-Quality-PNG.png" alt="Audi A4 (B8)" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Audi A4 (B8)</h6>
            <span class="badge status-badge badge-booked">Booked</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 6,200/day · ৳ 780/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span>
            <span class="amenity">3 bags</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 6 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\Car-PNG-Clipart.png" alt="BMW 7 Series (F01)" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">BMW 7 Series (F01)</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 12,000/day · ৳ 1,500/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span>
            <span class="amenity">4 bags</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 7 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\Exotic-Car-PNG-Images-HD.png" alt="Lamborghini Huracán" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Lamborghini Huracán</h6>
            <span class="badge status-badge badge-booked">Booked</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 40,000/day · ৳ 5,000/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">2 seats</span>
            <span class="amenity">1 bag</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Existing 8 ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="..\..\Assets\Img\red-sports-car-png-1 (1).png" alt="Audi TT" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Audi TT</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 9,000/day · ৳ 1,150/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">4 seats</span>
            <span class="amenity">2 bags</span>
            <span class="amenity">AC</span>
            <span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 9: Toyota Prius (Hybrid) ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1619767886558-efdc259cde1b?w=1200&auto=format&fit=contain" alt="Toyota Prius Hybrid" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Toyota Prius (Hybrid)</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 4,800/day · ৳ 620/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">3 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 10: Nissan Leaf (EV) ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1606665723848-d8b5dd15e457?w=1200&auto=format&fit=contain" alt="Nissan Leaf EV" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Nissan Leaf (EV)</h6>
            <span class="badge status-badge badge-booked">Booked</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 5,200/day · ৳ 680/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">2 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 11: Honda Vezel ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1597007847922-83b3af1282a6?w=1200&auto=format&fit=contain" alt="Honda Vezel" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Honda Vezel</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 6,000/day · ৳ 780/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">3 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 12: Toyota Noah (7-seater) ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1617228913360-9a8f5b4b3db5?w=1200&auto=format&fit=contain" alt="Toyota Noah" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Toyota Noah</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 8,500/day · ৳ 1,050/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">7 seats</span><span class="amenity">5 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 13: Toyota Axio ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=1200&auto=format&fit=contain" alt="Toyota Axio" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Toyota Axio</h6>
            <span class="badge status-badge badge-booked">Booked</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 4,500/day · ৳ 600/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">2 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 14: Hyundai Tucson ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1619767886558-efdc259cde1b?w=1200&auto=format&fit=contain" alt="Hyundai Tucson" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Hyundai Tucson</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 7,800/day · ৳ 1,000/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">4 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 15: Tesla Model 3 (EV) ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1549924231-f129b911e442?w=1200&auto=format&fit=contain" alt="Tesla Model 3" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Tesla Model 3 (EV)</h6>
            <span class="badge status-badge badge-booked">Booked</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 15,000/day · ৳ 1,900/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">3 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== Added 16: Corolla Cross ===== -->
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card car-card shadow-sm h-100">
        <img src="https://images.unsplash.com/photo-1622288432450-9f2f3db59bd0?w=1200&auto=format&fit=contain" alt="Toyota Corolla Cross" class="card-img-top" />
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h6 class="card-title mb-0">Toyota Corolla Cross</h6>
            <span class="badge status-badge badge-available">Available</span>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span class="price">৳ 7,200/day · ৳ 950/hr</span>
          </div>
          <div class="d-flex meta mt-2">
            <span class="amenity">5 seats</span><span class="amenity">4 bags</span>
            <span class="amenity">AC</span><span class="amenity">Auto</span>
          </div>
        </div>
      </div>
    </div>

  </div><!-- /row -->
</div>

</asp:Content>
