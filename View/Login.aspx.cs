using System;
using System.Data;
using System.Web.UI;

namespace onlinecarrental.View
{
    public partial class Login : Page
    {
        Models.Functions Conn;   // DB helper
        public static string CName = "";
        public static int CustId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string username = UserNameTb.Value.Trim();
            string password = PasswordTb.Value.Trim();

            if (AdminRadio.Checked)
            {
                // Hardcoded admin login
                if (username == "Admin" && password == "Admin")
                {
                    Response.Redirect("Admin/Home.aspx");
                }
                else
                {
                    ErrorMsg.Text = "❌ Invalid Admin credentials!";
                }
            }
            else if (CustRadio.Checked)
            {
                // Validate customer from DB
                string sql = "SELECT CustName, CustPassword, CustId FROM CustomerTbl WHERE CustName = '{0}' AND CustPassword = '{1}'";
                sql = string.Format(sql, username, password);

                DataTable dt = Conn.GetData(sql);

                if (dt.Rows.Count == 0)
                {
                    ErrorMsg.Text = "❌ Invalid Customer credentials!";
                }
                else
                {
                    CName = dt.Rows[0]["CustName"].ToString();
                    CustId = Convert.ToInt32(dt.Rows[0]["CustId"]);

                    // Store both in session
                    Session["CustomerName"] = CName;
                    Session["CustomerID"] = CustId;

                    Response.Redirect("Customer/Cars.aspx");
                }
            }
            else
            {
                ErrorMsg.Text = "⚠️ Please select a role before logging in.";
            }
        }
    }
}
