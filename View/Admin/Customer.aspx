<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="onlinecarrental.View.Admin.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">


         <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col"></div>
                    <h3 class="text-primary"><img src="../../Assets/Img/image profile.gif"</h3>
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
   <input type="text" class="form-control" id="Text1" placeholder="Enter Password" runat="server">
   
 </div>


<br />


<br />


  <button type="submit" class="btn btn-primary ">Edit</button>
  <button type="submit" class="btn btn-primary ">Add</button>

  <button type="submit" class="btn btn-danger ">Delete</button>





</form>


                    </div>
                </div>
            </div>
            <div class="col-md-8"></div>
            <table class="table">


                
            </table>
        </div>
    </div>
    


</asp:Content>

