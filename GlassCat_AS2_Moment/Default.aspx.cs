using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = HttpContext.Current.User.Identity.Name;
            if (string.IsNullOrEmpty(username))
            {
                defaultUsername.Text = "Welcome to GlassCat";
                defaultUserProfession.Visible = false;
                defaultUserMotto.Text = "Love me, love my cat.";
                defaultUserPortrait.ImageUrl = "~/Resources/img/user1-128x128.jpg";
            } else
            {
                DefaultSqlDataSource.SelectCommand = "SELECT * FROM[user] WHERE[username] = @username";
                // add parameters
                DefaultSqlDataSource.SelectParameters.Clear(); // must clear the parameters first!
                DefaultSqlDataSource.SelectParameters.Add("@username", username);

                //execute sql
                DataView result = (DataView)DefaultSqlDataSource.Select(DataSourceSelectArguments.Empty);
                string userProfession = (string)result[0]["profession"];
                string userMotto = (string)result[0]["motto"];
                defaultUsername.Text = username;
                defaultUserProfession.Text = userProfession;
                defaultUserMotto.Text = userMotto;
                if (result[0]["usericon"] == DBNull.Value)
                {
                    defaultUserPortrait.ImageUrl = "~/Resources/img/user1-128x128.jpg";
                }
                else {
                    defaultUserPortrait.ImageUrl = (string)result[0]["usericon"];
                }
                
            }
         
        }
    }
}