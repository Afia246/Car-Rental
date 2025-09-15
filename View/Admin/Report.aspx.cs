using System;
using System.Data;
using System.Web.UI;
using onlinecarrental.Models;

namespace onlinecarrental.View.Admin
{
    public partial class Report : Page
    {
        Functions Conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Functions();
            if (!IsPostBack)
            {
                LoadStats();
                LoadGrids();
            }
        }

        private void LoadStats()
        {
            try
            {
                lblTotalCars.Text = Scalar("SELECT COUNT(*) FROM CarTbl");
                lblAvailableCars.Text = Scalar("SELECT COUNT(*) FROM CarTbl WHERE Status='Available'");
                lblBookedCars.Text = Scalar("SELECT COUNT(*) FROM CarTbl WHERE Status='Booked'");
                lblActiveRents.Text = Scalar("SELECT COUNT(*) FROM RentTbl");
                lblTotalCustomers.Text = Scalar("SELECT COUNT(*) FROM CustomerTbl");
                lblTotalReturns.Text = Scalar("SELECT COUNT(*) FROM ReturnTbl");
                lblActiveFees.Text = Scalar("SELECT ISNULL(SUM(Fees),0) FROM RentTbl");
                lblTotalFines.Text = Scalar("SELECT ISNULL(SUM(Fine),0) FROM ReturnTbl");
            }
            catch
            {
                // swallow: keep page rendering even if a stat fails
            }
        }

        private void LoadGrids()
        {
            try
            {
                // Recent Rents (active)
                string q1 = @"
                    SELECT TOP 10 r.RentId, r.Car AS CarPlate, c.CustName, r.RentDate, r.ReturnDate, r.Fees
                    FROM RentTbl r
                    INNER JOIN CustomerTbl c ON r.Customer = c.CustId
                    ORDER BY r.RentDate DESC";
                gvRecentRents.DataSource = Conn.GetData(q1);
                gvRecentRents.DataBind();

                // Recent Returns (completed)
                string q2 = @"
                    SELECT TOP 10 r.RetId, r.Car AS CarPlate, c.CustName, r.Date, r.Delay, r.Fine
                    FROM ReturnTbl r
                    INNER JOIN CustomerTbl c ON r.Customer = c.CustId
                    ORDER BY r.Date DESC";
                gvRecentReturns.DataSource = Conn.GetData(q2);
                gvRecentReturns.DataBind();

                // Top Vehicles by completed trips (count of returns)
                string q3 = @"
                    SELECT TOP 10 rt.Car AS CarPlate, ct.Brand, ct.Model, COUNT(*) AS Trips
                    FROM ReturnTbl rt
                    LEFT JOIN CarTbl ct ON rt.Car = ct.CPlateNum
                    GROUP BY rt.Car, ct.Brand, ct.Model
                    ORDER BY Trips DESC";
                gvTopCars.DataSource = Conn.GetData(q3);
                gvTopCars.DataBind();
            }
            catch
            {
                // swallow: keep page rendering even if a grid fails
            }
        }

        private string Scalar(string sql)
        {
            DataTable dt = Conn.GetData(sql);
            if (dt.Rows.Count == 0) return "0";
            object val = dt.Rows[0][0];
            if (val == DBNull.Value || val == null) return "0";
            // format integers with thousand separators if you like; for now plain
            return Convert.ToString(val);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for GridView rendering
        }
    }
}
