using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class User : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
        }
        public void load()
        {
            kn.Open();
            GridViewUsers.DataSource = kn.laydulieu("select * from dangnhap");
            GridViewUsers.DataBind();
            kn.close();
            
        }

  

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridViewUsers.SelectedIndex;
            txttdn.Text = GridViewUsers.Rows[t].Cells[0].Text;
            txtmk.Text = HttpUtility.HtmlDecode((string)(GridViewUsers.Rows[t].Cells[1].Text.ToString()));
            txtrole.Text = HttpUtility.HtmlDecode((string)(GridViewUsers.Rows[t].Cells[2].Text.ToString()));
        }

        protected void btnthemtk_Click(object sender, EventArgs e)
        {
            try
            {
                kn.Open();

                // Kiểm tra xem tên đăng nhập đã tồn tại trong cơ sở dữ liệu chưa
                bool exist = kn.kiemtra("SELECT COUNT(*) FROM dangnhap WHERE tendangnhap = '" + txttdn.Text + "'") > 0;

                if (exist)
                {
                    // Hiển thị thông báo nếu tên đăng nhập đã tồn tại
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "alert('Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.');", true);
                }
                else
                {
                    // Thêm mới tài khoản nếu tên đăng nhập không tồn tại
                    kn.xuly("INSERT INTO dangnhap VALUES(N'" + txttdn.Text + "','" + txtmk.Text + "',N'" + txtrole.Text + "')");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successMessage", "alert('Thêm tài khoản thành công.');", true);
                }

                kn.close();
                load();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "alert('Đã xảy ra lỗi khi thêm tài khoản. " + ex.Message + "');", true);
            }
        }


        protected void btnsua_Click(object sender, EventArgs e)
        {
            try
            {
                kn.Open();
                kn.xuly("update dangnhap set tendangnhap=N'" + txttdn.Text + "', matkhau='" + txtmk.Text + "',role='"+ txtrole.Text +"' where tendangnhap='" + txttdn.Text + "'");
                kn.close();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "successMessage", "alert('Sửa sản phẩm thành công.');", true);


                load();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "alert('Đã xảy ra lỗi khi sửa sản phẩm. " + ex.Message + "');", true);
            }
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            try
            {
                kn.Open();
                kn.xuly("delete from dangnhap where tendangnhap = '" + txttdn.Text + "'");
                kn.close();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "successMessage", "alert('Xoa sản phẩm thành công.');", true);


                load();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "alert('Đã xảy ra lỗi khi xóa sản phẩm. " + ex.Message + "');", true);
            }
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            txttdn.Text = "";
            txtmk.Text = "";
            txtrole.Text = "";
            txttdn.Focus();
        }
    }
    }

