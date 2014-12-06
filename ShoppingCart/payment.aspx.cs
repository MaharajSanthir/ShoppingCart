using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace ShoppingCart
{
    public partial class payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CustomerAddresses"]!= null)
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Enter codes here to process creditcard payment!
        }

    }
}