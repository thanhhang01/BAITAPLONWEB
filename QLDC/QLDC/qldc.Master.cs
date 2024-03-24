using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class qldc : System.Web.UI.MasterPage
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                load();
            }
        }
        public void load()
        {
            kn.Open();
            //DataTable dt = new DataTable();
           ///dt = kn.laydulieu("select * from sanpham where tensp like 'T%'");
            //DataList1.DataSource = dt;
            //DataList1.DataBind();
            kn.close();
        }


        protected void btntimkiem_Click(object sender, EventArgs e)
        {
            // Lấy giá trị từ TextBox
            /*string giaTimKiem = txttimkiem.Text;

            // Thực hiện kết nối đến CSDL
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Tạo câu truy vấn SQL - giả sử cột lưu giá là 'Gia' và 'SanPham' là tên bảng
                string sqlQuery = "SELECT * FROM sanpham WHERE gia <= @GiaTimKiem";

                // Tạo đối tượng SqlCommand
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    // Thêm tham số cho truy vấn
                    command.Parameters.AddWithValue("@GiaTimKiem", giaTimKiem);

                    // Thực hiện truy vấn
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Kiểm tra xem có dữ liệu trả về không
                        if (reader.HasRows)
                        {
                            // Gán dữ liệu cho DataList
                            DataList1.DataSource = reader;
                            DataList1.DataBind();
                        }
                        else
                        {
                            // Nếu không có dữ liệu, có thể hiển thị thông báo hoặc thực hiện hành động khác
                            // Ví dụ: lblMessage.Text = "Không có sản phẩm nào thỏa mãn điều kiện tìm kiếm.";
                        }
                    }
                }
            }*/
        }


        protected void btntimkiem_Click1(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_PreRender(object sender, EventArgs e)
        {
            //ViewState["CurrentPage"] = DataPager1.StartRowIndex / DataPager1.PageSize;
        }

        protected void btntimkiem_Click2(object sender, EventArgs e)
        {
            string searchKeyword = txttimkiem.Text.Trim();

            Response.Redirect("~/timkiem.aspx?search=" + Server.UrlEncode(searchKeyword));
        }
    }
    }