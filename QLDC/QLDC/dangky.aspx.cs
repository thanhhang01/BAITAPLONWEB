using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Lấy dữ liệu từ các control trên form
            string tendangnhap = txtUsername.Text;
            string matkhau = txtPassword.Text;
            string confirmmatkhau = txtConfirmPassword.Text;
            string role = txtrole.Text;

            // Kiểm tra mật khẩu và xác nhận mật khẩu có khớp nhau không
            if (matkhau != confirmmatkhau)
            {
                // Hiển thị thông báo lỗi nếu mật khẩu không khớp
                ClientScript.RegisterStartupScript(GetType(), "Error", "alert('Mật khẩu và xác nhận mật khẩu không khớp.');", true);
                return;
            }

            // Thực hiện đăng ký trong cơ sở dữ liệu
            string connectionString = "Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True"; // Thay đổi chuỗi kết nối tới cơ sở dữ liệu của bạn
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO dangnhap (tendangnhap, matkhau, role) VALUES (@tendangnhap, @matkhau, @role)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@tendangnhap", tendangnhap);
                    command.Parameters.AddWithValue("@matkhau", matkhau);
                    command.Parameters.AddWithValue("@role", role);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Đăng ký thành công, có thể chuyển hướng người dùng đến trang khác
                            Response.Redirect("dangnhap.aspx");
                        }
                        else
                        {
                            // Hiển thị thông báo lỗi nếu không thể thêm người dùng mới vào cơ sở dữ liệu
                            ClientScript.RegisterStartupScript(GetType(), "Error", "alert('Đăng ký không thành công.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Xử lý ngoại lệ nếu có lỗi xảy ra khi thực hiện truy vấn
                        ClientScript.RegisterStartupScript(GetType(), "Error", $"alert('Đã xảy ra lỗi: {ex.Message}');", true);
                    }
                }
            }
        }
    }
}
