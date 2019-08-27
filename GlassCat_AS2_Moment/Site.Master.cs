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
            
        }
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            
        }
        
        public Panel getPanel()
        {
            return this.Panel1;
        }
    }
}