<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master"
    AutoEventWireup="true" CodeBehind="Cars.aspx.cs"
    Inherits="onlinecarrental.View.Customer.Cars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <div class="container mt-4">
        <div class="text-center mb-3">
            <asp:Image ID="CarBanner" runat="server"
                       ImageUrl="~/Assets/Img/Car-High-Quality-PNG.png"
                       CssClass="img-fluid mb-3"
                       Style="max-height:160px;"
                       AlternateText="Cars" />
            <h3 class="text-primary">Available Cars</h3>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-10">
                <asp:GridView ID="CarList" runat="server" CssClass="table table-bordered table-hover"
                              AutoGenerateColumns="true"
                              AutoGenerateSelectButton="true"
                              DataKeyNames="CPlateNum"
                              OnSelectedIndexChanged="CarList_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#f9f9f9" />
                    <HeaderStyle BackColor="#007bff" ForeColor="White" Font-Bold="true" />
                </asp:GridView>

                <!-- Date picker and Book button -->
                <div class="mt-3 d-flex justify-content-between">
                    <asp:TextBox ID="BookingDate" runat="server" CssClass="form-control w-50" 
                                 placeholder="Select Date" TextMode="Date"></asp:TextBox>
                    <asp:Button ID="BookBtn" runat="server" Text="Book" CssClass="btn btn-success ms-3"
                                OnClick="BookBtn_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
