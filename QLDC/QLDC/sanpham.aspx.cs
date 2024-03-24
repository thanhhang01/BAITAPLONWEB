using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class sanpham : System.Web.UI.Page
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
            GridView1.DataSource = kn.laydulieu("select * from sanpham");
            GridView1.DataBind();
            kn.close();
            DropDownList1.DataSource = kn.laydulieu("select * from loaisp");
            DropDownList1.DataMember = "maloai";
            DropDownList1.DataValueField = "maloai";
            DropDownList1.DataBind();
            DropDownList2.DataSource = kn.laydulieu("select * from nhacungcap");
            DropDownList2.DataMember = "mancc";
            DropDownList2.DataValueField = "mancc";
            DropDownList2.DataBind();
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            string tenanh;
            tenanh = FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath("~/image/") + tenanh);
            Image1.ImageUrl = "~/image/" + tenanh;
            txthinh.Text = "" + tenanh;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*int t = GridView1.SelectedIndex;
            txtmasp.Text = GridView1.Rows[t].Cells[0].Text;
            txttensp.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtdvtinh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtgia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[3].Text.ToString()));
            txtgiamgia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[4].Text.ToString()));
            txtmota.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[5].Text.ToString()));
            txthinh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[6].Text.ToString()));
            Image1.ImageUrl = "~/image/" + txthinh.Text;*/
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            try
            {
                kn.Open();
                kn.xuly("INSERT INTO sanpham VALUES(N'" + txttensp.Text + "','" + txtdvtinh.Text + "',N'" + txtgia.Text + "',N'" + txtmota.Text + "',N'" + txthinh.Text + "','" + DropDownList1.Text + "','" + DropDownList2.Text + "',N'" + txtgiamgia.Text + "')");
                kn.close();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "successMessage", "alert('Thêm sản phẩm thành công.');", true);


                load();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "alert('Đã xảy ra lỗi khi thêm sản phẩm. " + ex.Message + "');", true);
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmasp.Text = GridView1.Rows[t].Cells[0].Text;
            txttensp.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtdvtinh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtgia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[3].Text.ToString()));
            txtmota.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[4].Text.ToString()));
            txthinh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[5].Text.ToString()));
            txtgiamgia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[6].Text.ToString()));
            Image1.ImageUrl = "~/image/" + txthinh.Text;
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            try
            {
                kn.Open();
                kn.xuly("update sanpham set tensp=N'" + txttensp.Text + "', dvtinh='" + txtdvtinh.Text + "', gia=N'" + txtgia.Text + "', mota=N'" + txtmota.Text + "', hinh='" + txthinh.Text + "', maloai='" + DropDownList1.Text + "',mancc='" + DropDownList2.Text + "',giamgia=N'" + txtgiamgia.Text + "' where masp='" + txtmasp.Text + "'");
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
                kn.xuly("delete from sanpham where masp = '" + txtmasp.Text + "'");
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
            txtmasp.Text = "";
            txttensp.Text = "";
            txtdvtinh.Text = "";
            txtgia.Text = "";
            txtgiamgia.Text = "";
            txtmota.Text = "";
            txthinh.Text = "";
            txtmasp.Focus();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
            GridView1.EditIndex = -1;
        }
    }
}
    
