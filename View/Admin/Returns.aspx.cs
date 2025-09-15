using System;
using System.Data;
using System.Web.UI;
using onlinecarrental.Models;

namespace onlinecarrental.View.Admin
{
    public partial class Returns : Page
    {
        Functions Conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Functions();
            if (!IsPostBack)
            {
                ShowReturnedCars();
            }
        }

        private void ShowReturnedCars()
        {
            try
            {
                string query = @"
                    SELECT r.RetId, r.Car, r.Customer, cu.CustName, r.Date, r.Delay, r.Fine
                    FROM ReturnTbl r
                    INNER JOIN CustomerTbl cu ON r.Customer = cu.CustId
                    ORDER BY r.Date DESC";

                DataTable dt = Conn.GetData(query);
                ReturnList.DataSource = dt;
                ReturnList.DataBind();
            }
            catch (Exception ex)
            {
                // Optional: display error somewhere
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for GridView rendering
        }
    }
}
