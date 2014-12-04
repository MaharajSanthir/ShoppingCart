using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ShoppingCart
{
    public partial class shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                string prod_id = Request.QueryString["prod_id"];
                HiddenFieldProd_ID.Value = prod_id;
                string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using(SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "select * from products where product_id=" + prod_id;

                    SqlCommand com = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader reader = com.ExecuteReader();

                    reader.Read();
                    decimal price = Convert.ToDecimal(reader["price"]);
                    int quantity = Convert.ToInt32(ddlQuantity.SelectedValue);

                    lblProdName.Text = reader["name"].ToString();
                    lblPrice.Text = price.ToString();
                    lblSubTotal.Text = (quantity * price).ToString();
                }

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ddlQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubTotal.Text = (Convert.ToInt32(ddlQuantity.SelectedItem.Text) * Convert.ToDecimal(lblPrice.Text)).ToString();
        }

        protected void btnGoToCart_Click(object sender, EventArgs e)
        {
            CartItem cartItem = new CartItem();
            List<CartItem> cart = new List<CartItem>();

            cartItem.prod_id = Convert.ToInt32(HiddenFieldProd_ID.Value);
            cartItem.prod_name = lblProdName.Text;
            cartItem.quantity = Convert.ToInt32(ddlQuantity.SelectedItem.Text);
            cartItem.price = Convert.ToDecimal(lblPrice.Text);
            cartItem.subtotal = Convert.ToDecimal(lblSubTotal.Text);

            if(Session["Cart"] != null)
            {
                cart = (List<CartItem>) Session["Cart"];
                cart.Add(cartItem);
                Session["Cart"] = cart;
            }
            else
            {
                cart.Add(cartItem);
                Session["Cart"] = cart;
            }

            Response.Redirect("cart.aspx");
        }
    }
}