<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="onlinecarrental.View.Admin.Cars" enableEventValidation="false" %>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="onlinecarrental.View.Admin.Cars" EnableEventValidation="false" %>
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
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

<<<<<<< HEAD
                    <div class="form-group mb-2">
                        <label>License Number</label>
                        <input type="text" class="form-control" id="LNumberTb" runat="server" placeholder="Enter plate number" />
                    </div>
=======
     <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col"></div>
                    <h3 class="text-primary">Manage Cars</h3>
                    <div class="col"><img src="../../Assets/Img/Car-PNG-Clipart.png" height="150px" /></div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col d-grid">
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

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

<<<<<<< HEAD
                    <div class="form-group mb-2">
                        <label>Color</label>
                        <input type="text" class="form-control" id="ColorTb" runat="server" placeholder="Enter color" />
                    </div>
=======
  <div class="form-group">
    <label for="exampleInputEmail1">Brand</label>
    <input type="text" class="form-control" id="BrandTb" placeholder="Enter The Car's Brand:" runat="server">
  
  </div>
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

                    <div class="form-group mb-2">
                        <label>Discount</label>
                        <input type="text" class="form-control" id="DiscountTb" runat="server" placeholder="Enter discount" />
                    </div>

<<<<<<< HEAD
                    <div class="form-group mb-2">
                        <label>Available</label>
                        <asp:DropDownList ID="AvailableCb" runat="server" CssClass="form-control">
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Booked</asp:ListItem>
                        </asp:DropDownList>
                    </div>
=======
  <div class="form-group">
    <label for="exampleInputEmail1">Model</label>
    <input type="text" class="form-control" id="ModelTb" placeholder="Enter Model" runat="server">
    
  </div>

    <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="text" class="form-control" id="PriceTb" placeholder="Enter Price" runat="server">
 
  </div>

   <div class="form-group">
    <label for="exampleInputEmail1">Color</label>
    <input type="text" class="form-control" id="ColorTb" placeholder="Enter Color" runat="server">
 
  </div>

 <div class="form-group">
  <label for="exampleInputEmail1">Discount</label>
  <input type="text" class="form-control" id="DiscountTb" placeholder="Enter Discount" runat="server">
 
</div>


    <div class="form-group">
    <label for="exampleInputEmail1">Available</label>
        <asp:DropDownList ID="AvailableCb" runat="server" CssClass="form-control">

        <asp:ListItem>Available</asp:ListItem>
        <asp:ListItem>Booked</asp:ListItem>
        </asp:DropDownList>
   
  </div>




<br />

  <label id ="ErrorMsg" runat="server" class="text-danger"></label><br />
  <asp:Button type="submit" id="EditBtn" class="btn btn-danger " Text = "Edit" runat= "server" OnClick="EdiBtn_Click" />
  <asp:Button type="submit" id="SaveBtn" class="btn btn-danger " Text = "Save" runat= "server" OnClick="SaveBtn_Click" />
  <asp:Button type="submit" id="DeleteBtn" class="btn btn-danger " Text = "Delete" runat= "server" OnClick="DeleteBtn_Click" />
  
</form>
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

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
<<<<<<< HEAD
        </div>
    </form>
=======
            <div class="col-md-8">  
                <h1>Cars List</h1>
                <asp:GridView runat="server" ID="Carlist" Class="table table-hover" AutoGenerateSelectButton>
                    <AlternatingRowStyle BackColor="#0099FF" ForeColor="White" />

                </asp:GridView>
            </div>
           
        
    


>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
</asp:Content>
