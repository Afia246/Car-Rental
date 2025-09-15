using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Customer
{
    public partial class Cars : Page
    {
        Models.Functions Conn;

        // Booking variables
        string LNumber, RentDate, RetDate;
        int Fees, DPrice, Customer;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();

            if (!IsPostBack)
            {
                ShowCars();

                // Show customer name from session
                if (Session["CustomerName"] != null)
                {
                    CustName.Text = Session["CustomerName"].ToString();
                }
            }
        }

        private void ShowCars()
        {
            string St = "Available";
            string Query = "SELECT * FROM CarTbl WHERE Status = '" + St + "'";
            CarList.DataSource = Conn.GetData(Query);
            CarList.DataBind();
        }

        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = CarList.SelectedRow;

            // Selected car details
            LNumber = row.Cells[1].Text;  // CPlateNum
            DPrice = Convert.ToInt32(row.Cells[4].Text); // Price column

            Session["SelectedCar"] = LNumber;
            Session["DailyPrice"] = DPrice;

            ErrorMsg.Text = "Car selected: " + LNumber + " (Price per day: " + DPrice + ")";
            ErrorMsg.ForeColor = System.Drawing.Color.Green;
        }

        protected void BookBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(BookingDate.Text) || string.IsNullOrEmpty(ReturnDate.Text))
                {
                    ErrorMsg.Text = "Please select both booking and return dates.";
                    return;
                }

                RentDate = BookingDate.Text;
                RetDate = ReturnDate.Text;

                DateTime rentDate = Convert.ToDateTime(RentDate);
                DateTime retDate = Convert.ToDateTime(RetDate);

                if (Session["SelectedCar"] == null || Session["DailyPrice"] == null)
                {
                    ErrorMsg.Text = "Please select a car first.";
                    return;
                }

                LNumber = Session["SelectedCar"].ToString();
                DPrice = Convert.ToInt32(Session["DailyPrice"]);

                TimeSpan DDays = retDate - rentDate;
                int Days = DDays.Days;

                if (Days <= 0)
                {
                    ErrorMsg.Text = "Return date must be after booking date.";
                    return;
                }

                Fees = DPrice * Days;

                // Customer ID from session
                if (Session["CustomerID"] != null)
                {
                    Customer = Convert.ToInt32(Session["CustomerID"]);
                }
                else
                {
                    ErrorMsg.Text = "Customer not logged in.";
                    return;
                }

                // Insert booking into RentTbl
                string Query = "INSERT INTO RentTbl (Car, Customer, RentDate, ReturnDate, Fees) " +
                               "VALUES ('{0}', {1}, '{2}', '{3}', {4})";
                Query = string.Format(Query, LNumber, Customer, RentDate, RetDate, Fees);
                Conn.SetData(Query);

                // ✅ Update CarTbl status to Booked
                string updateCarStatus = "UPDATE CarTbl SET Status = 'Booked' WHERE CPlateNum = '{0}'";
                updateCarStatus = string.Format(updateCarStatus, LNumber);
                Conn.SetData(updateCarStatus);

                // Refresh available cars
                ShowCars();

                ErrorMsg.Text = "Car booked successfully. Total Fees: " + Fees;
                ErrorMsg.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception Ex)
            {
                ErrorMsg.Text = "Error: " + Ex.Message;
                ErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
