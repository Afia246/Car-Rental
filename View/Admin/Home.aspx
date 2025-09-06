<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="onlinecarrental.View.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">

<!-- Custom CSS for uniform car images -->
<style>
    .car-card img {
        height: 180px;           
        object-fit: contain;     
    }
    .car-card {
        border-radius: 12px;
        transition: transform 0.2s;
    }
    .car-card:hover {
        transform: scale(1.05);  
    }
</style>

<div class="container mt-5">
    <!-- Header Section -->
    <div class="row mb-4">
        <div class="jumbotron bg-warning text-center shadow rounded w-100">
            <div class="container">
                <h1 class="display-4">Car Rental Management System Admin Panel</h1>
                <p class="lead">The Admin can manage Cars, Customers, Rentals and Returns.</p>
            </div>
        </div>
    </div>

    <!-- Cars Grid -->
    <div class="row">
        <!-- 1 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\Car-PNG-Picture.png" alt="BMW 3 Series (E90)" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">BMW 3 Series (E90)</h6>
                </div>
            </div>
        </div>

        <!-- 2 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\Exotic-Car.png" alt="Maserati MC20" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">Maserati MC20</h6>
                </div>
            </div>
        </div>

        <!-- 3 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\car-png--2000.png" alt="Honda Accord" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">Honda Accord</h6>
                </div>
            </div>
        </div>

        <!-- 4 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\Car-PNG-HD.png" alt="Mercedes-Benz M-Class" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">Mercedes-Benz M-Class</h6>
                </div>
            </div>
        </div>

        <!-- 5 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\Car-High-Quality-PNG.png" alt="Audi A4 (B8)" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">Audi A4 (B8)</h6>
                </div>
            </div>
        </div>

        <!-- 6 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\Car-PNG-Clipart.png" alt="BMW 7 Series (F01)" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">BMW 7 Series (F01)</h6>
                </div>
            </div>
        </div>

        <!-- 7 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\Exotic-Car-PNG-Images-HD.png" alt="Lamborghini Huracán" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">Lamborghini Huracán</h6>
                </div>
            </div>
        </div>

        <!-- 8 -->
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card car-card shadow-sm h-100">
                <img src="..\..\Assets\Img\red-sports-car-png-1 (1).png" alt="Audi TT" class="card-img-top">
                <div class="card-body text-center">
                    <h6 class="card-title">Audi TT</h6>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
