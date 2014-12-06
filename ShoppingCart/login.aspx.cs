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
                SqlCommand checkCommand = new SqlCommand("UserNameCheckExist", conn);
                checkCommand.CommandType = System.Data.CommandType.StoredProcedure;

                checkCommand.Parameters.Add(new SqlParameter("@UserName",tbxUserName.Text));
                checkCommand.Parameters.Add(new SqlParameter("@Password",tbxPassword.Text));
                SqlParameter returned = new SqlParameter("@Ret", System.Data.SqlDbType.Int);
                returned.Direction = System.Data.ParameterDirection.Output;
                checkCommand.Parameters.Add(returned);

                conn.Open();

                try
                {
                    checkCommand.ExecuteNonQuery();

                    if (returned.Value.ToString() == "1")
                        lblError.Text += "<br />Username already exist. Enter different username!";
                    else
                    {
                        lblError.Text = "";
                        SqlCommand com = new SqlCommand("InsertUser", conn);
                        com.CommandType = System.Data.CommandType.StoredProcedure;

                        SqlParameter param = new SqlParameter("@UserName", tbxUserName.Text);
                        com.Parameters.Add(param);
                        param = new SqlParameter("@Password", tbxPassword.Text);
                        com.Parameters.Add(param);

                        SqlParameter outputValue = new SqlParameter("@InsertedID", System.Data.SqlDbType.NVarChar, 50);
                        outputValue.Direction = System.Data.ParameterDirection.Output;
                        com.Parameters.Add(outputValue);

                        try
                        {
                            com.ExecuteNonQuery();
                            Session["UserLoggedin"] = tbxUserName.Text;
                            Response.Redirect("customer.aspx");
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.ToString();
                }

                conn.Close();
            }
        }

        protected void btnBackToShipping_Click(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx");
        }
    }
}