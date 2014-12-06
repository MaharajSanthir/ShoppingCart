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
    public partial class customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CustomerAddresses custAddr = new CustomerAddresses();
            custAddr.firstname = txtFirstName.Text;
            custAddr.lastname = txtLastName.Text;
            custAddr.address = txtAddress.Text;
            custAddr.city = txtCity.Text;
            custAddr.province = txtProvince.Text;
            custAddr.postalcode = txtPostalCode.Text;
            custAddr.phone = txtPhone.Text;
            custAddr.email = txtEmail.Text;

            Session["CustomerAddresses"] = null;
            Session["CustomerAddresses"] = custAddr;

            Response.Redirect("payment.aspx");
        }
    }
}