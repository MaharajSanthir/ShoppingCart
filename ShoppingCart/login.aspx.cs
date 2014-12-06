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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["ShoppingCartConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand com = new SqlCommand("InsertUser", conn);
                com.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter param = new SqlParameter("@UserName", tbxUserName.Text);
                com.Parameters.Add(param);
                param = new SqlParameter("@Password", tbxPassword.Text);
                com.Parameters.Add(param);

                SqlParameter outputValue = new SqlParameter("@InsertedID", System.Data.SqlDbType.NVarChar, 50);
                outputValue.Direction = System.Data.ParameterDirection.Output;
                com.Parameters.Add(outputValue);

                conn.Open();
                try
                {
                    com.ExecuteNonQuery();
                    Label1.Text = outputValue.Value.ToString();
                }
                catch(Exception ex)
                {
                    Label1.Text = ex.ToString();
                }
                
            }
        }
    }
}