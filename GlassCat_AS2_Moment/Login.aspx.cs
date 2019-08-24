using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.Page.User.Identity.IsAuthenticated)
            //{
            //    Response.Redirect(FormsAuthentication.DefaultUrl);
            //}
        }

        protected void ValidateUser(object sender, EventArgs e)
        {
            // after customer validation, user is validated, username can be used in form authentication
            string username = loginUsername.Text;
            FormsAuthentication.SetAuthCookie(username, true);
            bool isloged = this.Page.User.Identity.IsAuthenticated;
            string retrnUrl = Request.QueryString["returnUrl"];
            if (!string.IsNullOrEmpty(retrnUrl))
            {
                //Redirect to Original requested page
                FormsAuthentication.RedirectFromLoginPage(username, rememberCheckbox.Checked);
            }
            else
            {
                //If user directly opened login page, always show him Homepage.
                Response.Redirect("/");
            }

            //string username = txtUsername.Text.Trim();
            //string password = txtPassword.Text.Trim();
            //int userId = 0;
            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand("Validate_User"))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@Username", username);
            //        cmd.Parameters.AddWithValue("@Password", password);
            //        cmd.Connection = con;
            //        con.Open();
            //        userId = Convert.ToInt32(cmd.ExecuteScalar());
            //        con.Close();
            //    }
            //    switch (userId)
            //    {
            //        case -1:
            //            dvMessage.Visible = true;
            //            lblMessage.Text = "Username and/or password is incorrect.";
            //            break;
            //        case -2:
            //            dvMessage.Visible = true;
            //            lblMessage.Text = "Account has not been activated.";
            //            break;
            //        default:
            //            if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            //            {
            //                FormsAuthentication.SetAuthCookie(username, chkRememberMe.Checked);
            //                Response.Redirect(Request.QueryString["ReturnUrl"]);
            //            }
            //            else
            //            {
            //                FormsAuthentication.RedirectFromLoginPage(username, chkRememberMe.Checked);
            //            }
            //            break;
            //    }
            //}
        }

        protected void LoginValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
            // must not null
            string username = loginUsername.Text;
            string password = loginPassword.Text;

            // select sql
            LoginSqlDataSource.SelectCommand = "SELECT * FROM [user] WHERE [username] = @username AND [password] = @password";

            // add parameters
            LoginSqlDataSource.SelectParameters.Clear(); // must clear the parameters first!
            LoginSqlDataSource.SelectParameters.Add("@username", username);
            LoginSqlDataSource.SelectParameters.Add("@password", password);

            //execute sql
            DataView result = (DataView)LoginSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //string uname = (string)result[0]["username"];
            if (result.Count == 0)
            {
                // login failure
                args.IsValid = false;
                LoginValidator.ErrorMessage = "Login fail, please check your username and password.";
            } else
            {
                // found a user by username and password
                args.IsValid = true;
            }
        }
    }
}