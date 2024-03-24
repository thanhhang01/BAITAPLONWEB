using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class sptheoloai : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["maloailayduoc"] = int.Parse(Request.QueryString.Get("maloai"));
            load();
        }
        public void load()
        {
            kn.Open();
            DataTable dt=new DataTable();
            dt = kn.laydulieu("select * from sanpham where maloai =" + (int)ViewState["maloailayduoc"]);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            kn.close();
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            // Xử lý thêm sản phẩm vào giỏ hàng ở đây
            LinkButton btn = (LinkButton)sender;
            string productId = btn.CommandArgument;

            // Thực hiện các bước cần thiết để thêm sản phẩm vào giỏ hàng
            // Ví dụ: Lưu thông tin sản phẩm vào Session hoặc Database

            // Redirect đến trang giỏ hàng
            Response.Redirect("giohang.aspx");
        }
    }
}