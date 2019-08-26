using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.AdditionalPages
{
    public partial class AddRecordsCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList fileList = new ArrayList();
            fileList.Add("~/Register.aspx");
            fileList.Add("~/Register.aspx.cs");

            AddRecordCodeList.DataSource = fileList;
            AddRecordCodeList.DataBind();
        }
    }
}