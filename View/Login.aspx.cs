using System;
using System.Data;
using System.Web.UI;

namespace onlinecarrental.View
{
    public partial class Login : Page
    {
<<<<<<< HEAD
        Models.Functions Conn;   // ✅ Correctly declared inside class
=======
        Models.Functions Conn;   // ✅ DB helper
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe
        public static string CName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();
        }

<<<<<<< HEAD
=======
        // ✅ This matches the OnClick="LoginBtn_Click" in your ASPX
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string username = UserNameTb.Value.Trim();
            string password = PasswordTb.Value.Trim();

            if (AdminRadio.Checked)
            {
<<<<<<< HEAD
                // 🔹 Hardcoded admin login for now (replace with DB table if needed)
=======
                // 🔹 Hardcoded admin login
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe
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
<<<<<<< HEAD
                // 🔹 Check from database
                string sql = "SELECT custname FROM customertbl WHERE custname = '{0}' AND custpassword = '{1}'";
                sql = string.Format(sql, username, password);

                DataTable dt = Conn.GetData(sql);   // ✅ Use your Functions class
=======
                // 🔹 Validate from DB
                string sql = "SELECT custname FROM customertbl WHERE custname = '{0}' AND custpassword = '{1}'";
                sql = string.Format(sql, username, password);

                DataTable dt = Conn.GetData(sql);
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe

                if (dt.Rows.Count == 0)
                {
                    ErrorMsg.Text = "❌ Invalid Customer credentials!";
                }
                else
                {
                    CName = dt.Rows[0]["custname"].ToString();
<<<<<<< HEAD
                    Response.Redirect("~/View/Customer/Dashboard.aspx");
=======
                    Session["CustomerName"] = CName;
                    Response.Redirect("Customer/Cars.aspx");
>>>>>>> 97c99d5e149bbad80d6bf0ea4ad1baaeb7c82bbe
                }
            }
            else
            {
                ErrorMsg.Text = "⚠️ Please select a role before logging in.";
            }
        }
    }
}
