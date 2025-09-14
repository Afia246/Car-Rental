<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="onlinecarrental.View.Admin.Cars" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row">

                <!-- LEFT: Manage Car Form -->
                <div class="col-md-4">
                    <div class="text-center mb-3">
                        <h3 class="text-primary">Manage Cars</h3>
                        <img src="../../Assets/Img/Car-PNG-Clipart.png" class="img-fluid mb-3" style="max-height:150px;" />
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

                    <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red" CssClass="d-block my-2"></asp:Label>

                    <div class="d-grid gap-2">
                        <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                        <asp:Button ID="EditBtn" runat="server" Text="Edit" CssClass="btn btn-warning" OnClick="EditBtn_Click" />
                        <asp:Button ID="Button1" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="DeleteBtn_Click" />
                    </div>
                </div>

                <!-- RIGHT: Cars List -->
                <div class="col-md-8">
                    <h3 class="text-dark mb-3 text-center">Cars List</h3>
                    <asp:GridView runat="server" ID="CarList" CssClass="table table-bordered table-hover w-100"
                                  AutoGenerateSelectButton="true" AutoGenerateColumns="true"
                                  DataKeyNames="CPlateNum"
                                  OnSelectedIndexChanged="CarList_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#f9f9f9" />
                        <HeaderStyle BackColor="#007bff" ForeColor="White" Font-Bold="true" />
                    </asp:GridView>
                </div>

            </div>
        </div>
    </form>
</asp:Content>
