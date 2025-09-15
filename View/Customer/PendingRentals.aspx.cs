using System;
using System.Web.UI;
using onlinecarrental.Models;  // ✅ reference your Functions class
using System.Data.SqlClient;

namespace OnlineCarRental.View.Customer
{
    public partial class PendingRentals : Page
    {
        Functions Conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Functions();

            if (!IsPostBack)
            {
                ShowCars();
            }
        }

        private void ShowCars()
        {
            // ✅ Session key set at login
            string custId = Session["CustomerID"]?.ToString();

            if (!string.IsNullOrEmpty(custId))
            {
                // 🔒 Safe parameterized query
                string query = @"
                    SELECT 
                        R.RentId,
                        R.Car AS CPlateNum,   -- alias for GridView key
                        C.Brand,
                        C.Model,
                        R.RentDate,
                        R.ReturnDate,
                        R.Fees
                    FROM RentTbl R
                    INNER JOIN CarTbl C ON R.Car = C.CPlateNum
                    WHERE R.Customer = @CustId
                    ORDER BY R.RentDate DESC";

                var param = new SqlParameter("@CustId", custId);

                CarList.DataSource = Conn.GetData(query, param);  // ✅ overload GetData with params
                CarList.DataBind();
            }
            else
            {
                // Redirect to login if session expired
                Response.Redirect("~/View/Login.aspx");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for GridView export/rendering
        }
    }
}
