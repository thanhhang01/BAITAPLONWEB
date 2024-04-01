using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class giohang1 : System.Web.UI.Page
    {
        protected TextBox txtQuantity;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            List<string> cart = Session["Cart"] as List<string>;
            if (cart != null)
            {
                List<Product> productsInCart = GetProductsInCart(cart);
                rptProductsInCart.DataSource = productsInCart;
                rptProductsInCart.DataBind();
            }
        }

        private List<Product> GetProductsInCart(List<string> productIds)
        {
            List<Product> products = new List<Product>();
            string connectionString = "Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                foreach (string productId in productIds)
                {
                    string query = "SELECT hinh,masp, tensp, gia,soluong FROM sanpham WHERE masp = @ProductId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ProductId", productId);

                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        Product product = new Product();
                        product.hinh = reader["hinh"].ToString();
                        product.masp = reader["masp"].ToString();
                        product.tensp = reader["tensp"].ToString();
                        product.gia = Convert.ToDecimal(reader["gia"]);
                        product.soluong = 1; // Bạn có thể cập nhật số lượng từ giỏ hàng thực tế
                        products.Add(product);
                    }
                    reader.Close();
                }
            }
            return products;
        }
        protected void btnXoa_Click1(object sender, EventArgs e)
        {
            Button btnXoa = (Button)sender;
            string productId = btnXoa.CommandArgument;

            List<string> cart;
            if (Session["Cart"] == null)
            {
                cart = new List<string>();
            }
            else
            {
                cart = (List<string>)Session["Cart"];
            }

            // Loại bỏ sản phẩm khỏi danh sách giỏ hàng
            cart.Remove(productId);

            // Cập nhật Session với danh sách giỏ hàng đã được cập nhật
            Session["Cart"] = cart;

            // Chuyển hướng trang để tải lại
            Response.Redirect(Request.RawUrl);
        }


        protected void btnDecrease_Click(object sender, EventArgs e)
        {
            Button btnDecrease = (Button)sender;
            RepeaterItem item = (RepeaterItem)btnDecrease.NamingContainer;
            TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
            Label lblTotalPrice = (Label)item.FindControl("lblTotalPrice"); // Thêm một nhãn để hiển thị tổng tiền

            int currentQuantity = int.Parse(txtQuantity.Text);
            if (currentQuantity > 1)
            {
                // Cập nhật số lượng mới vào biến session hoặc cơ sở dữ liệu
                // Sau đó tải lại dữ liệu để cập nhật giao diện
                // Đồng thời tính toán lại tổng tiền dựa trên giá và số lượng mới
                txtQuantity.Text = (currentQuantity - 1).ToString();
                UpdateTotalPrice(lblTotalPrice, currentQuantity - 1);
            }
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            Button btnIncrease = (Button)sender;
            RepeaterItem item = (RepeaterItem)btnIncrease.NamingContainer;
            TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
            Label lblTotalPrice = (Label)item.FindControl("lblTotalPrice"); // Thêm một nhãn để hiển thị tổng tiền

            int currentQuantity = int.Parse(txtQuantity.Text);
            // Cập nhật số lượng mới vào biến session hoặc cơ sở dữ liệu
            // Sau đó tải lại dữ liệu để cập nhật giao diện
            // Đồng thời tính toán lại tổng tiền dựa trên giá và số lượng mới
            txtQuantity.Text = (currentQuantity + 1).ToString();
            UpdateTotalPrice(lblTotalPrice, currentQuantity + 1);
        }

        private void UpdateTotalPrice(Label lblTotalPrice, int quantity)
        {
            // Lấy giá từ dữ liệu RepeaterItem
            decimal price = decimal.Parse(lblTotalPrice.Attributes["data-price"]);
            // Tính toán tổng tiền mới
            decimal totalPrice = price * quantity;
            // Cập nhật tổng tiền mới vào nhãn
            lblTotalPrice.Text = totalPrice.ToString("N2");
        }



        protected void rptProductsInCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Xử lý sự kiện ItemCommand ở đây
        }

        public class Product
        {
            public string hinh { get; set; }
            public string masp { get; set; }
            public string tensp { get; set; }
            public decimal gia { get; set; }
            public int soluong { get; set; }
        }

       
    }

    }




