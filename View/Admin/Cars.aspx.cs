using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinecarrental.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        Models.Functions Conn;
        string key = "";
        private const string FallbackImage = "/Assets/Img/Car-PNG-Clipart.png";

        protected void Page_Load(object sender, EventArgs e)
        {
            Conn = new Models.Functions();

            if (!IsPostBack)
            {
                ShowCars();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            base.VerifyRenderingInServerForm(control);
        }

        // Show Cars
        private void ShowCars()
        {
            string Query = "SELECT * FROM CarTbl";
            CarList.DataSource = Conn.GetData(Query);
            CarList.DataBind();
        }

        // Save
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
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

                // Save image if provided
                string picUrl = SaveUploadedCarImage(PlateNum);
                if (string.IsNullOrEmpty(picUrl)) picUrl = ""; // allow empty if not uploaded

                string Query = "INSERT INTO CarTbl (CPlateNum, Brand, Model, Price, Color, Status, PictureUrl) " +
                               "VALUES ('{0}', '{1}', '{2}', {3}, '{4}', '{5}', '{6}')";
                Query = string.Format(Query, PlateNum.Replace("'", "''"), Brand.Replace("'", "''"),
                                      Model.Replace("'", "''"), Price, Color.Replace("'", "''"),
                                      Status.Replace("'", "''"), picUrl.Replace("'", "''"));

                Conn.SetData(Query);
                ErrorMsg.Text = "✅ Car Added Successfully!";
                ShowCars();
                ExistingPicUrl.Value = picUrl;
                CarImgPreview.ImageUrl = string.IsNullOrEmpty(picUrl) ? FallbackImage : picUrl;
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // Select Row (robust: fetch row from DB by key)
        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (CarList.SelectedIndex < 0)
                {
                    ErrorMsg.Text = "⚠ Select a car to edit";
                    return;
                }

                string plate = CarList.DataKeys[CarList.SelectedIndex].Value.ToString();
                string safePlate = plate.Replace("'", "''");
                string q = $"SELECT CPlateNum, Brand, Model, Price, Color, Status, PictureUrl FROM CarTbl WHERE CPlateNum='{safePlate}'";

                DataTable dt = Conn.GetData(q);
                if (dt.Rows.Count == 0)
                {
                    ErrorMsg.Text = "⚠ Car not found.";
                    return;
                }

                var r = dt.Rows[0];
                LNumberTb.Value = r["CPlateNum"].ToString();
                BrandTb.Value = r["Brand"].ToString();
                ModelTb.Value = r["Model"].ToString();
                PriceTb.Value = r["Price"].ToString();
                ColorTb.Value = r["Color"].ToString();
                AvailableCb.SelectedValue = r["Status"].ToString();

                ExistingPicUrl.Value = r["PictureUrl"]?.ToString() ?? "";
                CarImgPreview.ImageUrl = string.IsNullOrEmpty(ExistingPicUrl.Value) ? FallbackImage : ExistingPicUrl.Value;
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // Delete
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CarList.SelectedIndex < 0)
                {
                    ErrorMsg.Text = "⚠ Select a car to delete";
                    return;
                }

                string PlateNum = CarList.DataKeys[CarList.SelectedIndex].Value.ToString();
                string Query = $"DELETE FROM CarTbl WHERE CPlateNum = '{PlateNum.Replace("'", "''")}'";

                Conn.SetData(Query);
                ErrorMsg.Text = "🗑 Car Deleted Successfully!";
                ShowCars();
                // Optional: clear preview or keep as-is
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // Edit
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CarList.SelectedIndex < 0)
                {
                    ErrorMsg.Text = "⚠ Select a car to edit";
                    return;
                }

                string PlateNum = CarList.DataKeys[CarList.SelectedIndex].Value.ToString();

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

                // If a new image is uploaded, save and update; otherwise keep existing
                string newPic = SaveUploadedCarImage(PlateNum);
                string picUrl = !string.IsNullOrEmpty(newPic) ? newPic : (ExistingPicUrl.Value ?? "");

                string Query = "UPDATE CarTbl SET " +
                               $"Brand='{Brand.Replace("'", "''")}', " +
                               $"Model='{Model.Replace("'", "''")}', " +
                               $"Price={Price}, " +
                               $"Color='{Color.Replace("'", "''")}', " +
                               $"Status='{Status.Replace("'", "''")}', " +
                               $"PictureUrl='{picUrl.Replace("'", "''")}' " +
                               $"WHERE CPlateNum='{PlateNum.Replace("'", "''")}'";

                Conn.SetData(Query);
                ErrorMsg.Text = "✏️ Car Updated Successfully!";
                ShowCars();
                ExistingPicUrl.Value = picUrl;
                CarImgPreview.ImageUrl = string.IsNullOrEmpty(picUrl) ? FallbackImage : picUrl;
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        // ONE merged RowCreated handler (no duplicates!)
        protected void CarList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Hide auto "PictureUrl" header if it exists and remember its index
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (string.Equals(e.Row.Cells[i].Text, "PictureUrl", StringComparison.OrdinalIgnoreCase))
                    {
                        e.Row.Cells[i].Visible = false;
                        ViewState["PicColIndex"] = i;
                        break;
                    }
                }

                // Move the "Photo" header cell to the end (our ImageField header)
                int photoHeaderIdx = -1;
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (e.Row.Cells[i].Text.Equals("Photo", StringComparison.OrdinalIgnoreCase))
                    {
                        photoHeaderIdx = i; break;
                    }
                }
                if (photoHeaderIdx >= 0 && photoHeaderIdx < e.Row.Cells.Count - 1)
                {
                    TableCell photoHeaderCell = e.Row.Cells[photoHeaderIdx];
                    e.Row.Cells.RemoveAt(photoHeaderIdx);
                    e.Row.Cells.Add(photoHeaderCell);
                }
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Hide auto-generated raw PictureUrl data cell
                if (ViewState["PicColIndex"] is int picIdx &&
                    picIdx >= 0 && picIdx < e.Row.Cells.Count)
                {
                    e.Row.Cells[picIdx].Visible = false;
                }

                // Move the ImageField cell (Photo) to the end by finding the Image control
                int imgIdx = -1;
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (e.Row.Cells[i].Controls.Count > 0 &&
                        e.Row.Cells[i].Controls[0] is System.Web.UI.WebControls.Image)
                    {
                        imgIdx = i; break;
                    }
                }
                if (imgIdx >= 0 && imgIdx < e.Row.Cells.Count - 1)
                {
                    TableCell imgCell = e.Row.Cells[imgIdx];
                    e.Row.Cells.RemoveAt(imgIdx);
                    e.Row.Cells.Add(imgCell);
                }
            }
        }

        // Helpers
        private string SaveUploadedCarImage(string plate)
        {
            try
            {
                if (CarImageUpload != null && CarImageUpload.HasFile && CarImageUpload.PostedFile.ContentLength > 0)
                {
                    string ext = Path.GetExtension(CarImageUpload.FileName)?.ToLowerInvariant();
                    if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".webp")
                    {
                        ErrorMsg.Text = "⚠ Only JPG, PNG or WebP allowed.";
                        return null;
                    }

                    string folderVirtual = "~/Assets/CarImages";
                    string folderPhysical = Server.MapPath(folderVirtual);
                    if (!Directory.Exists(folderPhysical))
                        Directory.CreateDirectory(folderPhysical);

                    string safePlate = string.IsNullOrWhiteSpace(plate) ? "car" : plate.Replace(" ", "_");
                    string fileName = $"{safePlate}_{DateTime.Now:yyyyMMddHHmmssfff}{ext}";
                    string physicalPath = Path.Combine(folderPhysical, fileName);
                    CarImageUpload.SaveAs(physicalPath);

                    // Store as app-absolute url (starts with /)
                    string appAbsolute = VirtualPathUtility.ToAbsolute($"{folderVirtual}/{fileName}");
                    return appAbsolute;
                }
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = "⚠ Image upload failed: " + ex.Message;
            }
            return null;
        }

        private string GetPictureUrl(string plate)
        {
            try
            {
                string safe = (plate ?? "").Replace("'", "''");
                string q = $"SELECT PictureUrl FROM CarTbl WHERE CPlateNum='{safe}'";
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
