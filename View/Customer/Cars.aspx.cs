using System;
<<<<<<< HEAD
using System.Collections.Generic;
using System.Linq;
using System.Web;
=======
using System.Data;
using System.Reflection;
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Customer
{
<<<<<<< HEAD
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
=======
    public partial class Cars : Page
    {
        Models.Functions Conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();

            if (!IsPostBack)
            {
                ShowCars();

                if (Session["CustomerName"] != null)
                {
                 //Custname.InnerText = Session["CustomerName"].ToString();
                }
            }
        }


        private void ShowCars()
        {
            string St = "Available";
            string Query = "SELECT * FROM CarTbl WHERE Status = '" + St + "'";
            CarList.DataSource = Conn.GetData(Query); // Use your Functions.Getdata
            CarList.DataBind();
        }

        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = CarList.SelectedRow;
            string selectedCar = row.Cells[1].Text; // Adjust index if needed
            Session["SelectedCar"] = selectedCar;
            Response.Write($"<script>alert('Selected Car: {selectedCar}');</script>");
        }

        protected void BookBtn_Click(object sender, EventArgs e)
        {
            if (Session["SelectedCar"] == null)
            {
                Response.Write("<script>alert('Please select a car first!');</script>");
                return;
            }

            if (string.IsNullOrEmpty(BookingDate.Text))
            {
                Response.Write("<script>alert('Please select a booking date!');</script>");
                return;
            }

            string carPlate = Session["SelectedCar"].ToString();
            string date = BookingDate.Text;

            // Example: store booking in DB (adjust table & columns)
            string sql = $"INSERT INTO BookingTbl (CarPlate, BookingDate) VALUES ('{carPlate}', '{date}')";
            int result = Conn.SetData(sql);

            if (result > 0)
            {
                Response.Write("<script>alert('Booking successful!');</script>");
                ShowCars(); // Refresh list if needed
            }
            else
            {
                Response.Write("<script>alert('Booking failed!');</script>");
            }
        }
    }
}
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe
