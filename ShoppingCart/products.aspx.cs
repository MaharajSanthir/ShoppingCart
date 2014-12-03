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
                        product = new Product();
                        product.ID = Convert.ToInt32(reader["product_id"]);
                        product.Cat_ID = Convert.ToInt32(reader["cat_id"]);
                        product.Name = reader["name"].ToString();
                        product.Description = reader["description"].ToString();
                        product.Price = Convert.ToDecimal(reader["price"]);
                        products.Add(product);
                    }

                    GridView1.DataSource = products;
                    GridView1.DataBind();

                }

            }
        }
    }
}