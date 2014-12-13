using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ShoppingCart
{
    public partial class payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Cart"] == null)
                Response.Redirect("cart.aspx");

            if (Session["CustomerAddresses"] == null)
                Response.Redirect("customer.aspx");
            else
            {
                CustomerAddresses cust = (CustomerAddresses) Session["CustomerAddresses"];
                lblBillingAddress.Text=     cust.firstname + " "+ cust.lastname + "<br />" +
                                            cust.address + "<br />" +
                                            cust.city + "," + cust.province + "<br />" +
                                            cust.postalcode + "<br />";
                lblPhone.Text = cust.phone;
                lblEmail.Text = cust.email;
         
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string creditCardNum = txtCreditcardNum.Text;

            Regex regex = new Regex(@"^\d+$");
            Match m = regex.Match(creditCardNum);

            try
            { 
                if(m.Success)
                {
                    if (IsValidNumber(creditCardNum))
                    {
                        args.IsValid = true;
                    }
                    else
                        args.IsValid = false;
                }
                else
                    args.IsValid = false;
            }
            catch(Exception ex)
            {
                lblError.Text = ex.ToString();
            }
        }

        /// Extremely fast Luhn algorithm implementation, based on 
        /// pseudo code from Cliff L. Biffle (http://microcoder.livejournal.com/17175.html)
        /// 
        /// Copyleft Thomas @ Orb of Knowledge:
        /// http://orb-of-knowledge.blogspot.com/2009/08/extremely-fast-luhn-function-for-c.html 
        /// 
        private static bool IsValidNumber(string number)
        {
            int[] DELTAS = new int[] { 0, 1, 2, 3, 4, -4, -3, -2, -1, 0 };
            int checksum = 0;
            char[] chars = number.ToCharArray();
            for (int i = chars.Length - 1; i > -1; i--)
            {
                int j = ((int)chars[i]) - 48;
                checksum += j;
                if (((i - chars.Length) % 2) == 0)
                    checksum += DELTAS[j];
            }

            return ((checksum % 10) == 0);
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string SecurityCode = txtSecurityCode.Text;

            Regex regex = new Regex(@"^(\d{4})|(\d{3})$");
            Match m = regex.Match(SecurityCode);

            try
            {
                if (m.Success)
                    args.IsValid = true;
                else
                    args.IsValid = false;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string expYear = txtExpYear.Text;

            Regex regex = new Regex(@"^\d{2}$");
            Match m = regex.Match(expYear);

            try
            {
                if (m.Success && Convert.ToInt32(expYear) > 14)
                    args.IsValid = true;
                else
                    args.IsValid = false;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool paymentSuccess = false;
            decimal OrderTotal = 0;
            string PaymentType = ddlPaymentType.SelectedValue;
            int customerID = 0;
            int orderID = 0;


            // This assignment does not require the credit card payment to be made. 
            // Therefore, it is assumed that the payment is succeeded. 
            // The below code sets the paymentSuccess value to be true.
            
            if(Session["Cart"] != null && Session["CustomerAddresses"] != null)
            {
                foreach (CartItem cartItem in (List<CartItem>)Session["Cart"])
                    OrderTotal += cartItem.subtotal;

                // Enter codes here to process creditcard payment!
                paymentSuccess = true;
            }
            else
                lblError.Text = "Cart session and the customer detail sessions are not available or expired.";


            if (paymentSuccess && OrderTotal > 0)
            {
                // Saving all the details to database
                string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    CustomerAddresses custAddr = new CustomerAddresses();
                    custAddr = (CustomerAddresses)Session["CustomerAddresses"];

                    SqlCommand com = new SqlCommand("InsertCustomerAddresses", conn);
                    com.CommandType = CommandType.StoredProcedure;

                    com.Parameters.Add(new SqlParameter("@firstname", custAddr.firstname.ToString()));
                    com.Parameters.Add(new SqlParameter("@lastname", custAddr.lastname.ToString()));
                    com.Parameters.Add(new SqlParameter("@address", custAddr.address.ToString()));
                    com.Parameters.Add(new SqlParameter("@city", custAddr.city.ToString()));
                    com.Parameters.Add(new SqlParameter("@province", custAddr.province.ToString()));
                    com.Parameters.Add(new SqlParameter("@postalcode", custAddr.postalcode.ToString()));
                    com.Parameters.Add(new SqlParameter("@phone", custAddr.phone.ToString()));
                    com.Parameters.Add(new SqlParameter("@email", custAddr.email.ToString()));

                    SqlParameter InsertedCustID = new SqlParameter("@InsertedCustID", SqlDbType.Int);
                    InsertedCustID.Direction = ParameterDirection.Output;
                    com.Parameters.Add(InsertedCustID);

                    try
                    {
                        conn.Open();

                        com.ExecuteNonQuery();
                        customerID = Convert.ToInt32(InsertedCustID.Value);

                        if (customerID != 0)
                        {
                            SqlCommand InsertOrderSQLCommand = new SqlCommand("InsertOrder", conn);
                            InsertOrderSQLCommand.CommandType = CommandType.StoredProcedure;

                            InsertOrderSQLCommand.Parameters.Add(new SqlParameter("@customer_id", customerID));
                            InsertOrderSQLCommand.Parameters.Add(new SqlParameter("@payment_type", PaymentType));
                            InsertOrderSQLCommand.Parameters.Add(new SqlParameter("@total", OrderTotal));

                            SqlParameter InsertedOrderID = new SqlParameter("@order_id", SqlDbType.Int);
                            InsertedOrderID.Direction = ParameterDirection.Output;
                            InsertOrderSQLCommand.Parameters.Add(InsertedOrderID);

                            InsertOrderSQLCommand.ExecuteNonQuery();
                            orderID = Convert.ToInt32(InsertedOrderID.Value);

                            foreach (CartItem item in (List<CartItem>)Session["Cart"])
                            {
                                SqlCommand ComInsertOrderItem = new SqlCommand("InsertOrderItems", conn);
                                ComInsertOrderItem.CommandType = CommandType.StoredProcedure;

                                ComInsertOrderItem.Parameters.Add(new SqlParameter("@order_id", orderID));
                                ComInsertOrderItem.Parameters.Add(new SqlParameter("@product_id", item.prod_id));
                                ComInsertOrderItem.Parameters.Add(new SqlParameter("@quantity", item.quantity));

                                ComInsertOrderItem.ExecuteNonQuery();
                            }
                        }

                        conn.Close();
                        Session["Cart"] = null;
                        Session["CustomerAddresses"] = null;

                        Response.Redirect("confirmation.aspx?orderID=" + orderID);
                    }
                    catch (SqlException ex)
                    {
                        lblError.Text = ex.ToString();
                    }
                }

            }
            else
                lblError.Text = "Payment did not go through!";

            

            
        }

        protected void btnBackToAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx");
        }

    }
}