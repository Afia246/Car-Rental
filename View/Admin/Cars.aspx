<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="onlinecarrental.View.Admin.Cars" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">


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

                        <form runat="server">
  <div class="form-group">
    <label for="exampleInputEmail1">License Number</label>
    <input type="text" class="form-control" id="LNumberTb" placeholder="Enter plate Number" runat="server">

  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">Brand</label>
    <input type="text" class="form-control" id="BrandTb" placeholder="Enter The Car's Brand:" runat="server">
  
  </div>


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


                    </div>
                </div>
            </div>
            <div class="col-md-8">  
                <h1>Cars List</h1>
                <asp:GridView runat="server" ID="Carlist" Class="table table-hover" AutoGenerateSelectButton>
                    <AlternatingRowStyle BackColor="#0099FF" ForeColor="White" />

                </asp:GridView>
            </div>
           
        
    


</asp:Content>
