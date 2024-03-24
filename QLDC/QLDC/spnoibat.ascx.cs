using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class spnoibat : System.Web.UI.UserControl
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

            // Lấy 6 sản phẩm ngẫu nhiên từ CSDL
            DataTable dt = kn.laydulieu("SELECT TOP 6 * FROM sanpham ORDER BY NEWID()");

            // Gán dữ liệu vào DataList
            DataList1.DataSource = dt;
            DataList1.DataBind();

            kn.close();
        }
    }
}