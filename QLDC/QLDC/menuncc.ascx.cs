﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class menuncc : System.Web.UI.UserControl
    {
        Ketnoi kn = new Ketnoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        public void load()
        {
            kn.Open();
            DataList1.DataSource = kn.laydulieu("select * from nhacungcap");
            DataList1.DataBind();
            kn.close();
        }
    }
}