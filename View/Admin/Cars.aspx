<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="onlinecarrental.View.Admin.Cars" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <form id="form1" runat="server">

        <!-- Page-level theming (keeps your layout & controls) -->
        <style>
          /* (fixed stray 's') */

          body { background:#E3E5DA; }

          /* Left panel “Manage Cars” */
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

          /* Buttons adopt your palette but keep Bootstrap classes you already use */
          .btn-primary { background:#233836; border-color:#233836; color:#E3E5DA; }
          .btn-primary:hover { background:#1b2b2a; border-color:#1b2b2a; }
          .btn-warning { background:#b9a66b; border-color:#b9a66b; color:#233836; }
          .btn-danger  { background:#8a3a3a; border-color:#7a2f2f; }

          /* Cars List Grid theme */
          .table { background:#ffffff; }
          .table thead tr { background:#233836; color:#E3E5DA; }
          .table-hover tbody tr:hover { background:#f3f4ef; }
          .table-bordered> :not(caption)>* { border-color:#c9cfc9; }

          /* Image preview box */
          .car-preview {
            width:100%; max-height:160px; object-fit:contain;
            background:#E3E5DA; border:1px dashed #233836; border-radius:8px;
            padding:6px;
          }
        </style>

        <div class="container mt-4">
            <div class="row">

                <!-- LEFT: Manage Car Form (kept) -->
                <div class="col-md-4">
                    <div class="panel mb-3">
                        <div class="text-center mb-3">
                            <h3 class="text-center m-0">Manage Cars</h3>
                        </div>

                        <div class="form-group mb-2">
                            <label>License Number</label>
                            <input type="text" class="form-control" id="LNumberTb" runat="server" placeholder="Enter plate number" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Brand</label>
                            <input type="text" class="form-control" id="BrandTb" runat="server" placeholder="Enter the car's brand" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Model</label>
                            <input type="text" class="form-control" id="ModelTb" runat="server" placeholder="Enter model" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Price</label>
                            <input type="text" class="form-control" id="PriceTb" runat="server" placeholder="Enter price" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Color</label>
                            <input type="text" class="form-control" id="ColorTb" runat="server" placeholder="Enter color" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Discount</label>
                            <input type="text" class="form-control" id="DiscountTb" runat="server" placeholder="Enter discount" />
                        </div>

                        <div class="form-group mb-2">
                            <label>Available</label>
                            <asp:DropDownList ID="AvailableCb" runat="server" CssClass="form-control">
                                <asp:ListItem>Available</asp:ListItem>
                                <asp:ListItem>Booked</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Car Photo upload -->
                        <div class="form-group mb-2">
                            <label>Car Photo</label>
                            <asp:FileUpload ID="CarImageUpload" runat="server" CssClass="form-control" />
                            <small class="form-text" style="color:#E3E5DA; opacity:.85;">
                                JPG/PNG/WebP, up to ~3MB.
                            </small>
                            <asp:HiddenField ID="ExistingPicUrl" runat="server" />
                            <div class="mt-2">
                                <asp:Image ID="CarImgPreview" runat="server" CssClass="car-preview" />
                            </div>
                        </div>

                        <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red" CssClass="d-block my-2"></asp:Label>

                        <div class="d-grid gap-2">
                            <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                            <asp:Button ID="EditBtn" runat="server" Text="Edit" CssClass="btn btn-warning" OnClick="EditBtn_Click" />
                            <asp:Button ID="Button1" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="DeleteBtn_Click" />
                        </div>
                    </div>
                </div>

                <!-- RIGHT: Cars List -->
                <div class="col-md-8">
                    <h3 class="text-dark mb-3 text-center">Cars List</h3>

                    <asp:GridView runat="server" ID="CarList"
                                  CssClass="table table-bordered table-hover w-100"
                                  AutoGenerateSelectButton="true"
                                  AutoGenerateColumns="true"
                                  DataKeyNames="CPlateNum"
                                  OnSelectedIndexChanged="CarList_SelectedIndexChanged"
                                  OnRowCreated="CarList_RowCreated">
                        <AlternatingRowStyle BackColor="#f7f9f5" />
                        <HeaderStyle BackColor="#233836" ForeColor="#E3E5DA" Font-Bold="true" />

                        
                        <Columns>
                            <asp:ImageField HeaderText="Photo" DataImageUrlField="PictureUrl">
                                <ControlStyle Height="60px" Width="90px" />
                                <ItemStyle CssClass="text-center" />
                            </asp:ImageField>
                        </Columns>
                    </asp:GridView>

                </div>

            </div>
        </div>
    </form>
</asp:Content>
