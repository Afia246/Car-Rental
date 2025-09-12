using System;
<<<<<<< HEAD
=======
using System.Drawing;
using System.Web;
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        Models.Functions Conn;
<<<<<<< HEAD
        string key = ""; // store selected customer ID
=======
        int Key = 0;
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
<<<<<<< HEAD
=======
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
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6

            if (!IsPostBack)
            {
                ShowCustomers();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            base.VerifyRenderingInServerForm(control);
        }

        // Show all customers
        private void ShowCustomers()
        {
            string Query = "SELECT * FROM CustomerTbl";
            CustomerList.DataSource = Conn.Getdata(Query);
            CustomerList.DataBind();
        }

        // Save new customer
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(NameTb.Value) ||
                    string.IsNullOrWhiteSpace(AddTb.Value) ||
                    string.IsNullOrWhiteSpace(PhoneTb.Value) ||
                    string.IsNullOrWhiteSpace(PasswordTb.Value))
                {
                    ErrorMsg.Text = "⚠ Missing Information";
                    return;
                }

                string Name = NameTb.Value.Trim();
                string Address = AddTb.Value.Trim();
                string Phone = PhoneTb.Value.Trim();
                string Password = PasswordTb.Value.Trim();

                string Query = "INSERT INTO CustomerTbl (CustName, CustAdd, CustPhone, CustPassword) " +
                               "VALUES ('{0}', '{1}', '{2}', '{3}')";
                Query = string.Format(Query, Name, Address, Phone, Password);

                Conn.SetData(Query);
                ErrorMsg.Text = "✅ Customer Added Successfully!";
                ShowCustomers();
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // Select a customer from GridView
        protected void CustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = CustomerList.SelectedRow;
            if (row != null)
            {
                key = CustomerList.DataKeys[row.RowIndex].Value.ToString();
                CustIdHidden.Value = key;

                // Fix column indexes (skip Select + CustId column)
                NameTb.Value = row.Cells[2].Text;
                AddTb.Value = row.Cells[3].Text;
                PhoneTb.Value = row.Cells[4].Text;
                PasswordTb.Value = row.Cells[5].Text;
            }
        }

        // Edit selected customer
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(CustIdHidden.Value))
                {
                    ErrorMsg.Text = "⚠ Select a customer to edit";
                    return;
                }

                string Name = NameTb.Value.Trim();
                string Address = AddTb.Value.Trim();
                string Phone = PhoneTb.Value.Trim();
                string Password = PasswordTb.Value.Trim();

                string Query = "UPDATE CustomerTbl SET CustName='{0}', CustAdd='{1}', CustPhone='{2}', CustPassword='{3}' " +
                               "WHERE CustId={4}";
                Query = string.Format(Query, Name, Address, Phone, Password, CustIdHidden.Value);

                Conn.SetData(Query);
                ErrorMsg.Text = "✏️ Customer Updated Successfully!";
                ShowCustomers();
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // Delete selected customer
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(CustIdHidden.Value))
                {
                    ErrorMsg.Text = "⚠ Select a customer to delete";
                    return;
                }

                string Query = "DELETE FROM CustomerTbl WHERE CustId={0}";
                Query = string.Format(Query, CustIdHidden.Value);

                Conn.SetData(Query);
                ErrorMsg.Text = "🗑 Customer Deleted Successfully!";
                ShowCustomers();
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
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
