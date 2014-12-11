using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCart
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                btnCheckout.Enabled = false;
                btnContinue.Text = "Go To Shopping";
            }
            else
            {
                List<CartItem> Cart = new List<CartItem>();
                Cart = (List<CartItem>)Session["Cart"];

                GridView1.DataSource = Cart;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<CartItem> Cart = new List<CartItem>();
            Cart = (List<CartItem>)Session["Cart"];
            Cart.RemoveAt(GridView1.SelectedIndex);

            Session["Cart"] = Cart;

            GridView1.DataSource = Cart;
            GridView1.DataBind();

            if (Cart.Count() == 0)
            {
                btnCheckout.Enabled = false;
                btnContinue.Text = "Go To Shopping";
                Session["Cart"] = null;
            }

        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
                Response.Redirect("customer.aspx");
        }
    }
}