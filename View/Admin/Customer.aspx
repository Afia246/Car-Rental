<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" 
    AutoEventWireup="true" CodeBehind="Customer.aspx.cs" 
    Inherits="onlinecarrental.View.Admin.Customer" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <form id="form1" runat="server">

        <!-- Page-level theming to match Cars.aspx -->
        <style>
          /* Header matches AdminMaster / Cars page */
          nav.navbar { background:var(--site-bg) !important; }
          nav.navbar .navbar-brand, nav.navbar .nav-link { color:#233836 !important; font-weight:600; }
          nav.navbar .nav-link:hover { color:#0E8F69 !important; }

          body { background:#E3E5DA; }

          /* Left panel look */
          .panel {
            background:#233836; color:#E3E5DA;
            border:1px solid #1b2b2a; border-radius:12px;
            box-shadow:0 8px 22px rgba(0,0,0,.15);
            padding:16px;
          }
          .panel h3, .panel label { color:#E3E5DA; }
          .panel .form-control, .panel .form-select, .panel .form-control:focus {
            background:#E3E5DA; color:#233836; border:1px solid #233836;
          }

          /* Buttons palette */
          .btn-primary { background:#233836; border-color:#233836; color:#E3E5DA; }
          .btn-primary:hover { background:#1b2b2a; border-color:#1b2b2a; }
          .btn-warning { background:#b9a66b; border-color:#b9a66b; color:#233836; }
          .btn-danger  { background:#8a3a3a; border-color:#7a2f2f; }

          /* Grid theme */
          .table { background:#ffffff; }
          .table thead tr { background:#233836; color:#E3E5DA; }
          .table-hover tbody tr:hover { background:#f3f4ef; }
          .table-bordered> :not(caption)>* { border-color:#c9cfc9; }

          /* Image preview */
          .cust-preview {
            width:100%; max-height:160px; object-fit:contain;
            background:#E3E5DA; border:1px dashed #233836; border-radius:8px;
            padding:6px;
          }
        </style>

        <div class="container mt-4">
            <div class="row">

                <!-- LEFT: Manage Customer Form -->
                <div class="col-md-4">
                    <div class="panel">
                        <div class="text-center mb-3">
                            <h3 class="text-center m-0">Manage Customers</h3>
                            
                        </div>

                        <!-- Hidden field for CustId -->
                        <asp:HiddenField ID="CustIdHidden" runat="server" />

                        <div class="form-group mb-2">
                            <label>Name</label>
                            <input type="text" class="form-control" id="NameTb" runat="server" placeholder="Enter customer name" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Address</label>
                            <input type="text" class="form-control" id="AddTb" runat="server" placeholder="Enter customer address" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Phone</label>
                            <input type="text" class="form-control" id="PhoneTb" runat="server" placeholder="Enter phone number" />
                        </div>

                        <!-- NEW: Email -->
                        <div class="form-group mb-2">
                            <label>Email</label>
                            <input type="email" class="form-control" id="EmailTb" runat="server" placeholder="Enter email address" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Password</label>
                            <input type="text" class="form-control" id="PasswordTb" runat="server" placeholder="Enter password" />
                        </div>

                        <!-- NEW: Customer Photo -->
                        <div class="form-group mb-2">
                            <label>Customer Photo</label>
                            <asp:FileUpload ID="CustomerImageUpload" runat="server" CssClass="form-control" />
                            <small class="form-text" style="color:#E3E5DA; opacity:.85;">
                              JPG/PNG/WebP, up to ~3MB.
                            </small>
                            <asp:HiddenField ID="ExistingPicUrl" runat="server" />
                            <div class="mt-2">
                                <asp:Image ID="CustImgPreview" runat="server" CssClass="cust-preview" />
                            </div>
                        </div>

                        <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red" CssClass="d-block my-2"></asp:Label>

                        <div class="d-grid gap-2">
                            <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                            <asp:Button ID="EditBtn" runat="server" Text="Edit" CssClass="btn btn-warning" OnClick="EditBtn_Click" />
                            <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="DeleteBtn_Click" />
                        </div>
                    </div>
                </div>

                <!-- RIGHT: Customers List -->
                <div class="col-md-8">
                    <h3 class="text-dark mb-3 text-center">Customers List</h3>

                    <asp:GridView runat="server" ID="CustomerList"
                                  CssClass="table table-bordered table-hover w-100"
                                  AutoGenerateSelectButton="true"
                                  AutoGenerateColumns="false"
                                  DataKeyNames="CustId"
                                  OnSelectedIndexChanged="CustomerList_SelectedIndexChanged">

                        <Columns>
                           
                            <asp:BoundField DataField="CustId" HeaderText="CustId" ReadOnly="true" />
                            <asp:BoundField DataField="CustName" HeaderText="Name" />
                            <asp:BoundField DataField="CustAdd" HeaderText="Address" />
                            <asp:BoundField DataField="CustPhone" HeaderText="Phone" />
                           
                            <asp:BoundField DataField="CustEmail" HeaderText="Email" />
                            <asp:BoundField DataField="CustPassword" HeaderText="Password" />
                            
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="PictureUrl">
                                <ControlStyle Height="60px" Width="60px" />
                                <ItemStyle CssClass="text-center" />
                            </asp:ImageField>
                        </Columns>

                        <AlternatingRowStyle BackColor="#f9f9f9" />
                        <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />
                    </asp:GridView>
                </div>

            </div>
        </div>
    </form>
</asp:Content>
