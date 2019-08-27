using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.Pages
{
    public partial class Documentation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void shiftColorBtn_Click(object sender, EventArgs e)
        {
            Site masterPage = (Site)(Page.Master);
            string hint = shiftColorBtn.Text;
            if (hint == "Light")
            {
                shiftColorBtn.Text = "Dark";
                masterPage.getPanel().BackColor = System.Drawing.Color.White;
            }
            else
            {
                shiftColorBtn.Text = "Light";
                masterPage.getPanel().BackColor = System.Drawing.Color.Black;
            }
        }
    }
}