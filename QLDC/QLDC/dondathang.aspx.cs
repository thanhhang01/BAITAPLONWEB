using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class dondathang : System.Web.UI.Page
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
            GridView1.DataSource = kn.laydulieu("select * from dondathang");
            GridView1.DataBind();
            kn.close();
            DropDownList1.DataSource = kn.laydulieu("select * from khachhang");
            DropDownList1.DataMember = "makh";
            DropDownList1.DataValueField = "makh";
            DropDownList1.DataBind();
        }
        protected void btnthem_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO dondathang VALUES(N'" + txtngaydh.Text + "','" + txttrigia.Text + "',N'" + txtdagiao.Text + "','" + txtngaygiao.Text + "',N'" + txttennhan.Text + "',N'" + txtdcnhan.Text + "','" + txtsdtnhan.Text + "',N'" + txthtthanhtoan.Text + "',N'" + txthtgiaohang.Text + "','"+ DropDownList1.Text + "')");
            kn.close();
            load();
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update dondathang set ngaydh=N'" + txtngaydh.Text + "', trigia='" + txttrigia.Text + "', dagiao=N'" + txtdagiao.Text + "', ngaygiao='" + txtngaygiao.Text + "', tennguoinhan=N'" + txttennhan.Text + "', dcnhan=N'" + txtdcnhan.Text + "',sdtnhan='" + txtsdtnhan.Text + "',htthanhtoan=N'" + txthtthanhtoan.Text + "',htgiaohang=N'" + txthtgiaohang.Text + "',makh='" + DropDownList1.Text +"' where sohd='" + txtshd.Text + "'");
            kn.close();
            load();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from dondathang where sohd = '" + txtshd.Text + "'");
            kn.close();
            load();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtshd.Text = GridView1.Rows[t].Cells[0].Text;
            txtngaydh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txttrigia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtdagiao.Text = GridView1.Rows[t].Cells[3].Text;
            txttennhan.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[4].Text.ToString()));
            txtdcnhan.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[5].Text.ToString()));
            txtsdtnhan.Text = GridView1.Rows[t].Cells[6].Text;
            txthtthanhtoan.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[7].Text.ToString()));
            txthtgiaohang.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[8].Text.ToString()));

        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            txtshd.Text = "";
            txtngaydh.Text = "";
            txttrigia.Text = "";
            txtdagiao.Text = "";
            txttennhan.Text = "";
            txtdcnhan.Text = "";
            txtsdtnhan.Text = "";
            txthtthanhtoan.Text = "";
            txthtgiaohang.Text = "";
            txtshd.Focus();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
            GridView1.EditIndex = -1;
        }
    }
}