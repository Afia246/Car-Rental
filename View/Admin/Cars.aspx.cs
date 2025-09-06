using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        Models.Functions Conn;



        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
            ShowCars();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        private void ShowCars()
        {
            string Query="select * from CarTbl"; 
            Carlist.DataSource = Conn.Getdata(Query);
            Carlist.DataBind();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
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
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
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

    }
}
