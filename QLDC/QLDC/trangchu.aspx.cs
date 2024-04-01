using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class trangchu : System.Web.UI.Page
    {
        Ketnoi kn = new Ketnoi();

        public DataList DataListCart { get; private set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
                DataListCart = new DataList(); // Khởi tạo DataListCart
            }
        }
        public void load()
        {
            kn.Open();
            DataList1.DataSource = kn.laydulieu("SELECT TOP 16 * FROM sanpham ORDER BY NEWID()");
            DataList1.DataBind();
            kn.close();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        

        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            load();
        }

       

        protected void btnAddToCart_Click1(object sender, EventArgs e)
        {
            Button btnAddToCart = (Button)sender;
            string productId = btnAddToCart.CommandArgument;

            List<string> cart;
            if (Session["Cart"] == null)
            {
                cart = new List<string>();
            }
            else
            {
                cart = (List<string>)Session["Cart"];
            }

            cart.Add(productId);
            Session["Cart"] = cart;

            // Hiển thị thông báo JavaScript và chuyển hướng sau khi nhấp vào nút OK
            string script = "alert('Sản phẩm đã được thêm vào giỏ hàng.'); redirectToCart();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartAlert", script, true);
        
    }
    }
}