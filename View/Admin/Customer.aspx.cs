using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        Models.Functions Conn;
        string key = ""; // store selected customer ID

        // Keep for compatibility; intentionally empty so no GIF shows by default
        private const string CustomerFallbackImage = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();

            if (!IsPostBack)
            {
                ShowCustomers();
                // default preview (blank to avoid GIF)
                if (CustImgPreview != null)
                    CustImgPreview.ImageUrl = CustomerFallbackImage;
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
            CustomerList.DataSource = Conn.GetData(Query);
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
                    string.IsNullOrWhiteSpace(EmailTb.Value) ||
                    string.IsNullOrWhiteSpace(PasswordTb.Value))
                {
                    ErrorMsg.Text = "⚠ Missing Information";
                    return;
                }

                string Name = NameTb.Value.Trim();
                string Address = AddTb.Value.Trim();
                string Phone = PhoneTb.Value.Trim();
                string Email = EmailTb.Value.Trim();
                string Password = PasswordTb.Value.Trim();

                string picUrl = SaveUploadedCustomerImage();

                string Query = "INSERT INTO CustomerTbl (CustName, CustAdd, CustPhone, CustEmail, CustPassword, PictureUrl) " +
                               "VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')";
                Query = string.Format(Query, Name, Address, Phone, Email, Password, picUrl ?? "");

                Conn.SetData(Query);
                ErrorMsg.Text = "✅ Customer Added Successfully!";
                ShowCustomers();

                ExistingPicUrl.Value = picUrl ?? "";
                CustImgPreview.ImageUrl = string.IsNullOrEmpty(ExistingPicUrl.Value) ? CustomerFallbackImage : ExistingPicUrl.Value;
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

                // Grid order: Select | CustId | Name | Address | Phone | Email | Password | (Photo column if present)
                NameTb.Value = row.Cells[2].Text;
                AddTb.Value = row.Cells[3].Text;
                PhoneTb.Value = row.Cells[4].Text;
                EmailTb.Value = row.Cells[5].Text;
                PasswordTb.Value = row.Cells[6].Text;

                // Load picture URL from DB
                var pic = GetPictureUrl(Convert.ToInt32(CustIdHidden.Value));
                ExistingPicUrl.Value = pic ?? "";
                CustImgPreview.ImageUrl = string.IsNullOrEmpty(ExistingPicUrl.Value) ? CustomerFallbackImage : ExistingPicUrl.Value;
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
                string Email = EmailTb.Value.Trim();
                string Password = PasswordTb.Value.Trim();

                // If a new image uploaded, use it; else keep existing
                string newPic = SaveUploadedCustomerImage();
                string picUrl = !string.IsNullOrEmpty(newPic) ? newPic : (ExistingPicUrl.Value ?? "");

                string Query = "UPDATE CustomerTbl SET " +
                               "CustName='{0}', CustAdd='{1}', CustPhone='{2}', CustEmail='{3}', CustPassword='{4}', PictureUrl='{5}' " +
                               "WHERE CustId={6}";
                Query = string.Format(Query, Name, Address, Phone, Email, Password, picUrl, CustIdHidden.Value);

                Conn.SetData(Query);
                ErrorMsg.Text = "✏️ Customer Updated Successfully!";
                ShowCustomers();

                ExistingPicUrl.Value = picUrl;
                CustImgPreview.ImageUrl = string.IsNullOrEmpty(picUrl) ? CustomerFallbackImage : picUrl;
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

                CustImgPreview.ImageUrl = CustomerFallbackImage;
                ExistingPicUrl.Value = "";
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // ===== Helpers =====
        private string SaveUploadedCustomerImage()
        {
            try
            {
                if (CustomerImageUpload != null && CustomerImageUpload.HasFile && CustomerImageUpload.PostedFile.ContentLength > 0)
                {
                    string ext = Path.GetExtension(CustomerImageUpload.FileName)?.ToLowerInvariant();
                    if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".webp")
                    {
                        ErrorMsg.Text = "⚠ Only JPG, PNG or WebP allowed.";
                        return null;
                    }

                    string folderVirtual = "~/Assets/CustomerImages";
                    string folderPhysical = Server.MapPath(folderVirtual);
                    if (!Directory.Exists(folderPhysical))
                        Directory.CreateDirectory(folderPhysical);

                    // Use name + time for uniqueness
                    string baseName = (NameTb.Value ?? "customer").Trim().Replace(" ", "_");
                    string fileName = $"{baseName}_{DateTime.Now:yyyyMMddHHmmssfff}{ext}";
                    string physicalPath = Path.Combine(folderPhysical, fileName);

                    CustomerImageUpload.SaveAs(physicalPath);

                    // return app-absolute path for <img src>
                    return VirtualPathUtility.ToAbsolute($"{folderVirtual}/{fileName}");
                }
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "⚠ Image upload failed: " + ex.Message;
            }
            return null;
        }

        private string GetPictureUrl(int custId)
        {
            try
            {
                string q = $"SELECT PictureUrl FROM CustomerTbl WHERE CustId={custId}";
                DataTable dt = Conn.GetData(q);
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0]["PictureUrl"]?.ToString();
                }
            }
            catch { /* ignore */ }
            return null;
        }
    }
}
