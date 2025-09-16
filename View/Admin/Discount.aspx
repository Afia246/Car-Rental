<%@ Page Title="EV Discounts" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="Discount.aspx.cs" Inherits="onlinecarrental.View.Admin.Discount" %>


<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
  <style>
    :root{
      --paper:#E3E5DA;
      --ink:#233836;
      --muted:#1b2b2a;
      --border:#c9cfc9;
    }
    body{ background:var(--paper); color:var(--ink); }

    .discount-hero{
      background: var(--ink);
      color:#E3E5DA;
      border-radius:14px;
      padding:22px 18px;
      box-shadow:0 10px 24px rgba(0,0,0,.10);
    }
    .discount-hero h2{ margin:0; font-weight:800; letter-spacing:.02em; text-transform:uppercase; }
    .discount-hero p{ margin:.25rem 0 0; opacity:.9; }

    .ev-card{
      background:#fff;
      border:1px solid var(--border);
      border-radius:14px;
      overflow:hidden;
      box-shadow:0 8px 22px rgba(0,0,0,.06);
      height:100%;
      display:flex; flex-direction:column;
    }
    .ev-card .thumb{
      height:180px; object-fit:cover; width:100%;
      background:#f3f5f1;
    }
    .ev-card .body{ padding:14px 14px 0; flex:1; }
    .ev-card h5{ margin:0 0 .25rem; font-weight:700; color:var(--ink); }
    .ev-card .meta{ font-size:.92rem; color:#465451; }
    .ev-card ul{
      list-style:none; padding-left:0; margin:.5rem 0 0;
      color:#465451; font-size:.92rem;
    }
    .ev-card ul li{ margin:.2rem 0; display:flex; gap:.4rem; align-items:center; }
    .ev-card .price{
      display:flex; align-items:baseline; gap:.5rem; margin-top:.6rem; color:var(--ink);
    }
    .ev-card .price .old{ text-decoration:line-through; opacity:.7; }
    .ev-card .price .new{ font-weight:800; font-size:1.15rem; }
    .ev-card .foot{
      padding:12px 14px 14px;
      display:flex; justify-content:space-between; align-items:center;
    }
    .badge-off{
      background:#dfe8e4; color:var(--ink);
      border:1px solid #b9c7c1; font-weight:700;
      padding:.27rem .55rem; border-radius:.5rem; letter-spacing:.02em;
    }
    .btn-apply{
      background:var(--ink); color:#E3E5DA; border:1px solid var(--ink);
      padding:.45rem .8rem; border-radius:.5rem; font-weight:600;
    }
    .btn-apply:hover{ background:var(--muted); border-color:var(--muted); color:#E3E5DA; }

    .small-note{ color:#465451; font-size:.92rem; }
  </style>
</asp:Content>


<asp:Content ID="ContentBody" ContentPlaceHolderID="mybody" runat="server">
  <form id="form1" runat="server">
    <div class="container mt-4">

  
      <div class="discount-hero mb-4">
        <h2>Electric Vehicles</h2>
        <p>Offer special discounts on EV rentals to encourage greener trips.</p>
      </div>

      <div class="row g-4">
        
        <div class="col-md-6 col-lg-4">
          <div class="ev-card">
            <img class="thumb" src="https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=1200&auto=format&fit=crop" alt="Tesla Model 3" />
            <div class="body">
              <h5>Tesla Model 3</h5>
              <div class="meta">Mid-size sedan • 5 seats • Auto</div>
              <ul>
                <li><i class="bi bi-speedometer2"></i> ~450 km range</li>
                <li><i class="bi bi-lightning-charge"></i> DC fast-charge ~170 kW</li>
                <li><i class="bi bi-briefcase"></i> 2–3 bags</li>
              </ul>
              <div class="price">
                <span class="old">৳ 12,000/day</span>
                <span class="new">৳ 9,990/day</span>
              </div>
            </div>
            <div class="foot">
              <span class="badge-off">17% OFF</span>
              <button type="button" class="btn-apply">Apply Discount</button>
            </div>
          </div>
        </div>

        
        <div class="col-md-6 col-lg-4">
          <div class="ev-card">
            <img class="thumb" src="https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Hyundai IONIQ 5" />
            <div class="body">
              <h5>Hyundai IONIQ 5</h5>
              <div class="meta">Crossover • 5 seats • Auto</div>
              <ul>
                <li><i class="bi bi-speedometer2"></i> ~480 km range</li>
                <li><i class="bi bi-lightning-charge"></i> 350 kW ultra-fast</li>
                <li><i class="bi bi-briefcase"></i> 3–4 bags</li>
              </ul>
              <div class="price">
                <span class="old">৳ 13,500/day</span>
                <span class="new">৳ 10,800/day</span>
              </div>
            </div>
            <div class="foot">
              <span class="badge-off">20% OFF</span>
              <button type="button" class="btn-apply">Apply Discount</button>
            </div>
          </div>
        </div>

        
        <div class="col-md-6 col-lg-4">
          <div class="ev-card">
            <img class="thumb" src="https://images.unsplash.com/photo-1635451048957-3beb7175f57f?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Nissan LEAF" />
            <div class="body">
              <h5>Nissan LEAF</h5>
              <div class="meta">Compact • 5 seats • Auto</div>
              <ul>
                <li><i class="bi bi-speedometer2"></i> ~320 km range</li>
                <li><i class="bi bi-lightning-charge"></i> CHAdeMO fast charge</li>
                <li><i class="bi bi-briefcase"></i> 2 bags</li>
              </ul>
              <div class="price">
                <span class="old">৳ 9,000/day</span>
                <span class="new">৳ 7,650/day</span>
              </div>
            </div>
            <div class="foot">
              <span class="badge-off">15% OFF</span>
              <button type="button" class="btn-apply">Apply Discount</button>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-4">
          <div class="ev-card">
            <img class="thumb" src="https://images.unsplash.com/photo-1651311412157-d154a456746e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Kia Niro EV" />
            <div class="body">
              <h5>Kia Niro EV</h5>
              <div class="meta">Crossover • 5 seats • Auto</div>
              <ul>
                <li><i class="bi bi-speedometer2"></i> ~400 km range</li>
                <li><i class="bi bi-lightning-charge"></i> DC fast-charge</li>
                <li><i class="bi bi-briefcase"></i> 3 bags</li>
              </ul>
              <div class="price">
                <span class="old">৳ 10,500/day</span>
                <span class="new">৳ 8,925/day</span>
              </div>
            </div>
            <div class="foot">
              <span class="badge-off">15% OFF</span>
              <button type="button" class="btn-apply">Apply Discount</button>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-4">
          <div class="ev-card">
            <img class="thumb" src="https://images.unsplash.com/photo-1695068515364-4cbc13e91e7f?q=80&w=1065&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="BYD Atto 3" />
            <div class="body">
              <h5>BYD Atto 3</h5>
              <div class="meta">SUV • 5 seats • Auto</div>
              <ul>
                <li><i class="bi bi-speedometer2"></i> ~420 km range</li>
                <li><i class="bi bi-lightning-charge"></i> 88 kW fast charge</li>
                <li><i class="bi bi-briefcase"></i> 3 bags</li>
              </ul>
              <div class="price">
                <span class="old">৳ 11,000/day</span>
                <span class="new">৳ 9,350/day</span>
              </div>
            </div>
            <div class="foot">
              <span class="badge-off">15% OFF</span>
              <button type="button" class="btn-apply">Apply Discount</button>
            </div>
          </div>
        </div>

        
        <div class="col-md-6 col-lg-4">
          <div class="ev-card">
            <img class="thumb" src="https://images.unsplash.com/photo-1711921127533-d227262a6705?q=80&w=991&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="MG ZS EV" />
            <div class="body">
              <h5>MG ZS EV</h5>
              <div class="meta">SUV • 5 seats • Auto</div>
              <ul>
                <li><i class="bi bi-speedometer2"></i> ~440 km range</li>
                <li><i class="bi bi-lightning-charge"></i> DC fast-charge</li>
                <li><i class="bi bi-briefcase"></i> 3–4 bags</li>
              </ul>
              <div class="price">
                <span class="old">৳ 11,500/day</span>
                <span class="new">৳ 9,775/day</span>
              </div>
            </div>
            <div class="foot">
              <span class="badge-off">15% OFF</span>
              <button type="button" class="btn-apply">Apply Discount</button>
            </div>
          </div>
        </div>
      </div>

      <div class="small-note mt-3">
        * Example rates for display. You can wire these cards to real discount rules later (e.g., weekday, long-term, or promo-code based).
      </div>

    </div>
  </form>
</asp:Content>
