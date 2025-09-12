using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        Models.Functions Conn;
        string key = ""; // store selected customer ID

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();

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
    }
}
