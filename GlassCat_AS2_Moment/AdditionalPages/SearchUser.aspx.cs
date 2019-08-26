using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.AdditionalPages
{
    public partial class SearchUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchUsers_Click(object sender, EventArgs e)
        {
            // handle search logic
            string userId = userIdInput.Text;
            string username = usernameInput.Text;
            string userEmail = emailInput.Text;

            // 
        }
    }
}