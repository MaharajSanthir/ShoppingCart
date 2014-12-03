using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ShoppingCart
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cat_id = Request.QueryString["cat_id"];
            if (cat_id != null)
            {
                string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "select * from products where cat_id=" + cat_id;
                    SqlCommand com = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader reader = com.ExecuteReader();

                    List<product> products = new List<product>();
                    product product;

                    while (reader.Read())
                    {
                        product = new product();
                        product.product_id = Convert.ToInt32(reader["product_id"]);
                        product.cat_id = Convert.ToInt32(reader["cat_id"]);
                        product.name = reader["name"].ToString();
                        product.description = reader["description"].ToString();
                        product.price = Convert.ToDecimal(reader["price"]);
                        products.Add(product);
                    }

                    GridView1.DataSource = products;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string prod_id = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
            Response.Redirect("shopping.aspx?prod_id="+prod_id);
        }
    }
}