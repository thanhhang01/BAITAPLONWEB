using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class giohang1 : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    load();
        //}
        /*public void load()
        {
            kn.Open();

            DataList1.DataSource = kn.laydulieu("select * from sanpham");
            DataList1.DataBind();
            kn.close();
        }*/
        private string GetImagePathFromDatabase(string masp)
        {
            string connectionString = "Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True"; // Thay YOUR_CONNECTION_STRING bằng chuỗi kết nối đến cơ sở dữ liệu của bạn

            string imagePath = ""; // Biến để lưu đường dẫn tới hình ảnh

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT hinh FROM sanpham WHERE masp = @masp";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@masp", masp);

                try
                {
                    connection.Open();
                    imagePath = (string)command.ExecuteScalar(); // Giả sử cột hinh trong cơ sở dữ liệu là kiểu string chứa đường dẫn tới hình ảnh
                }
                catch (Exception ex)
                {
                    // Xử lý exception (nếu có)
                    Console.WriteLine(ex.Message);
                }
            }

            return imagePath;
        }
    }
}