using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace QLDC
{
    public partial class generatecaptcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Tạo một chuỗi ngẫu nhiên cho Captcha
            string captchaText = GenerateRandomText();

            // Lưu chuỗi Captcha vào Session để kiểm tra sau này
            Session["CaptchaText"] = captchaText;

            // Tạo hình ảnh Captcha và gán vào ImageUrl của control Image
            GenerateCaptchaImage(captchaText);
        }


        private string GenerateRandomText()
        {
            // Chuỗi ký tự mà bạn muốn sử dụng cho Captcha
            string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            // Độ dài của chuỗi Captcha
            int length = 6;

            // Tạo một chuỗi ngẫu nhiên từ các ký tự đã cho
            Random random = new Random();
            return new string(System.Linq.Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private void GenerateCaptchaImage(string captchaText)
        {
            // Tạo một hình ảnh trống
            Bitmap bitmap = new Bitmap(200, 50);
            Graphics graphics = Graphics.FromImage(bitmap);
            graphics.Clear(Color.White);

            // Vẽ chuỗi Captcha lên hình ảnh
            graphics.DrawString(captchaText, new Font("Arial", 20), Brushes.Black, new PointF(10, 10));

            // Vẽ nhiễu lên hình ảnh
            DrawNoise(graphics, bitmap.Width, bitmap.Height);

            // Lưu hình ảnh vào Response để hiển thị trên trình duyệt
            Response.ContentType = "image/jpeg";
            bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);

            // Giải phóng tài nguyên
            graphics.Dispose();
            bitmap.Dispose();
        }

        private void DrawNoise(Graphics graphics, int width, int height)
        {
            Random random = new Random();
            Pen pen = new Pen(Color.Gray, 1);
            for (int i = 0; i < 10; i++)
            {
                graphics.DrawLine(pen, new Point(random.Next(width), random.Next(height)), new Point(random.Next(width), random.Next(height)));
            }
        }
    }
}
