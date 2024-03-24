using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
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

        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {

            string sql = "select * from dangnhap where tendangnhap='" + txttendangnhap.Text + "'and matkhau='" + txtmatkhau.Text + "'";
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
            }
            /*string sql = "select * from dangnhap where tendangnhap='" + txttendangnhap.Text + "'and matkhau='" + txtmatkhau.Text + "'";
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
            }*/
        }
    }
}