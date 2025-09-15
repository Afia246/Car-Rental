using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using onlinecarrental.Models;
using System.Data.SqlClient;

namespace onlinecarrental.View.Admin
{
    public partial class Rents : Page
    {
        Functions Conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Functions();
            if (!IsPostBack)
            {
                ShowRents();
            }
        }

        private void ShowRents()
        {
            string query = @"
                SELECT r.RentId, r.Car, r.Customer, cu.CustName, 
                       r.RentDate, r.ReturnDate, r.Fees
                FROM RentTbl r
                INNER JOIN CustomerTbl cu ON r.Customer = cu.CustId
                ORDER BY r.RentDate DESC";

            DataTable dt = Conn.GetData(query);
            RentList.DataSource = dt;
            RentList.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for GridView rendering
        }

        protected void RentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in RentList.Rows)
                row.BackColor = System.Drawing.Color.White;

            if (RentList.SelectedRow != null)
            {
                RentList.SelectedRow.BackColor = System.Drawing.Color.LightBlue;

                string carId = RentList.SelectedDataKey["Car"].ToString();
                InfoMsg.Text = "Selected Car: " + carId;
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            if (RentList.SelectedRow == null)
            {
                InfoMsg.ForeColor = System.Drawing.Color.Red;
                InfoMsg.Text = "⚠️ Please select a rental first.";
                return;
            }

            try
            {
                int rentId = Convert.ToInt32(RentList.SelectedDataKey["RentId"]);
                string carId = RentList.SelectedDataKey["Car"].ToString();
                int customerId = Convert.ToInt32(RentList.SelectedDataKey["Customer"]);

                int delay = string.IsNullOrEmpty(Delay.Text) ? 0 : Convert.ToInt32(Delay.Text);
                int fine = string.IsNullOrEmpty(Fine.Text) ? 0 : Convert.ToInt32(Fine.Text);

                // Insert into ReturnTbl
                string insertQuery = @"
                    INSERT INTO ReturnTbl (Car, Customer, Date, Delay, Fine)
                    VALUES (@Car, @Customer, GETDATE(), @Delay, @Fine)";

                Conn.SetData(insertQuery,
                    new SqlParameter("@Car", carId),
                    new SqlParameter("@Customer", customerId),
                    new SqlParameter("@Delay", delay),
                    new SqlParameter("@Fine", fine)
                );

                // Delete from RentTbl
                string deleteQuery = "DELETE FROM RentTbl WHERE RentId=@RentId";
                Conn.SetData(deleteQuery, new SqlParameter("@RentId", rentId));

                // Update Car status
                string updateCar = "UPDATE CarTbl SET Status='Available' WHERE CPlateNum=@Car";
                Conn.SetData(updateCar, new SqlParameter("@Car", carId));

                InfoMsg.ForeColor = System.Drawing.Color.Green;
                InfoMsg.Text = "✅ Car returned successfully!";
                ShowRents();
            }
            catch (Exception ex)
            {
                InfoMsg.ForeColor = System.Drawing.Color.Red;
                InfoMsg.Text = "❌ Error: " + ex.Message;
            }
        }
    }
}
