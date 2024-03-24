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
    public partial class trangchu : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                load();
        }
        }
        public void load()
        {
            kn.Open();
            DataList1.DataSource = kn.laydulieu("SELECT TOP 16 * FROM sanpham ORDER BY NEWID()");
            DataList1.DataBind();
            kn.close();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public static string AddToCart(string productName, string productPrice)
        {
            // Xử lý thêm sản phẩm vào giỏ hàng ở đây
            // (Thay thế đoạn mã này với logic thực tế)

            // Ví dụ: Lưu thông tin sản phẩm vào Session
            List<string> cartItems = (List<string>)HttpContext.Current.Session["GioHang"];
            string cartItem = $"{productName} - {productPrice} đ";
            cartItems.Add(cartItem);
            HttpContext.Current.Session["GioHang"] = cartItems;

            return "Sản phẩm đã được thêm vào giỏ hàng.";
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // Lấy mã sản phẩm từ CommandArgument
            string maSanPham = (sender as LinkButton).CommandArgument;
            string tensp = (sender as LinkButton).CommandArgument;

            // Gọi hàm thêm sản phẩm vào giỏ hàng
            ThemSanPhamVaoGioHang(maSanPham, tensp);
        }
        private void ThemSanPhamVaoGioHang(string maSanPham, string tensp)
        {
            // Kiểm tra xem Session "GioHang" có tồn tại chưa
            if (Session["GioHang"] == null)
            {
                // Nếu chưa tồn tại, tạo mới một danh sách để lưu giỏ hàng
                List<string> gioHang = new List<string>();
                gioHang.Add(maSanPham);
                Session["GioHang"] = gioHang;
            }
            else
            {
                // Nếu đã tồn tại, lấy danh sách giỏ hàng từ Session và thêm sản phẩm vào đó
                List<string> gioHang = (List<string>)Session["GioHang"];
                gioHang.Add(maSanPham);
                gioHang.Add(tensp);
                Session["GioHang"] = gioHang;
            }

            // Lấy thông tin sản phẩm từ cơ sở dữ liệu (thay vào đoạn mã này với truy vấn thực tế)
            string tenSanPham = GetTenSanPhamFromDatabase(maSanPham);
            decimal giaSanPham = GetGiaSanPhamFromDatabase(maSanPham);

            // Tạo thông tin sản phẩm đã thêm vào giỏ hàng
            string thongTinSanPham = $"{tenSanPham} - {giaSanPham.ToString("N0")} đ";

            // Hiển thị thông báo thành công hoặc chuyển đến trang giỏ hàng với thông tin sản phẩm
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartSuccess", $"alert('Đã thêm sản phẩm vào giỏ hàng: {thongTinSanPham}');", true);
        }

        // Hàm truy vấn cơ sở dữ liệu để lấy tên sản phẩm
        private string GetTenSanPhamFromDatabase(string maSanPham)
        {
            string tenSanPham = ""; // Biến để lưu tên sản phẩm

            // Thực hiện truy vấn cơ sở dữ liệu để lấy tên sản phẩm từ mã sản phẩm
            // (Thay thế đoạn mã này với truy vấn thực tế)
            // Ví dụ:
            string connectionString = "Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True"; // Thay YOUR_CONNECTION_STRING bằng chuỗi kết nối đến cơ sở dữ liệu của bạn

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT tensp FROM sanpham WHERE masp = @masp";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@masp", maSanPham);

                try
                {
                    connection.Open();
                    tenSanPham = (string)command.ExecuteScalar(); // Giả sử cột tensp trong cơ sở dữ liệu là kiểu string chứa tên sản phẩm
                }
                catch (Exception ex)
                {
                    // Xử lý exception (nếu có)
                    Console.WriteLine(ex.Message);
                }
            }

            return tenSanPham;
        }


        // Hàm truy vấn cơ sở dữ liệu để lấy giá sản phẩm
        private decimal GetGiaSanPhamFromDatabase(string maSanPham)
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy giá sản phẩm từ mã sản phẩm
            // (Thay thế đoạn mã này với truy vấn thực tế)
            // Ví dụ:
            // SELECT giaSanPham FROM SanPham WHERE maSanPham = 'maSanPham';
            return 1000000; // Thay đổi thành kết quả thực tế từ cơ sở dữ liệu
        }

        private string GetImagePathFromDatabase(string masp)
        {
            string connectionString = "Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True"; // Thay YOUR_CONNECTION_STRING bằng chuỗi kết nối đến cơ sở dữ liệu của bạn

            string imagePath = "~/image"; // Biến để lưu đường dẫn tới hình ảnh

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

        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            load();
        }
    }
}