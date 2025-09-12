<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" 
    AutoEventWireup="true" CodeBehind="Customer.aspx.cs" 
    Inherits="onlinecarrental.View.Admin.Customer" enableEventValidation="false" %>

=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="onlinecarrental.View.Admin.Customer" EnableEventValidation="false"
 %>
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row">

                <!-- LEFT: Manage Customer Form -->
                <div class="col-md-4">
                    <div class="text-center mb-3">
                        <h3 class="text-primary">Manage Customers</h3>
                        <!-- fixed image path -->
                        <img runat="server" src="~/Assets/Img/imageProfile.gif" 
                             class="img-fluid mb-3" style="max-height:150px;" />
                    </div>

<<<<<<< HEAD
                    <!-- Hidden field for CustId -->
                    <asp:HiddenField ID="CustIdHidden" runat="server" />
=======
         <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col"></div>
                    <h4 class="text-primary"></h4><img src="../../Assets/Img/image profile.gif" height="130px" />
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col d-grid">
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

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

<<<<<<< HEAD
                    <div class="form-group mb-2">
                        <label>Password</label>
                        <input type="text" class="form-control" id="PasswordTb" runat="server" placeholder="Enter password" />
                    </div>
=======
  <div class="form-group">
    <label for="exampleInputEmail1">Customer Address</label>
    <input type="text" class="form-control" id="AddTb" placeholder="Enter Customer's Address" runat="server">
  
  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">Customer Phone</label>
    <input type="text" class="form-control" id="PhoneTb" placeholder="Enter Phone" runat="server">
    
  </div>

 <div class="form-group">
   <label for="exampleInputEmail1">Customer Password</label>
   <input type="text" class="form-control" id="PasswordTb" placeholder="Enter Password" runat="server">
   
 </div>


<br />





  <label id ="ErrorMsg" runat="server" class="text-danger"></label><br />
  <asp:Button type="submit" id="EditBtn" class="btn btn-danger " Text = "Edit" runat= "server" />
  <asp:Button type="submit" id="SaveBtn" class="btn btn-danger " Text = "Save" runat= "server"  />
  <asp:Button type="submit" id="DeleteBtn" class="btn btn-danger " Text = "Delete" runat= "server"  />
  




</form>
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

                    <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red" CssClass="d-block my-2"></asp:Label>

                    <div class="d-grid gap-2">
                        <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                        <asp:Button ID="EditBtn" runat="server" Text="Edit" CssClass="btn btn-warning" OnClick="EditBtn_Click" />
                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="DeleteBtn_Click" />
                    </div>
                </div>

                <!-- RIGHT: Customers List -->
                <div class="col-md-8">
                    <h3 class="text-dark mb-3 text-center">Customers List</h3>
                    <asp:GridView runat="server" ID="CustomerList" CssClass="table table-bordered table-hover w-100"
                                  AutoGenerateSelectButton="true"
                                  AutoGenerateColumns="false"
                                  DataKeyNames="CustId"
                                  OnSelectedIndexChanged="CustomerList_SelectedIndexChanged">

                        <Columns>
                            <asp:BoundField DataField="CustId" HeaderText="CustId" ReadOnly="true" />
                            <asp:BoundField DataField="CustName" HeaderText="Name" />
                            <asp:BoundField DataField="CustAdd" HeaderText="Address" />
                            <asp:BoundField DataField="CustPhone" HeaderText="Phone" />
                            <asp:BoundField DataField="CustPassword" HeaderText="Password" />
                        </Columns>

                        <AlternatingRowStyle BackColor="#f9f9f9" />
                        <HeaderStyle BackColor="#007bff" ForeColor="White" Font-Bold="true" />
                    </asp:GridView>
                </div>

            </div>
<<<<<<< HEAD
=======
            <div class="col-md-8"></div> 
            <h1>CUstomers List</h1>
            <asp:GridView runat="server" ID="Customerlist" Class="table table-hover" AutoGeneraeSelecButton="True" >
    <AlternatingRowStyle BackColor="#0099FF" ForeColor="White" />

</asp:GridView>
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
        </div>
    </form>
</asp:Content>
