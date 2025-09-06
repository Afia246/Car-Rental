<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="onlinecarrental.View.Admin.Customer" EnableEventValidation="false"
 %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">


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

                        <form runat="server">
  <div class="form-group">
    <label for="exampleInputEmail1">Customer Name</label>
    <input type="text" class="form-control" id="CustNameTb" placeholder="Enter Customer's Name" runat="server">

  </div>


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


                    </div>
                </div>
            </div>
            <div class="col-md-8"></div> 
            <h1>CUstomers List</h1>
            <asp:GridView runat="server" ID="Customerlist" Class="table table-hover" AutoGeneraeSelecButton="True" >
    <AlternatingRowStyle BackColor="#0099FF" ForeColor="White" />

</asp:GridView>
        </div>
    </div>
    


</asp:Content>

