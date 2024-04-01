using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class dangnhap : System.Web.UI.Page
    {

        SqlConnection conn = null;
        SqlCommand cmd = null;
        string ckn = @"Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Khởi tạo mã captcha và lưu vào Session
                string captchaCode = GenerateRandomCode();
                Session["CaptchaCode"] = captchaCode;

                // Cập nhật lại hình ảnh captcha
                UpdateCaptchaImage();
            }
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
{
    // Kiểm tra mã captcha
    if (txtsecuritycode.Value == Session["CaptchaText"].ToString())
    {
        string sql = "SELECT * FROM dangnhap WHERE tendangnhap=@username AND matkhau=@password";
        using (SqlConnection conn = new SqlConnection(ckn))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@username", txttendangnhap.Text);
                cmd.Parameters.AddWithValue("@password", txtmatkhau.Text);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        string role = dr["role"].ToString();
                        dr.Close();

                        // Chuyển hướng người dùng dựa trên vai trò
                        if (role == "admin")
                        {
                            Response.Redirect("quantri.aspx");
                        }
                        else if (role == "user")
                        {
                            Response.Redirect("trangchu.aspx");
                        }
                        else
                        {
                            Response.Redirect("VaiTroKhongXacDinh.aspx");
                        }
                    }
                    else
                    {
                        // Đăng nhập không thành công
                        Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác.');</script>");
                    }
                }
            }
        }
    }
    else
    {
        // Mã captcha không hợp lệ, thông báo cho người dùng
        Response.Write("<script>alert('Mã captcha không chính xác. Vui lòng thử lại.');</script>");

        // Tạo lại mã captcha mới
        string captchaCode = GenerateRandomCode();
        Session["CaptchaCode"] = captchaCode;

        // Cập nhật lại hình ảnh captcha
        UpdateCaptchaImage();
    }
}


        // Hàm tạo mã captcha ngẫu nhiên
        private string GenerateRandomCode()
        {
            // Đây chỉ là một hàm đơn giản, bạn có thể thay đổi hoặc cải tiến nó để tạo ra mã captcha phức tạp hơn.
            Random random = new Random();
            return random.Next(1000, 9999).ToString();
        }

        // Hàm cập nhật lại hình ảnh captcha
        private void UpdateCaptchaImage()
        {
            // Tạo một biến kiểu HtmlImage để truy cập vào phần tử img với ID là "captchaImage"
            HtmlImage captchaImage = (HtmlImage)Page.FindControl("captchaImage");

            // Kiểm tra nếu phần tử tồn tại
            if (captchaImage != null)
            {
                // Cập nhật src của hình ảnh captcha để hiển thị lại hình mới
                captchaImage.Src = "generatecaptcha.aspx";
            }
        }

    }

    /*protected void btndangnhap_Click(object sender, EventArgs e)
    {

        /*string sql = "select * from dangnhap where tendangnhap='" + txttendangnhap.Text + "'and matkhau='" + txtmatkhau.Text + "'";
        conn = new SqlConnection(ckn);
        conn.Open();
        cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            Response.Redirect("quantri.aspx");
        }
        else
        {
            Response.Redirect("Đăng nhập không thành công");
        }*/
    /* string sql = "select * from dangnhap where tendangnhap='" + txttendangnhap.Text + "'and matkhau='" + txtmatkhau.Text + "'";
     conn = new SqlConnection(ckn);

     conn.Open();
     cmd = new SqlCommand(sql, conn);
     SqlDataReader dr = cmd.ExecuteReader();

     if (dr.Read())
     {
         string role = dr["role"].ToString();
         dr.Close();
         conn.Close();

         if (role == "admin")
         {
             // Chuyển hướng đến trang quản trị
             Response.Redirect("quantri.aspx");
         }
         else if (role == "user")
         {
             // Chuyển hướng đến trang người dùng
             Response.Redirect("trangchu.aspx");
         }
         else
         {
             // Xử lý vai trò không xác định
             Response.Redirect("VaiTroKhongXacDinh.aspx");
         }
     }
     else
     {
         Response.Redirect("Dang nhap khong thanh cong");
     }
 }*/
}
