using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class loaisanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
        }
        Ketnoi kn = new Ketnoi();
        public void load()
        {
            kn.Open();
            GridView1.DataSource = kn.laydulieu("select * from loaisp");
            GridView1.DataBind();
            kn.close();
            //DropDownList1.DataSource = kn.laydulieu("select * from theloai");
            //DropDownList1.DataMember = "maloai";
            //DropDownList1.DataValueField = "maloai";
            //DropDownList1.DataBind();
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO loaisp VALUES(N'" + txttenloai.Text + "')");
            kn.close();
            load();
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update loaisp set tenloai=N'" + txttenloai.Text + "' where maloai='" + txtmaloai.Text + "'");
            kn.close();
            load();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            try
            {
                kn.Open();
                kn.xuly("delete from loaisp where maloai = '" + txtmaloai.Text + "'");
                kn.close();
                load();

                // Hiển thị thông báo JavaScript khi xóa thành công
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa thành công!');", true);
            }
            catch (Exception ex)
            {
                // Xử lý nếu có lỗi xóa
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Không thể xóa vì có lỗi xảy ra.');", true);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmaloai.Text = GridView1.Rows[t].Cells[0].Text;
            txttenloai.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
        }

        

        protected void btnhuy_Click2(object sender, EventArgs e)
        {
            txtmaloai.Text = "";
            txttenloai.Text = "";
            txtmaloai.Focus();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
            GridView1.EditIndex = -1;
        }
    }
}