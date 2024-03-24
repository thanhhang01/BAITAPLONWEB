using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace QLDC
{
    public partial class giohang : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra xem có tham số tìm kiếm được truyền từ trang con không
                if (Request.QueryString["search"] != null)
                {
                    // Lấy giá trị từ tham số tìm kiếm
                    string searchKeyword = Server.UrlDecode(Request.QueryString["search"]);
                    int minPrice = 2;
                    int maxPrice = 600000; 

                    // Gọi hàm tìm kiếm và hiển thị kết quả
                    BindSearchResults(searchKeyword, minPrice, maxPrice);
                }
            }
        }

        private void BindSearchResults(string searchKeyword, int minPrice, int maxPrice)
        {
            // Kết nối với cơ sở dữ liệu và truy vấn dữ liệu tìm kiếm
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True"))
            {
                connection.Open();

                // Sử dụng tham số để tránh tình trạng SQL injection
                string query = "SELECT masp, tensp, gia, hinh FROM sanpham WHERE tensp LIKE '%' + @searchKeyword + '%' AND gia BETWEEN @minPrice AND @maxPrice";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@searchKeyword", searchKeyword);
                    command.Parameters.AddWithValue("@minPrice", minPrice);
                    command.Parameters.AddWithValue("@maxPrice", maxPrice);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataList1.DataSource = reader;
                        DataList1.DataBind();
                    }
                }
            }
        }


        protected void AddToCart_Click(object sender, EventArgs e)
        {
        }
    }
}