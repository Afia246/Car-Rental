<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="onlinecarrental.View.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SSA Car Rental - Login</title>
    <link rel="stylesheet" href="../Assets/Libraries/css/bootstrap.min.css" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center align-items-center" style="min-height:100vh;">
                <div class="col-md-5">
                    <div class="card shadow-lg rounded-3">
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <h3 class="text-danger fw-bold">SSA Car Rental</h3>
                                <img src="../Assets/Img/login.png" class="img-fluid" style="max-height:150px;" alt="Login" />
                            </div>

                            <!-- Email -->
                            <div class="form-group mb-3">
                                <label for="EmailTb" class="form-label">Email address</label>
                                <input type="text" class="form-control" id="UserNameTb" placeholder="Enter User Id" runat="server" required="required" />
                                <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <!-- Password -->
                            <div class="form-group mb-3">
                                <label for="PasswordTb" class="form-label">Password</label>
                                <input type="password" class="form-control" id="PasswordTb" placeholder="Password" runat="server" required="required" />
                            </div>

<div class="mb-3">
    <div class="form-check form-check-inline">
        <asp:RadioButton ID="CustRadio" runat="server" GroupName="role" CssClass="form-check-input" />
        <label class="form-check-label" for="CustRadio">Customer</label>
    </div>

    <div class="form-check form-check-inline">
        <asp:RadioButton ID="AdminRadio" runat="server" GroupName="role" CssClass="form-check-input" />
        <label class="form-check-label" for="AdminRadio">Admin</label>
    </div>
</div>


                            <!-- Error message -->
                            <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red" CssClass="d-block mb-2"></asp:Label>

                            <!-- Login Button -->
                            <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="btn btn-warning w-100" OnClick="LoginBtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
