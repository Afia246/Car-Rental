<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="onlinecarrental.View.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    link rel= "stylesheet" herf = "../Assests/Libraries/css/bootstrap.min.css"/>
</head>
<body>
    <div class="container-fluid ">
        <div class="'row">
            <div class="col-md-5"></div>
            <div class ="col-md-6">
                <div class="row mt-5">
                    <div class="col"></div>
                    <div class="col">
                        <h3 class="text-danger">SSA Car Rental</h3>
                        <img src="..\Assets\Img\login.png" height="200px" />
                    </div>
                    <div class="col"></div>
                </div>
                  <div class="form-group" runat="server">

    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
            </div>
            <div class ="col-md-3"></div>
            </div>
        </div>

    
  
</body>
</html>
