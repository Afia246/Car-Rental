using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        Models.Functions Conn;

        public object Ex { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
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
                    string Query = "insert into CarTbl values({0},{1},{2},{3},{4},{5})";
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
    }
}