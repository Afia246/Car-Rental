<%@ Page Title="Pending Rentals" Language="C#" 
    MasterPageFile="~/View/Customer/CustomerMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="PendingRentals.aspx.cs" 
    Inherits="OnlineCarRental.View.Customer.PendingRentals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mybody" runat="server">
    <div class="container-fluid">  
        <div class="row"> 
            <div class="col text-center"> 
                <h2 class="mt-3">Your Pending Rentals</h2> 
            </div> 
        </div> 

        <div class="row mt-4">  
            <div class="col-lg-2"></div> 
            <div class="col-lg-8">
                <asp:GridView ID="CarList" runat="server" 
                              CssClass="table table-bordered table-hover"
                              AutoGenerateColumns="False"
                              DataKeyNames="CPlateNum">
                    <AlternatingRowStyle BackColor="#f9f9f9" />
                    <HeaderStyle BackColor="#28a745" ForeColor="White" Font-Bold="true" />

                    
                    <Columns>
                        <asp:BoundField DataField="RentId" HeaderText="Rental ID" ReadOnly="true" />
                        <asp:BoundField DataField="CPlateNum" HeaderText="Car Plate" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" />
                        <asp:BoundField DataField="Model" HeaderText="Model" />
                        <asp:BoundField DataField="RentDate" HeaderText="Rent Date" 
                                        DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" 
                                        DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Fees" HeaderText="Total Fees" 
                                        DataFormatString="{0:C0}" />
                    </Columns>
                </asp:GridView> 
            </div> 
            <div class="col-lg-2"></div>
        </div>
    </div> 
</asp:Content>
