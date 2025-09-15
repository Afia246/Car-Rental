<%@ Page Language="C#" MasterPageFile="~/View/Public/Public.Master"
    AutoEventWireup="true"
    CodeBehind="Landing.aspx.cs"
    Inherits="onlinecarrental.View.Public.Landing" %>

<asp:Content ID="HeadExtra_Styles" ContentPlaceHolderID="HeadExtra" runat="server">

    <style>
  /* --- tighten gap to header --- */
  .search-wrap{
    margin-top: .15rem;      /* almost touching the header */
    margin-bottom: .35rem;   /* hero starts right after */
  }

  /* ---------- CLEAN SINGLE-PILL SEARCH BAR ---------- */
  .search-card{
    background:#E3E5DA;                  /* requested bg */
    border:1.5px solid #233836;          /* requested border */
    border-radius:16px;
    box-shadow:0 10px 24px rgba(0,0,0,.07);
    padding:6px;                         /* inner breathing room */
    max-width:1200px;
    margin:0 auto;
    overflow:hidden;                     /* keep children inside rounded corners */
    gap:0 !important;                    /* override bootstrap gap-2 */
  }

  /* each field area – flat (no inner borders) */
  .search-field{
    background:transparent;
    border:0;                            /* remove inner borders */
    color:#233836;
    border-radius:0;
    padding:0 14px;
    height:54px;                         /* uniform height */
    display:flex; align-items:center; gap:8px;
  }

  .search-field i,
  .search-input, .search-select, .search-date{
    color:#233836;                       /* inner text color */
  }
  .search-input::placeholder{ color:#233836; opacity:.7; }

  /* Inputs/selects look flat and fill their section */
  .search-input,
  .search-select,
  .search-date{
    flex:1 1 auto;
    min-width:0;
    height:100%;
    border:0;
    background:transparent;
    outline:none;
  }

  /* optional: date icon tint */
  input[type="date"]::-webkit-calendar-picker-indicator{
    filter: invert(29%) sepia(9%) saturate(620%) hue-rotate(119deg) brightness(90%) contrast(92%);
    cursor:pointer;
  }

  .swap-btn{
    background:#E3E5DA;
    border:1.5px solid #233836;
    color:#233836;
    width:44px; height:44px; border-radius:999px;
    display:flex; align-items:center; justify-content:center;
  }

  /* Make search button match height */
  .search-go{ height:54px; font-weight:600; }

  /* Keep everything on ONE row on desktop */
  @media (min-width: 992px){
    .search-card.flex-lg-nowrap{ flex-wrap:nowrap !important; }
  }

  /* Full-bleed hero with background image */
  .hero-full {
    position: relative;
    min-height: 70vh;              /* height of hero */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
  @media (min-width: 992px){
    .hero-full { min-height: 80vh; }
  }

  /* Dark overlay to keep text readable on any photo */
  .hero-full::before{
    content:"";
    position:absolute; inset:0;
    background: linear-gradient(90deg,
      rgba(0,0,0,.55) 0%,
      rgba(0,0,0,.30) 45%,
      rgba(0,0,0,.10) 70%,
      rgba(0,0,0,0) 100%);
  }

  /* Text block on top of the image */
  .hero-content{
    position: relative;            /* above the overlay */
    z-index: 1;
    color: #fff;                   /* white text */
    padding: 4rem 0;               /* vertical breathing */
  }

  /* ===== Dark card theme ===== */
  .card.card-soft{
    background:#233836 !important;
    border:1px solid #1b2b2a !important;
    color:#e9f5f3;
    box-shadow:0 8px 22px rgba(0,0,0,.25);
  }

  .card.card-soft .card-title,
  .card.card-soft h5,
  .card.card-soft .h5{ color:#e9f5f3; }

  .card.card-soft .text-secondary{
    color:#b7d0cc !important;   /* softer text on the dark bg */
  }

  .card.card-soft a:not(.btn){
    color:#a2e9d5;
  }
  .card.card-soft a:not(.btn):hover{
    color:#c7fff0;
  }

  /* Buttons inside dark cards */
  .card.card-soft .btn-outline-gmg{
    border-color:#a2e9d5;
    color:#a2e9d5;
  }
  .card.card-soft .btn-outline-gmg:hover{
    background:#a2e9d5;
    color:#0e1f17;
  }

  /* Optional: subtle divider under images */
  .card.card-soft .card-img-top{
    border-bottom:1px solid rgba(255,255,255,.08);
  }

  /* Developers section — centered, dark theme */
  #developers .section-panel{
    background:#233836;                 /* your dark green */
    border:1px solid #1e2d2b;
    color:#E3E5DA;                      /* light text */
    text-align:center;                  /* center all text inside panel */
    border-radius:.75rem;
  }

  /* Force all text/icons to the light color */
  #developers .section-panel h3,
  #developers .section-panel p,
  #developers .section-panel li,
  #developers .section-panel i{
    color:#E3E5DA !important;
  }

  /* Center the bullet list */
  #developers .li-icon{
    list-style:none;
    padding-left:0;
    margin:1rem auto 0;
    max-width: 820px;
  }
  #developers .li-icon li{
    display:flex;
    gap:.5rem;
    align-items:center;
    justify-content:center;            /* center each bullet line */
    margin:.35rem 0;
  }

  /* Small boxed button centered under bullets */
  #developers .btn-talk{
    display:inline-block;              /* so it centers naturally */
    margin-top:.85rem;
    border:1px solid #E3E5DA;
    color:#E3E5DA;
    background:transparent;
    padding:.45rem 1rem;
    font-weight:600;
    line-height:1.2;
    border-radius:.5rem;
  }
  #developers .btn-talk:hover{
    background:#E3E5DA;
    color:#233836;
  }
  </style>
</asp:Content>

<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">
  GreenMile Garage
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <!-- SEARCH BAR (sits between header and hero) -->
<section class="search-wrap">
  <div class="container">
   <div class="search-card d-flex flex-lg-nowrap flex-wrap align-items-center gap-2">

      <!-- Leaving From -->
      <div class="flex-grow-1">
        <div class="search-field">
          <i class="bi bi-send"></i>
          <input id="s-from" type="text" class="search-input"
                 placeholder="Leaving From">
        </div>
      </div>

      <!-- Swap -->
      <button type="button" id="swapBtn" class="swap-btn" title="Swap">
        <i class="bi bi-arrow-left-right"></i>
      </button>

      <!-- Going To -->
      <div class="flex-grow-1">
        <div class="search-field">
          <i class="bi bi-geo-alt"></i>
          <input id="s-to" type="text" class="search-input"
                 placeholder="Going To">
        </div>
      </div>

      <!-- Date -->
      <div style="min-width:210px">
        <div class="search-field">
          <i class="bi bi-calendar-event"></i>
          <input id="s-date" type="date" class="search-date">
        </div>
      </div>

      <!-- Passengers -->
      <div style="min-width:150px">
        <div class="search-field">
          <i class="bi bi-person"></i>
          <select id="s-pax" class="search-select">
            <option value="1">1 Person</option>
            <option value="2">2 People</option>
            <option value="3">3 People</option>
            <option value="4">4 People</option>
            <option value="5">5 People</option>
          </select>
        </div>
      </div>

      <!-- Search Button -->
      <div style="min-width:160px">
        <button id="searchGo" class="btn btn-success w-100 search-go">
          <i class="bi bi-search me-1"></i> Search
        </button>
      </div>

    </div>
  </div>
</section>

    <script>
        (function () {
            const fromEl = document.getElementById('s-from');
            const toEl = document.getElementById('s-to');
            const dateEl = document.getElementById('s-date');
            const paxEl = document.getElementById('s-pax');

            // Swap From/To
            document.getElementById('swapBtn').addEventListener('click', function () {
                const t = fromEl.value; fromEl.value = toEl.value; toEl.value = t;
            });

            // Redirect to your cars/listing page with query params
            document.getElementById('searchGo').addEventListener('click', function () {
                const url = '<%= ResolveUrl("~/View/Customer/Cars.aspx") %>'
                    + '?from=' + encodeURIComponent(fromEl.value || '')
                    + '&to=' + encodeURIComponent(toEl.value || '')
                    + '&date=' + encodeURIComponent(dateEl.value || '')
                    + '&pax=' + encodeURIComponent(paxEl.value || '1');
                window.location.href = url;
            });
        })();
    </script>


  <!-- HERO: gm1.jpg as full background with overlayed text -->
  <section class="hero-full mb-5"
           style='background-image:url("<%= ResolveUrl("~/Assets/Img/gm1.jpg") %>");'>
    <div class="container hero-content">
      <span class="badge bg-light text-dark">Eco-first rentals</span>

      <h1 class="display-5 fw-semibold mt-3 text-white">
        Drive green with GreenMile Garage
      </h1>

      <p class="lead text-white-50 mt-2">
        Hybrids &amp; EVs, reliable service, modern booking.
      </p>

      <ul class="text-white-50" style="list-style:none; padding-left:0; margin:0;">
        <li class="mb-1"><i class="bi bi-check-circle me-2"></i> Transparent pricing &amp; contracts</li>
        <li class="mb-1"><i class="bi bi-check-circle me-2"></i> Flexible durations &amp; addons</li>
        <li class="mb-1"><i class="bi bi-check-circle me-2"></i> 24/7 roadside assistance</li>
      </ul>

      <div class="d-flex flex-wrap gap-2 mt-3">
        <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-success btn-lg">Browse cars</a>
        <a href="#features" class="btn btn-outline-light btn-lg">See features</a>
      </div>

      <div class="small mt-3 text-white-50">Trusted by customers across the country.</div>
    </div>
  </section>

  <!-- SERVICES TITLE -->
  <section class="py-5">
    <div class="container text-center">
      <h2 class="fw-bold mb-0" style="color:#233836;">Our Services</h2>
    </div>
  </section>

  <!-- FEATURE CARDS (kept, just wrapped in section+container and spaced) -->
  <section id="features" class="py-5">
    <div class="container">
      <!-- Row 1 -->
      <div class="row g-4 mt-1">
        <!-- Need a Car in Dhaka? -->
        <div class="col-md-6 col-lg-4">
          <div class="card card-soft h-100 text-center">
            <img
              src="https://images.unsplash.com/photo-1493238792000-8113da705763?w=1200&auto=format&fit=crop"
              class="card-img-top"
              alt="Need a car in Dhaka"
              style="height:220px;object-fit:cover;">
            <div class="card-body">
              <h5 class="mt-2">Need a Car in Dhaka?</h5>
              <p class="text-secondary mb-3">Rent a car in just a few clicks—instant confirmation.</p>
              <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-outline-gmg">Check Price</a>
            </div>
          </div>
        </div>

        <!-- Offers & Packages -->
        <div class="col-md-6 col-lg-4">
          <div class="card card-soft h-100 text-center">
            <img
              src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=1200&auto=format&fit=crop"
              class="card-img-top"
              alt="Offers and Packages"
              style="height:220px;object-fit:cover;">
            <div class="card-body">
              <h5 class="mt-2">Offers &amp; Packages</h5>
              <p class="text-secondary mb-3">Hand-picked deals and bundles for every trip.</p>
              <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-outline-gmg">More Details</a>
            </div>
          </div>
        </div>

        <!-- Make Money From Your Car -->
        <div class="col-md-6 col-lg-4">
          <div class="card card-soft h-100 text-center">
            <img
              src="https://images.unsplash.com/photo-1549924231-f129b911e442?w=1200&auto=format&fit=crop"
              class="card-img-top"
              alt="Make money from your car"
              style="height:220px;object-fit:cover;">
            <div class="card-body">
              <h5 class="mt-2">Make Money From Your Car</h5>
              <p class="text-secondary mb-3">List your car with us and earn safely.</p>
              <a href="<%= ResolveUrl("~/Contact.aspx") %>" class="btn btn-outline-gmg">Register Your Car</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Row 2 -->
      <div class="row g-4 mt-1">
        <!-- Destination Anywhere -->
        <div class="col-md-6 col-lg-4">
          <div class="card card-soft h-100 text-center">
            <img
              src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200&auto=format&fit=crop"
              class="card-img-top"
              alt="Destination Anywhere"
              style="height:220px;object-fit:cover;">
            <div class="card-body">
              <h5 class="mt-2">Destination Anywhere</h5>
              <p class="text-secondary mb-3">City rides or cross-country—pick your route.</p>
              <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-outline-gmg">More Details</a>
            </div>
          </div>
        </div>

        <!-- Tourism Bangladesh -->
        <div class="col-md-6 col-lg-4">
          <div class="card card-soft h-100 text-center">
            <img
              src="https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?w=1200&auto=format&fit=crop"
              class="card-img-top"
              alt="Tourism Bangladesh"
              style="height:220px;object-fit:cover;">
            <div class="card-body">
              <h5 class="mt-2">Tourism Bangladesh</h5>
              <p class="text-secondary mb-3">Ready-made itineraries and trip ideas.</p>
              <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-outline-gmg">Check Details</a>
            </div>
          </div>
        </div>

        <!-- Corporate Deal -->
        <div class="col-md-6 col-lg-4">
          <div class="card card-soft h-100 text-center">
            <img
              src="https://images.unsplash.com/photo-1542744173-05336fcc7ad4?w=1200&auto=format&fit=crop"
              class="card-img-top"
              alt="Corporate deals"
              style="height:220px;object-fit:cover;">
            <div class="card-body">
              <h5 class="mt-2">Corporate Deal</h5>
              <p class="text-secondary mb-3">Monthly billing, dedicated support, great rates.</p>
              <a href="<%= ResolveUrl("~/Contact.aspx") %>" class="btn btn-outline-gmg">Contact Us</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- SECOND HERO -->
  <section class="hero-full my-5"
           style='background-image:url("<%= ResolveUrl("~/Assets/Img/gm4.png") %>");'>
    <div class="container hero-content">
      <div class="row">
        <div class="col-lg-8 col-xl-7">
          <span class="badge bg-light text-dark">Why GreenMile</span>
          <h2 class="fw-bold mt-3">Choose EV and Save!</h2>
          <p class="lead text-white-50 mb-3">
            Book hybrids & EVs with transparent pricing, flexible durations and 24/7 support.
          </p>

          <ul class="text-white-50 mb-3" style="list-style:none;padding-left:0;">
            <li class="mb-1"><i class="bi bi-check-circle me-2"></i> Real-time availability & instant confirmation</li>
            <li class="mb-1"><i class="bi bi-check-circle me-2"></i> Insurance & roadside assistance options</li>
            <li class="mb-1"><i class="bi bi-check-circle me-2"></i> CO₂-aware choices for greener trips</li>
          </ul>

          <div class="d-flex gap-2">
            <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-success btn-lg">
              Browse Discounts
            </a>
            <a href="#faq" class="btn btn-outline-light btn-lg">
              Learn More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CALL-OUT PANEL (Developers/API feel) -->
<section id="developers" class="py-6">
  <div class="container">
    <div class="section-panel p-4 p-lg-5">
      <div class="row justify-content-center">
        <div class="col-lg-10 col-xl-9">
          <h3 class="fw-semibold mb-2">For corporate &amp; long-term needs</h3>
          <p class="mb-2">
            Consolidated billing, fleet analytics, and CO₂-aware reporting for sustainability goals.
          </p>

          <ul class="li-icon">
            <li><i class="bi bi-check2-circle"></i> Dedicated account support</li>
            <li><i class="bi bi-check2-circle"></i> Custom rate plans</li>
            <li><i class="bi bi-check2-circle"></i> Usage &amp; emission insights</li>
          </ul>

          <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-talk btn-sm">
            Talk to sales
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

   <!-- HERO TITLE -->
<section class="py-5">
  <div class="container text-center">
    <!-- smaller line -->
    <h2 class="fw-semibold mb-1" style="color:#233836;">We operate in</h2>
    <!-- bigger line -->
    <h1 class="display-3 fw-bold mb-2" style="color:#233836; letter-spacing:.02em;">
      6 DIVISIONS!
    </h1>
    <!-- optional: show the district names under the title -->
    <p class="mb-0" style="color:#233836; opacity:.8;">
      Dhaka • Chattogram • Sylhet • Rajshahi • Khulna • Barishal
    </p>
  </div>
</section>

<!-- THIRD HERO (Locations-focused) -->
<section class="hero-full my-5"
         style='background-image:url("<%= ResolveUrl("~/Assets/Img/gm5.png") %>");'>
  <div class="container hero-content">
    <div class="row">
      <div class="col-lg-8 col-xl-7">
        <span class="badge bg-light text-dark">Service areas</span>

        <h2 class="fw-bold mt-3">
          Now serving Dhaka, Chattogram, Sylhet, Rajshahi, Khulna &amp; Barishal
        </h2>

        <p class="lead text-white-50 mb-3">
          City-wide pickup zones, airport handoff, and same-day booking windows in every district.
        </p>

        <ul class="text-white-50 mb-3" style="list-style:none;padding-left:0;">
          <li class="mb-1"><i class="bi bi-geo-alt me-2"></i> Central pickup points &amp; doorstep delivery</li>
          <li class="mb-1"><i class="bi bi-airplane me-2"></i> Airport &amp; station handoffs available</li>
          <li class="mb-1"><i class="bi bi-clock me-2"></i> Same-day bookings during business hours</li>
        </ul>

        <div class="d-flex gap-2">
          <a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>" class="btn btn-success btn-lg">
            Browse cars
          </a>
          <a href="#company" class="btn btn-outline-light btn-lg">
            See pickup points
          </a>
        </div>
      </div>
    </div>
  </div>
</section>


  <!-- ======= FOOTER ======= -->
<style>
  .site-footer{background:#233836;color:#233836;padding:40px 0 0}
  .site-footer .title{color:#fff;font-weight:600;margin-bottom:.75rem}
  .site-footer a{color:#cfe6ff;text-decoration:none}
  .site-footer a:hover{color:#fff;text-decoration:underline}
  .footer-social a{display:inline-flex;width:40px;height:40px;align-items:center;justify-content:center;
                   background:#3a3a3a;border-radius:.35rem;margin-right:.35rem;font-size:18px}
  .footer-social a:hover{background:#4a4a4a}
  .footer-pay img{height:34px;margin-right:.5rem;filter:grayscale(100%);opacity:.9}
  .footer-pay img:hover{filter:none;opacity:1}
  .footer-bottom{border-top:1px solid rgba(255,255,255,.08);padding:12px 0;margin-top:22px;font-size:.9rem;color:#bdbdbd}
  /* Back-to-top button */
  .back-to-top{position:fixed;right:18px;bottom:18px;background:#2f2f2f;border:1px solid #444;color:#fff;
               width:44px;height:44px;border-radius:.5rem;display:flex;align-items:center;justify-content:center}
  .back-to-top:hover{background:#3a3a3a;color:#fff}
</style>

<footer class="site-footer mt-5">
  <div class="container">
    <div class="row g-4">
      <!-- Col 1 -->
      <div class="col-6 col-md-3">
        <div class="title">GreenMile</div>
        <ul class="list-unstyled mb-0">
          <li><a href="<%= ResolveUrl("~/Landing.aspx") %>">Home</a></li>
          <li><a href="#company">About Us</a></li>
          <li><a href="#features">Services</a></li>
          <li><a href="#pricing">Pricing</a></li>
          <li><a href="#resources">City Distance</a></li>
          <li><a href="<%= ResolveUrl("~/Contact.aspx") %>">Contact Us</a></li>
          <li><a href="#faq">FAQs</a></li>
          <li><a href="#">Latest Blog Post</a></li>
        </ul>
      </div>

      <!-- Col 2 -->
      <div class="col-6 col-md-3">
        <div class="title">Accounts & Partners</div>
        <ul class="list-unstyled mb-0">
          <li><a href="<%= ResolveUrl("~/View/Customer/Cars.aspx") %>">Our Cars</a></li>
          <li><a href="#">Our Clients</a></li>
          <li><a href="<%= ResolveUrl("~/View/Public/RegisterCar.aspx") %>">Register your car</a></li>
          <li><a href="#">Service Partner Login</a></li>
          <li><a href="#">Login &amp; Registration</a></li>
          <li><a href="#">Terms &amp; Conditions</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Customized Payment</a></li>
        </ul>
      </div>

      <!-- Col 3 -->
      <div class="col-6 col-md-3">
        <div class="title">Rentals & Packages</div>
        <ul class="list-unstyled mb-0">
          <li><a href="#">Airport Transfer</a></li>
          <li><a href="#">Hourly Car Rental</a></li>
          <li><a href="#">Daily (Inside Dhaka)</a></li>
          <li><a href="#">Daily (Outside Dhaka)</a></li>
          <li><a href="#">Monthly Car Rental</a></li>
          <li><a href="#">Office Pick &amp; Drop</a></li>
          <li><a href="#">Inter District Pick &amp; Drop</a></li>
          <li><a href="#">Day Tour / Weekly</a></li>
          <li><a href="#">Flexible Hourly Packages</a></li>
        </ul>
      </div>

      <!-- Col 4 -->
      <div class="col-6 col-md-3">
        <div class="title">Connect with us</div>
        <div class="footer-social mb-3">
          <a href="#"><i class="bi bi-facebook"></i></a>
          <a href="#"><i class="bi bi-twitter-x"></i></a>
          <a href="#"><i class="bi bi-linkedin"></i></a>
          <a href="#"><i class="bi bi-instagram"></i></a>
          <a href="#"><i class="bi bi-pinterest"></i></a>
        </div>

        <div class="title">We Accept</div>
        <div class="footer-pay">
          <!-- Use your local files if you have them; otherwise these CDN icons will work -->
          <img src="<%= ResolveUrl("~/Assets/Img/pay-amex.png") %>" onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/3/30/American_Express_logo_%282018%29.svg'; this.style.height='28px';">
          <img src="<%= ResolveUrl("~/Assets/Img/pay-visa.png") %>" onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg'; this.style.height='18px';">
          <img src="<%= ResolveUrl("~/Assets/Img/pay-mastercard.png") %>" onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg'; this.style.height='22px';">
          <img src="<%= ResolveUrl("~/Assets/Img/pay-bkash.png") %>" onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/1/11/BKash_logo.png'; this.style.height='24px';">
        </div>
      </div>
    </div>

    <div class="footer-bottom text-center">
      &copy; <%: DateTime.Now.Year %> GreenMile Garage — All rights reserved.
    </div>
  </div>
</footer>

<!-- Back to top -->
<a href="#" class="back-to-top" title="Back to top"><i class="bi bi-chevron-up"></i></a>


</asp:Content>
