using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class Chitietsp : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["masplayduoc"] = int.Parse(Request.QueryString.Get("masp"));
            load();
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