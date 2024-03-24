using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class nhacc : System.Web.UI.Page
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
            GridView1.DataSource = kn.laydulieu("select * from nhacungcap");
            GridView1.DataBind();
            kn.close();
            
        }
        protected void btnthem_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO nhacungcap VALUES(N'" + txttenncc.Text + "',N'" + txtdiachi.Text + "','" + txtsdt.Text + "')");
            kn.close();
            load();
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update nhacungcap set tenncc=N'" + txttenncc.Text + "', diachi=N'" + txtdiachi.Text + "', sdt='" + txtsdt.Text + "' where mancc='" + txtmancc.Text + "'");
            kn.close();
            load();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from nhacungcap where mancc = '" + txtmancc.Text + "'");
            kn.close();
            load();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmancc.Text = GridView1.Rows[t].Cells[0].Text;
            txttenncc.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtdiachi.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtsdt.Text = GridView1.Rows[t].Cells[3].Text;
           
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            txtmancc.Text = "";
            txttenncc.Text = "";
            txtdiachi.Text = "";
            txtsdt.Text = "";
            txtmancc.Focus();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
            GridView1.EditIndex = -1;
        }
    }
}