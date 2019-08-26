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
            Button btn = (Button)sender;
            switch(btn.Text)
            {
                case "Search via ID":
                    searchUserDataSource.SelectCommand = "SELECT * FROM [user] WHERE [ID] = " + userIdInput.Text.Trim(' ');
                    break;
                case "Search via username":
                    searchUserDataSource.SelectCommand = "SELECT * FROM [user] WHERE [username] LIKE '%" + usernameInput.Text.Trim(' ') + "%'";
                    break;
                case "Search via email":
                    searchUserDataSource.SelectCommand = "SELECT * FROM [user] WHERE [email] LIKE '%" + emailInput.Text.Trim(' ') + "%'";
                    break;
            }
            searchUserListView.DataSource = searchUserDataSource;
            searchUserListView.DataBind();

        }
    }
}