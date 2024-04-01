using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class giohang11 : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            string maspParam = Request.QueryString.Get("masp");
            if (!string.IsNullOrEmpty(maspParam))
            {
                int masp;
                if (int.TryParse(maspParam, out masp))
                {
                    ViewState["masplayduoc"] = masp;
                    load();
                }
                else
                {
                    // Xử lý trường hợp không thể chuyển đổi thành số nguyên
                }
            }
            else
            {
                // Xử lý trường hợp không có tham số "masp" trong URL
            }

        }
        public void load()
        {
            kn.Open();
            DataTable dt = new DataTable();
            dt = kn.laydulieu("select * from sanpham where masp =" + (int)ViewState["masplayduoc"]);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            kn.close();
        }
    }
}