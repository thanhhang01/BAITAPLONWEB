using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class khachhang : System.Web.UI.Page
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
            GridView1.DataSource = kn.laydulieu("select * from khachhang");
            GridView1.DataBind();
            kn.close();
            
        }
        protected void btnthem_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO khachhang VALUES(N'" + txttenkh.Text + "',N'" + txtdiachi.Text + "','" + txtsdt.Text + "',N'" + txttendn.Text + "','" + txtmk.Text + "','" + txtngaysinh.Text + "',N'" + txtgioitinh.Text + "',N'" + txtemail.Text + "')");
            kn.close();
            load();
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update khachhang set tenkh=N'" + txttenkh.Text + "', diachi=N'" + txtdiachi.Text + "', sdt='" + txtsdt.Text + "', tendangnhap=N'" + txttendn.Text + "', matkhau='" + txtmk.Text + "', ngaysinh='" + txtngaysinh.Text + "',gioitinh=N'" + txtgioitinh.Text + "',email=N'"+ txtemail.Text+"' where makh='" + txtmakh.Text + "'");
            kn.close();
            load();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from khachhang where makh = '" + txtmakh.Text + "'");
            kn.close();
            load();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmakh.Text = GridView1.Rows[t].Cells[0].Text;
            txttenkh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtdiachi.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtsdt.Text = GridView1.Rows[t].Cells[3].Text;
            txttendn.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[4].Text.ToString()));
            txtmk.Text = GridView1.Rows[t].Cells[5].Text;
            txtngaysinh.Text = GridView1.Rows[t].Cells[6].Text;
            txtgioitinh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[7].Text.ToString()));
            txtemail.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[8].Text.ToString()));
        }

       

        protected void btnhuy_Click1(object sender, EventArgs e)
        {
            txtmakh.Text = "";
            txttenkh.Text = "";
            txtdiachi.Text = "";
            txtsdt.Text = "";
            txttendn.Text = "";
            txtmk.Text = "";
            txtngaysinh.Text = "";
            txtgioitinh.Text = "";
            txtemail.Text = "";
            txtmakh.Focus();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
            GridView1.EditIndex = -1;
        }
    }
}