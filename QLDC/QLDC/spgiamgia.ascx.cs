using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class spgiamgia : System.Web.UI.UserControl
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

            // Lấy 5 sản phẩm ngẫu nhiên có giảm giá từ CSDL
            DataTable dt = kn.laydulieu("SELECT TOP 5 * FROM sanpham WHERE giamgia > 0 ORDER BY NEWID()");

            // Gán dữ liệu vào DataList
            DataList1.DataSource = dt;
            DataList1.DataBind();

            kn.close();
        }

    }
}