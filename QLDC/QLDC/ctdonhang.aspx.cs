using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class ctdonhang : System.Web.UI.Page
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
            GridView1.DataSource = kn.laydulieu("select * from ctdathang");
            GridView1.DataBind();
            kn.close();
            DropDownList1.DataSource = kn.laydulieu("select * from sanpham");
            DropDownList1.DataMember = "masp";
            DropDownList1.DataValueField = "masp";
            DropDownList1.DataBind();
            DropDownList2.DataSource = kn.laydulieu("select * from dondathang");
            DropDownList2.DataMember = "sohd";
            DropDownList2.DataValueField = "sohd";
            DropDownList2.DataBind();
        }
        protected void btnthem_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO ctdathang VALUES(N'" + DropDownList2.Text + "','" + txtsl.Text + "','" + txtdg.Text + "','" + DropDownList1.Text + "')");
            kn.close();
            load();
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update ctdathang set sohd=N'" + DropDownList2.Text + "', soluong='" + txtsl.Text + "', dongia='" + txtdg.Text + "', masp='" + DropDownList1.Text + "' where sohd='" + DropDownList2.Text +"'");
            kn.close();
            load();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from ctdathang where sohd = '" + DropDownList2.Text + "'");
            kn.close();
            load();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            DropDownList2.Text = GridView1.Rows[t].Cells[0].Text;
            txtsl.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtdg.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            DropDownList1.Text = GridView1.Rows[t].Cells[3].Text;
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnhuy_Click1(object sender, EventArgs e)
        {
            txtsl.Text = "";
            txtdg.Text = "";
            txtsl.Focus();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
            GridView1.EditIndex = -1;
        }
    }
}