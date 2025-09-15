<%@ Page Title="EV Discounts" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master"
    AutoEventWireup="true" CodeBehind="Discount.aspx.cs"
    Inherits="onlinecarrental.View.Customer.Discount" %>

<asp:Content ID="HeadBlock" ContentPlaceHolderID="head" runat="server">
  <style>
    :root{
      --ink:#233836;
      --paper:#E3E5DA;
    }

    /* Hero */
    .ev-hero{
      background:#233836;
      color:#E3E5DA;
      border-radius:14px;
      padding:28px 22px;
      box-shadow:0 8px 24px rgba(0,0,0,.2);
    }
    .ev-hero .lead{ opacity:.85; }

    /* Cards */
    .ev-card{
      background:#233836;
      color:#E3E5DA;
      border:1px solid #1b2b2a;
      border-radius:14px;
      overflow:hidden;
      box-shadow:0 8px 22px rgba(0,0,0,.18);
      height:100%;
    }
    .ev-card .ev-img{
      height:180px; width:100%; object-fit:cover; display:block;
      border-bottom:1px solid rgba(255,255,255,.08);
    }
    .ev-card .title{ font-weight:700; margin:8px 0 4px; }
    .ev-card .meta{ font-size:.95rem; opacity:.9; }
    .ev-card .list{ list-style:none; padding-left:0; margin:10px 0 0; }
    .ev-card .list li{ display:flex; gap:.5rem; align-items:center; margin:.25rem 0; opacity:.95; }
    .ev-badge{
      background:#E3E5DA; color:#233836; border-radius:999px; padding:.15rem .5rem;
      font-weight:700; font-size:.8rem; display:inline-block;
    }
    .strike{ text-decoration:line-through; opacity:.6; }

    .btn-ghost{
      border:1px solid #E3E5DA; color:#E3E5DA;
      background:transparent;
    }
    .btn-ghost:hover{ background:#E3E5DA; color:#233836; }

    .btn-light-ink{
      background:#E3E5DA; color:#233836; border-color:#E3E5DA;
    }
    .btn-light-ink:hover{ background:#dbe0d2; color:#233836; }

    /* Info panel */
    .info-panel{
      background:#233836; color:#E3E5DA; border:1px solid #1b2b2a;
      border-radius:12px; padding:18px;
    }

    .small-note{ color:#E3E5DA; opacity:.85; }
  </style>
</asp:Content>

<asp:Content ID="BodyBlock" ContentPlaceHolderID="mybody" runat="server">
  <div class="container my-4">

    <!-- Hero -->
    <div class="ev-hero mb-4">
      <div class="row align-items-center g-3">
        <div class="col-lg-8">
          <span class="ev-badge mb-2">EV & Hybrid Offers</span>
          <h2 class="mb-1">Save energy, save money</h2>
          <p class="lead mb-0">
            Book electric & hybrid cars and get weekday discounts, free charging credits,
            and lower running costs—good for your wallet and the planet.
          </p>
        </div>
        <div class="col-lg-4 text-lg-end">
          <a href="Home.aspx" class="btn btn-light-ink btn-lg">Browse cars</a>
        </div>
      </div>
    </div>

    <!-- Cards -->
    <div class="row g-4">

      <!-- 1 -->
      <div class="col-sm-6 col-lg-4">
        <div class="ev-card">
          <img class="ev-img" src="https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=1200&auto=format&fit=crop" alt="Toyota Prius Hybrid">
          <div class="p-3">
            <div class="d-flex justify-content-between align-items-center">
              <div class="title">Toyota Prius (Hybrid)</div>
              <span class="ev-badge">15% OFF</span>
            </div>
            <div class="meta">From <span class="strike">৳5,000</span> <strong>৳4,250/day</strong></div>
            <ul class="list">
              <li><i class="bi bi-fuel-pump"></i> 25–30 km/L (hybrid)</li>
              <li><i class="bi bi-people"></i> 5 seats • A/C • Auto</li>
              <li><i class="bi bi-lightning-charge"></i> Low emissions</li>
            </ul>
            <div class="d-flex gap-2 mt-3">
              <a href="Home.aspx" class="btn btn-light-ink w-50">Rent now</a>
              <a href="Home.aspx" class="btn btn-ghost w-50">See details</a>
            </div>
          </div>
        </div>
      </div>

      <!-- 2 -->
      <div class="col-sm-6 col-lg-4">
        <div class="ev-card">
          <img class="ev-img" src="https://images.unsplash.com/photo-1589391886645-d51941baf7e2?q=80&w=1200&auto=format&fit=crop" alt="Nissan Leaf EV">
          <div class="p-3">
            <div class="d-flex justify-content-between align-items-center">
              <div class="title">Nissan Leaf (EV)</div>
              <span class="ev-badge">20% OFF</span>
            </div>
            <div class="meta">From <span class="strike">৳6,000</span> <strong>৳4,800/day</strong></div>
            <ul class="list">
              <li><i class="bi bi-battery-charging"></i> ~240–270 km range</li>
              <li><i class="bi bi-people"></i> 5 seats • A/C • Auto</li>
              <li><i class="bi bi-ev-front"></i> Free 1 hr charging credit</li>
            </ul>
            <div class="d-flex gap-2 mt-3">
              <a href="Home.aspx" class="btn btn-light-ink w-50">Rent now</a>
              <a href="Home.aspx" class="btn btn-ghost w-50">See details</a>
            </div>
          </div>
        </div>
      </div>

      <!-- 3 -->
      <div class="col-sm-6 col-lg-4">
        <div class="ev-card">
          <img class="ev-img" src="https://images.unsplash.com/photo-1549921296-3f4734aa3b13?q=80&w=1200&auto=format&fit=crop" alt="Tesla Model 3">
          <div class="p-3">
            <div class="d-flex justify-content-between align-items-center">
              <div class="title">Tesla Model 3 (EV)</div>
              <span class="ev-badge">10% OFF</span>
            </div>
            <div class="meta">From <span class="strike">৳12,000</span> <strong>৳10,800/day</strong></div>
            <ul class="list">
              <li><i class="bi bi-battery-charging"></i> ~350–500 km range</li>
              <li><i class="bi bi-people"></i> 5 seats • A/C • Auto</li>
              <li><i class="bi bi-wifi"></i> Smart features & ADAS</li>
            </ul>
            <div class="d-flex gap-2 mt-3">
              <a href="Home.aspx" class="btn btn-light-ink w-50">Rent now</a>
              <a href="Home.aspx" class="btn btn-ghost w-50">See details</a>
            </div>
          </div>
        </div>
      </div>

      <!-- 4 -->
      <div class="col-sm-6 col-lg-4">
        <div class="ev-card">
          <img class="ev-img" src="https://images.unsplash.com/photo-1651585760166-b19ba30593ee?q=80&w=1200&auto=format&fit=crop" alt="Hyundai Ioniq 5">
          <div class="p-3">
            <div class="d-flex justify-content-between align-items-center">
              <div class="title">Hyundai Ioniq 5 (EV)</div>
              <span class="ev-badge">18% OFF</span>
            </div>
            <div class="meta">From <span class="strike">৳10,000</span> <strong>৳8,200/day</strong></div>
            <ul class="list">
              <li><i class="bi bi-battery-charging"></i> ~380–480 km range</li>
              <li><i class="bi bi-people"></i> 5 seats • A/C • Auto</li>
              <li><i class="bi bi-lightning"></i> Fast DC charging supported</li>
            </ul>
            <div class="d-flex gap-2 mt-3">
              <a href="Home.aspx" class="btn btn-light-ink w-50">Rent now</a>
              <a href="Home.aspx" class="btn btn-ghost w-50">See details</a>
            </div>
          </div>
        </div>
      </div>

      <!-- 5 -->
      <div class="col-sm-6 col-lg-4">
        <div class="ev-card">
          <img class="ev-img" src="https://images.unsplash.com/photo-1549921296-3f4734aa3b13?q=80&w=1200&auto=format&fit=crop" alt="Toyota Aqua Hybrid">
          <div class="p-3">
            <div class="d-flex justify-content-between align-items-center">
              <div class="title">Toyota Aqua (Hybrid)</div>
              <span class="ev-badge">12% OFF</span>
            </div>
            <div class="meta">From <span class="strike">৳4,200</span> <strong>৳3,700/day</strong></div>
            <ul class="list">
              <li><i class="bi bi-fuel-pump"></i> 22–28 km/L (hybrid)</li>
              <li><i class="bi bi-people"></i> 5 seats • A/C • Auto</li>
              <li><i class="bi bi-recycle"></i> Compact & efficient</li>
            </ul>
            <div class="d-flex gap-2 mt-3">
              <a href="Home.aspx" class="btn btn-light-ink w-50">Rent now</a>
              <a href="Home.aspx" class="btn btn-ghost w-50">See details</a>
            </div>
          </div>
        </div>
      </div>

      <!-- 6 -->
      <div class="col-sm-6 col-lg-4">
        <div class="ev-card">
          <img class="ev-img" src="https://images.unsplash.com/photo-1593837743518-42b43f0b69d6?q=80&w=1200&auto=format&fit=crop" alt="MG ZS EV">
          <div class="p-3">
            <div class="d-flex justify-content-between align-items-center">
              <div class="title">MG ZS EV</div>
              <span class="ev-badge">16% OFF</span>
            </div>
            <div class="meta">From <span class="strike">৳8,500</span> <strong>৳7,140/day</strong></div>
            <ul class="list">
              <li><i class="bi bi-battery-charging"></i> ~320–400 km range</li>
              <li><i class="bi bi-people"></i> 5 seats • SUV comfort</li>
              <li><i class="bi bi-ev-front"></i> Free parking at select points</li>
            </ul>
            <div class="d-flex gap-2 mt-3">
              <a href="Home.aspx" class="btn btn-light-ink w-50">Rent now</a>
              <a href="Home.aspx" class="btn btn-ghost w-50">See details</a>
            </div>
          </div>
        </div>
      </div>

    </div><!-- /row -->

    <!-- How it works / info -->
    <div class="info-panel mt-4">
      <div class="row g-3 align-items-center">
        <div class="col-lg-8">
          <h5 class="mb-1">How discounts work</h5>
          <ul class="mb-0" style="padding-left:1.1rem;">
            <li>Weekday EV/Hybrid bookings get automatic % off at checkout.</li>
            <li>Free charging credit applies at partnered stations (where available).</li>
            <li>Final price shown before you confirm—no hidden fees.</li>
          </ul>
        </div>
        <div class="col-lg-4 text-lg-end">
          <a href="Home.aspx" class="btn btn-light-ink">Find a discounted car</a>
        </div>
      </div>
      <div class="small-note mt-2">* Photos are illustrative. Availability and exact trim may vary by location.</div>
    </div>

  </div>
</asp:Content>
