using System;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        Models.Functions Conn;
        int Key = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
            if (!IsPostBack)
            {
                ShowCustomers();
            }
        }

        private void ShowCustomers()
        {
            string Query = "select * from CustomerTbl";
            Customerlist.DataSource = Conn.Getdata(Query);
            Customerlist.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for exporting GridView etc.
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CustNameTb.Value == "" || PhoneTb.Value == "" || PasswordTb.Value == "" || AddTb.Value == "")
                {
                    ErrorMsg.InnerText = "Missing Information";
                }
                else
                {
                    string CustName = CustNameTb.Value;
                    string CustAdd = AddTb.Value;
                    string CustPhone = PhoneTb.Value;
                    string CustPass = PasswordTb.Value;

                    string Query = "insert into CustomerTbl values('{0}','{1}','{2}','{3}')";
                    Query = String.Format(Query, CustName, CustAdd, CustPhone, CustPass);
                    Conn.SetData(Query);
                    ShowCustomers();
                    ErrorMsg.InnerText = "Customer Added";
                }
            }
            catch (Exception Ex)
            {
                ErrorMsg.InnerText = Ex.Message;
            }
        }

        protected void CustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustNameTb.Value = Customerlist.SelectedRow.Cells[2].Text;
            AddTb.Value = Customerlist.SelectedRow.Cells[3].Text;
            PhoneTb.Value = Customerlist.SelectedRow.Cells[4].Text;
            PasswordTb.Value = Customerlist.SelectedRow.Cells[5].Text;

            if (CustNameTb.Value == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(Customerlist.SelectedRow.Cells[1].Text); // Assuming CustId is in column 1
            }

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CustNameTb.Value == "")
                {
                    ErrorMsg.InnerText = "Missing Information";
                }
                else
                {
                    string Query = "Delete from CustomerTbl where CustId = {0}";
                    Query = String.Format(Query, Convert.ToInt32(Customerlist.SelectedRow.Cells[1].Text));
                    Conn.SetData(Query);
                    ShowCustomers();
                    ErrorMsg.InnerText = "Customer Deleted";
                }
            }
            catch (Exception Ex)
            {
                ErrorMsg.InnerText = Ex.Message;
            }
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CustNameTb.Value == "" || PhoneTb.Value == "" || PasswordTb.Value == "" || AddTb.Value == "")
                {
                    ErrorMsg.InnerText = "Missing Information";
                }
                else
                {
                    string CustName = CustNameTb.Value;
                    string CustAdd = AddTb.Value;
                    string CustPhone = PhoneTb.Value;
                    string CustPass = PasswordTb.Value;
                    string Query = "update CustomerTbl set CustName='{0}',CustAdd='{1}',CustPhone='{2}',CustPassword='{3}' where CustId='{4}'";
                    Query = String.Format(Query, CustName,CustAdd,CustPhone,CustPass, Convert.ToInt32(Customerlist.SelectedRow.Cells[1].Text));
                    Conn.SetData(Query);


                    ShowCustomers();
                    ErrorMsg.InnerText = "Customer Edited";

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
