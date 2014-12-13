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
    public partial class confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelError.Text = "Products";
            string orderID = Request.QueryString["orderID"];
            if(orderID != null)
            {
                string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlCommand com = new SqlCommand("DisplayOrderDetails", conn);
                    com.CommandType = System.Data.CommandType.StoredProcedure;
                    com.Parameters.Add(new SqlParameter("@OrderID", orderID.ToString()));

                    try
                    {
                        conn.Open();
                        SqlDataReader reader = com.ExecuteReader(); 
                        reader.Read();

                        lblOrderID.Text = orderID.ToString(); 
                        lblOrderDate.Text = reader["OrderDate"].ToString();
                        lblOrderStatus.Text = reader["OrderStatus"].ToString();

                        lblCustName.Text = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                        lblCustAddr.Text = reader["CustAddress"].ToString() + "<br />" +
                                           reader["City"].ToString() + "," + reader["Province"].ToString() + "<br /> " +
                                           reader["PostalCode"].ToString() + "<br />";
                        lblCustPhone.Text = reader["CustPhone"].ToString();
                        lblCustEmail.Text = reader["CustEmail"].ToString();
                        lblPaymentType.Text = reader["PaymentType"].ToString();
                        lblTotal.Text = (Convert.ToDecimal(reader["OrderTotal"])).ToString("C");

                        conn.Close();

                        SqlCommand com2 = new SqlCommand("DisplayOrderItems", conn);
                        com2.CommandType = System.Data.CommandType.StoredProcedure;
                        com2.Parameters.Add(new SqlParameter("@OrderID", orderID.ToString()));

                        conn.Open();
                        SqlDataReader reader2 = com2.ExecuteReader();
                        List<CartItem> OrderItemList = new List<CartItem>();

                        while(reader2.Read())
                        {
                            CartItem Item = new CartItem();
                            Item.prod_id = Convert.ToInt32(reader2["ItemProdID"]);
                            Item.prod_name = reader2["ItemProdName"].ToString();
                            Item.quantity = Convert.ToInt32(reader2["ItemQuantity"]);
                            Item.price = Convert.ToDecimal(reader2["ItemProdPrice"]);
                            Item.subtotal = Item.quantity * Item.price;
                            OrderItemList.Add(Item);
                        }
                        conn.Close();


                        GridView1.DataSource = OrderItemList;
                        GridView1.DataBind();

                        
                    }
                    catch (SqlException ex)
                    {
                        LabelError.Text = ex.ToString();
                    }
                }

            }
        }
    }
}