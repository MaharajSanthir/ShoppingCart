using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cat_id = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
            Response.Redirect("products.aspx?cat_id=" + cat_id);
        }
    }
}