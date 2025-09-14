using System;
using System.Data;
using System.Web.UI;

namespace onlinecarrental.View
{
    public partial class Login : Page
    {
        Models.Functions Conn;   // ✅ DB helper
        public static string CName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
        }

        // ✅ This matches the OnClick="LoginBtn_Click" in your ASPX
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string username = UserNameTb.Value.Trim();
            string password = PasswordTb.Value.Trim();

            if (AdminRadio.Checked)
            {
                // 🔹 Hardcoded admin login
                if (username == "admin" && password == "123456")
                {
                    Response.Redirect("~/View/Admin/Dashboard.aspx");
                }
                else
                {
                    ErrorMsg.Text = "❌ Invalid Admin credentials!";
                }
            }
            else if (CustRadio.Checked)
            {
                // 🔹 Validate from DB
                string sql = "SELECT custname FROM customertbl WHERE custname = '{0}' AND custpassword = '{1}'";
                sql = string.Format(sql, username, password);

                DataTable dt = Conn.GetData(sql);

                if (dt.Rows.Count == 0)
                {
                    ErrorMsg.Text = "❌ Invalid Customer credentials!";
                }
                else
                {
                    CName = dt.Rows[0]["custname"].ToString();
                    Session["CustomerName"] = CName;
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
