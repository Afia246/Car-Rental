<%@ Page Language="C#" MasterPageFile="~/View/Public/Public.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="onlinecarrental.View.Login" %>

<asp:Content ID="HeadExtra" ContentPlaceHolderID="HeadExtra" runat="server">
  <style>
    /* Page title */
    .auth-title{text-align:center; margin:2rem 0 1rem; color:#233836; letter-spacing:.04em}
    .auth-title h2{font-weight:800; text-transform:uppercase; margin:0}
    .auth-title .line{width:36px; height:2px; background:#233836; margin:.65rem auto 0}

    /* Wrapper */
    .auth-wrap{padding-bottom:3rem}
    .panel{
      background:transparent; border:1px solid rgba(35,56,54,.25); border-radius:6px;
      box-shadow:0 2px 10px rgba(0,0,0,.04);
    }
    .panel-heading{
      font-weight:700; color:#233836; padding:1rem 1.25rem; border-bottom:1px solid #e9ecef;
    }
    .panel-body{ padding:1rem 1.25rem 1.25rem; }

    /* Labels and inputs */
    .form-label{font-weight:600; color:#233836}
    .form-control, .form-select{height:46px}
    textarea.form-control{height:auto}

    /* Buttons – deep green */
    .btn-maroon{
      background:#233836 !important;
      border-color:#233836 !important;
      color:#E3E5DA !important;
    }
    .btn-maroon:hover,
    .btn-maroon:focus,
    .btn-maroon:active,
    .btn-check:focus + .btn-maroon{
      background:#1b2b2a !important;
      border-color:#1b2b2a !important;
      color:#E3E5DA !important;
    }
    .btn-maroon:disabled,
    .btn-maroon.disabled{
      opacity:.65;
      pointer-events:none;
    }

    /* Put the “Forgotten your Password?” link UNDER the button (no markup change) */
    .panel .panel-body .d-flex.align-items-center.gap-3{
      flex-direction:column;
      align-items:flex-start;
      gap:.5rem;
    }

    .agree-note{color:#a33; font-size:.85rem}
    .help-muted{opacity:.8}

    @media (max-width: 991.98px){
      .panel{margin-bottom:1rem}
    }
  </style>
</asp:Content>

<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">
  Login & Registration — GreenMile Garage
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <!-- Title -->
  <div class="auth-title">
    <h2>LOGIN & REGISTRATION</h2>
    <div class="line"></div>
  </div>

  <section class="auth-wrap">
    <div class="container">
      <div class="row g-4">

        <!-- LEFT: Existing Member (LOGIN) -->
        <div class="col-12 col-lg-4">
          <div class="panel h-100">
            <div class="panel-heading">Existing Member ?</div>
            <div class="panel-body">
              <p class="mb-3 fw-semibold">Log in here :</p>

              <!-- Email / Mobile -->
              <div class="mb-3">
                <label for="UserNameTb" class="form-label">Email/Mobile No:</label>
                <!-- keep same ID used in your code-behind -->
                <input type="text" id="UserNameTb" runat="server" class="form-control"
                       placeholder="Enter email or mobile no." required="required" />
              </div>

              <!-- Password -->
              <div class="mb-3">
                <label for="PasswordTb" class="form-label">Password:</label>
                <!-- keep same ID used in your code-behind -->
                <input type="password" id="PasswordTb" runat="server" class="form-control"
                       placeholder="Password" required="required" />
              </div>

              <!-- Role (Customer/Admin) — keeps your IDs & GroupName -->
              <div class="mb-3">
                <div class="form-check form-check-inline">
                  <asp:RadioButton ID="CustRadio" runat="server" GroupName="role"
                    CssClass="form-check-input" Checked="True" />
                  <label class="form-check-label" for="CustRadio">Customer</label>
                </div>
                <div class="form-check form-check-inline">
                  <asp:RadioButton ID="AdminRadio" runat="server" GroupName="role"
                    CssClass="form-check-input" />
                  <label class="form-check-label" for="AdminRadio">Admin</label>
                </div>
              </div>

              <!-- Error message (kept) -->
              <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red"
                         CssClass="d-block mb-2"></asp:Label>

              <div class="d-flex align-items-center gap-3">
                <!-- Login Button (kept) -->
                <asp:Button ID="LoginBtn" runat="server" Text="LOG ME IN"
                            CssClass="btn btn-maroon px-4" OnClick="LoginBtn_Click" />
                <a class="small" href="#">Forgotten your Password?</a>
              </div>
            </div>
          </div>
        </div>

        <!-- RIGHT: Registration form -->
        <div class="col-12 col-lg-8">
          <div class="panel">
            <div class="panel-heading">
              Create your account by completing the short registration form below.
            </div>
            <div class="panel-body">
              <div class="row g-3">
                <!-- First / Last name -->
                <div class="col-md-6">
                  <label class="form-label">First Name: <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" placeholder="First name" />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Last Name: <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" placeholder="Last name" />
                </div>

                <!-- Email / Mobile -->
                <div class="col-md-6">
                  <label class="form-label">Email Address: <span class="text-danger">*</span></label>
                  <input type="email" class="form-control" placeholder="your@email.com" />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Mobile Number: <span class="text-danger">*</span></label>
                  <div class="input-group">
                    <span class="input-group-text">+880</span>
                    <input type="tel" class="form-control" placeholder="1XXXXXXXXX" />
                  </div>
                </div>

                <!-- Address -->
                <div class="col-12">
                  <label class="form-label">Address <span class="text-danger">*</span></label>
                  <textarea class="form-control" rows="2"
                    placeholder="House no, Road no, Area, Post code, etc."></textarea>
                </div>

                <!-- Country / City -->
                <div class="col-md-6">
                  <label class="form-label">Country <span class="text-danger">*</span></label>
                  <select class="form-select">
                    <option>Bangladesh</option>
                    <option>India</option>
                    <option>Pakistan</option>
                    <option>Nepal</option>
                    <option>Sri Lanka</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label class="form-label">City/Town <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" placeholder="City or town" />
                </div>

                <!-- Password / Re-enter -->
                <div class="col-md-6">
                  <label class="form-label">Choose Password: <span class="text-danger">*</span></label>
                  <input type="password" class="form-control" placeholder="New password" />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Re-enter Password: <span class="text-danger">*</span></label>
                  <input type="password" class="form-control" placeholder="Re-enter password" />
                </div>

                <!-- Uploads -->
                <div class="col-md-6">
                  <label class="form-label">Upload your photo <span class="text-danger">*</span></label>
                  <asp:FileUpload ID="PhotoUpload" runat="server" CssClass="form-control" />
                  <div class="agree-note mt-1">* image allow only.</div>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Upload your National ID/Passport/Any Photo ID: <span class="text-danger">*</span></label>
                  <asp:FileUpload ID="IdUpload" runat="server" CssClass="form-control" />
                  <div class="agree-note mt-1">* image allow only.</div>
                </div>

                <!-- Agree -->
                <div class="col-12">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="agreeTerms" />
                    <label class="form-check-label" for="agreeTerms">
                      I agree to the Garivara terms and conditions
                    </label>
                  </div>
                </div>

                <!-- Submit -->
                <div class="col-12">
                  <!-- You can change PostBackUrl to your actual register handler -->
                  <a class="btn btn-maroon px-4" href="<%= ResolveUrl("~/Register.aspx") %>">
                    SIGN ME UP
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div><!-- /row -->
    </div>
  </section>

</asp:Content>
