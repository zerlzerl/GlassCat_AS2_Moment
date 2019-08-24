using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.Page.User.Identity.IsAuthenticated)
            //{
            //    // loggedin
            //    Login_logout.Text = "Log out";                
            //} else
            //{
            //    Login_logout.Text = "Log in";                
            //}
        }

        protected void Login_logout_Click(object sender, EventArgs e)
        {
            //if (Login_logout.Text == "Log out")
            //{
            //    FormsAuthentication.SignOut();
            //    Response.Redirect("/Login.aspx");
            //}
            //else
            //{
            //    Response.Redirect("/Login.aspx");
            //}
        }
    }
}