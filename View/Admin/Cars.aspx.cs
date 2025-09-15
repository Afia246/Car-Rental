using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        Models.Functions Conn;
        string key = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();

            if (!IsPostBack) // ✅ Prevent reloading grid every button click
            {
                ShowCars();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            base.VerifyRenderingInServerForm(control);
        }

        // ✅ Show Cars
        private void ShowCars()
        {
            string Query = "SELECT * FROM CarTbl";
            CarList.DataSource = Conn.GetData(Query);
            CarList.DataBind();
        }

        // ✅ Save Car
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(LNumberTb.Value) ||
                    string.IsNullOrWhiteSpace(BrandTb.Value) ||
                    string.IsNullOrWhiteSpace(ModelTb.Value) ||
                    string.IsNullOrWhiteSpace(PriceTb.Value) ||
                    string.IsNullOrWhiteSpace(ColorTb.Value))
                {
                    ErrorMsg.Text = "⚠ Missing Information";
                    return;
                }

                string PlateNum = LNumberTb.Value.Trim();
                string Brand = BrandTb.Value.Trim();
                string Model = ModelTb.Value.Trim();
                int Price = Convert.ToInt32(PriceTb.Value);
                string Color = ColorTb.Value.Trim();
                string Status = AvailableCb.SelectedValue;

                string Query = "INSERT INTO CarTbl (CPlateNum, Brand, Model, Price, Color, Status) " +
                               "VALUES ('{0}', '{1}', '{2}', {3}, '{4}', '{5}')";
                Query = string.Format(Query, PlateNum, Brand, Model, Price, Color, Status);

                Conn.SetData(Query);
                ErrorMsg.Text = "✅ Car Added Successfully!";
                ShowCars(); // ✅ Refresh list
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // ✅ Select Row
        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = CarList.SelectedRow;

            if (row != null)
            {
                key = CarList.DataKeys[row.RowIndex].Value.ToString();

                LNumberTb.Value = row.Cells[1].Text;
                BrandTb.Value = row.Cells[2].Text;
                ModelTb.Value = row.Cells[3].Text;
                PriceTb.Value = row.Cells[4].Text;
                ColorTb.Value = row.Cells[5].Text;
                AvailableCb.SelectedValue = row.Cells[6].Text;
            }
        }

        // ✅ Delete Car
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CarList.SelectedIndex < 0)
                {
                    ErrorMsg.Text = "⚠ Select a car to delete";
                    return;
                }

                string PlateNum = CarList.DataKeys[CarList.SelectedIndex].Value.ToString();

                string Query = "DELETE FROM CarTbl WHERE CPlateNum = '{0}'";
                Query = string.Format(Query, PlateNum);

                Conn.SetData(Query);
                ErrorMsg.Text = "🗑 Car Deleted Successfully!";
                ShowCars(); // Refresh list
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // Make sure a row is selected
                if (CarList.SelectedIndex < 0)
                {
                    ErrorMsg.Text = "⚠ Select a car to edit";
                    return;
                }

                string PlateNum = CarList.DataKeys[CarList.SelectedIndex].Value.ToString();

                // Validate input
                if (string.IsNullOrWhiteSpace(BrandTb.Value) ||
                    string.IsNullOrWhiteSpace(ModelTb.Value) ||
                    string.IsNullOrWhiteSpace(PriceTb.Value) ||
                    string.IsNullOrWhiteSpace(ColorTb.Value))
                {
                    ErrorMsg.Text = "⚠ Missing Information";
                    return;
                }

                string Brand = BrandTb.Value.Trim();
                string Model = ModelTb.Value.Trim();
                int Price = Convert.ToInt32(PriceTb.Value);
                string Color = ColorTb.Value.Trim();
                string Status = AvailableCb.SelectedValue;

                string Query = "UPDATE CarTbl SET Brand='{0}', Model='{1}', Price={2}, Color='{3}', Status='{4}' " +
                               "WHERE CPlateNum='{5}'";
                Query = string.Format(Query, Brand, Model, Price, Color, Status, PlateNum);

                Conn.SetData(Query);
                ErrorMsg.Text = "✏️ Car Updated Successfully!";
                ShowCars(); // Refresh list
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }


    }
}
