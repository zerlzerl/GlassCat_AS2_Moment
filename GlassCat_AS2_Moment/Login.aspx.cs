﻿using System;
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

        protected void login(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // after customer validation, user is validated, username can be used in form authentication
                string username = loginUsername.Text;
                // FormsAuthentication.SetAuthCookie(username, rememberCheckbox.Checked);
                FormsAuthentication.RedirectFromLoginPage(username, rememberCheckbox.Checked);
                
            }            
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