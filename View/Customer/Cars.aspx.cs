using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;  // Needed for GridViewRow, etc.

namespace onlinecarrental.View.Customer
{
    public partial class Cars : Page
    {
        Models.Functions Conn;

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required if exporting GridView later
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
            if (!IsPostBack)
            {
                ShowCars();
            }
        }

        private void ShowCars()
        {
            string St = "Available";
            string Query = "SELECT * FROM CarTbl WHERE Status = '" + St + "'";
            CarList.DataSource = Conn.GetData(Query); // ✅ your Functions.GetData
            CarList.DataBind();
        }

        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Example: Get selected Car Plate Number
            GridViewRow row = CarList.SelectedRow;
            string selectedCar = row.Cells[1].Text; // Adjust index based on your DB columns
            Session["SelectedCar"] = selectedCar;

            // Optionally redirect to booking page
            // Response.Redirect("BookCar.aspx?plate=" + selectedCar);
        }
    }
}
