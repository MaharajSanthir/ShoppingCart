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
                // If category_id is passed in the url
                string cat_name = "";
                string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "select products.product_id,products.cat_id, products.name AS prodName, products.description, products.price,categories.name AS catName from products INNER JOIN categories ON products.cat_id=categories.cat_id where products.cat_id=" + cat_id;
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
                        product.name = reader["prodName"].ToString();
                        product.description = reader["description"].ToString();
                        product.price = Convert.ToDecimal(reader["price"]);
                        cat_name = reader["catName"].ToString();
                        products.Add(product);
                    }
                    GridView1.DataSource = products;
                    GridView1.DataBind();
                }
            }
            else
            {
                // If no category_id is passed in the url list all products
                string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "select * from products";
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