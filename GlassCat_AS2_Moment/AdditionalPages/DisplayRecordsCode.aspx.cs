using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.AdditionalPages
{
    public partial class DisplayRecordsCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList fileList = new ArrayList();
            fileList.Add("~/AdditionalPages/UserGridView.aspx");
            fileList.Add("~/AdditionalPages/UserGridView.aspx.cs");

            DisplayRecordsCodeList.DataSource = fileList;
            DisplayRecordsCodeList.DataBind();
        }
    }
}