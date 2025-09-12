using System;
<<<<<<< HEAD
=======
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        Models.Functions Conn;
<<<<<<< HEAD
        string key = "";
=======


>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
<<<<<<< HEAD
=======
            ShowCars();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

            if (!IsPostBack) // ✅ Prevent reloading grid every button click
            {
                ShowCars();
            }
        }
<<<<<<< HEAD

        public override void VerifyRenderingInServerForm(Control control)
        {
            base.VerifyRenderingInServerForm(control);
        }

        // ✅ Show Cars
        private void ShowCars()
        {
            string Query = "SELECT * FROM CarTbl";
            CarList.DataSource = Conn.Getdata(Query);
            CarList.DataBind();
        }

        // ✅ Save Car
=======
        private void ShowCars()
        {
            string Query="select * from CarTbl"; 
            Carlist.DataSource = Conn.Getdata(Query);
            Carlist.DataBind();

        }

>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
<<<<<<< HEAD
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
=======
                if (LNumberTb.Value == "" || BrandTb.Value == "" || ModelTb.Value == "" || PriceTb.Value == "" || ColorTb.Value == "")
                {
                    ErrorMsg.InnerText = "Missing Information";
                }
                else
                {
                    string PlateNum = LNumberTb.Value;
                    string Brand = BrandTb.Value;
                    string Model = ModelTb.Value;
                    int Price = Convert.ToInt32(PriceTb.Value.ToString());
                    string Color = ColorTb.Value;
                    string Status = AvailableCb.SelectedValue;
                    string Query = "insert into CarTbl values('{0}','{1}','{2}','{3}','{4}','{5}')";
                    Query = String.Format(PlateNum, Brand, Model, Price, Color, Status);
                    Conn.SetData(Query);

                    ErrorMsg.InnerText = "Car Added";

                }
            }
            catch (Exception Ex)
            {
                //throw;
                ErrorMsg.InnerText = Ex.Message;
            }

        }
        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LNumberTb.Value = Carlist.SelectedRow.Cells[1].Text;
            BrandTb.Value = Carlist.SelectedRow.Cells[2].Text;
            ModelTb.Value = Carlist.SelectedRow.Cells[3].Text;
            PriceTb.Value = Carlist.SelectedRow.Cells[4].Text;
            ColorTb.Value = Carlist.SelectedRow.Cells[5].Text;
            AvailableCb.SelectedValue = Carlist.SelectedRow.Cells[6].Text;
        }
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
<<<<<<< HEAD
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


=======
                if (LNumberTb.Value == "")
                {
                    ErrorMsg.InnerText = "Missing Information";
                }
                else
                {
                    string PlateNum = LNumberTb.Value;

                    string Query = "Delete from CarTbl where CplateNum'{0}'";
                    Query = String.Format(Query, PlateNum);
                    Conn.SetData(Query);
                    ShowCars();
                    ErrorMsg.InnerText = "Car Deleted";

                }
            }
            catch (Exception Ex)
            {
                //throw;
                ErrorMsg.InnerText = Ex.Message;
            }
        }
        protected void EdiBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (LNumberTb.Value == "" || BrandTb.Value == "" || ModelTb.Value == "" || PriceTb.Value == "" || ColorTb.Value == "")
                {
                    ErrorMsg.InnerText = "Missing Information";
                }
                else
                {
                    string PlateNum = LNumberTb.Value;
                    string Brand = BrandTb.Value;
                    string Model = ModelTb.Value;
                    int Price = Convert.ToInt32(PriceTb.Value.ToString());
                    string Color = ColorTb.Value;
                    string Status = AvailableCb.SelectedValue;
                    string Query = "update CarTbl set Brand='{0}',Model='{1}',Price={2},Color='{3}',Status='{4}' where CplateNum='{5}'";
                    Query = String.Format(Query, Brand, Model, Price, Color, Status,PlateNum);
                    Conn.SetData(Query);

                    ErrorMsg.InnerText = "Car Edited";
                    ShowCars();

                }
            }
            catch (Exception Ex)
            {
                //throw;
                ErrorMsg.InnerText = Ex.Message;
            }
        }

>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
    }
}
