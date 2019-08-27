using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Threading.Tasks;

namespace GlassCat_AS2_Moment
{
    public partial class Default : System.Web.UI.Page
    {
        public partial class MomentObject
        {
            public string userid;
            public string username;
            public string usericonUrl;
            public string postTime;
            public string photoUrl;
            public string message;

            public MomentObject()
            {
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = HttpContext.Current.User.Identity.Name;
            if (string.IsNullOrEmpty(username))
            {
                defaultUsername.Text = "Welcome to GlassCat";
                defaultUserProfession.Visible = false;
                defaultUserMotto.Text = "Love me, love my cat.";
                defaultUserPortrait.ImageUrl = "~/Resources/img/user1-128x128.jpg";
                
            }
            else
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
                else
                {
                    defaultUserPortrait.ImageUrl = (string)result[0]["usericon"];
                }

            }

            // dynamically display all the moments
            momentsDisplay();

        }

        protected void momentsDisplay() {
            DefaultMomentSqlDataSource.SelectCommand = "SELECT * FROM[moment] ORDER by [datetime] DESC";
            DataView resultMoment = (DataView)DefaultMomentSqlDataSource.Select(DataSourceSelectArguments.Empty);
            ArrayList MomentList = new ArrayList();
            for (int i = 0; i < resultMoment.Count; i++)
            {
                MomentObject moment = new MomentObject();
                moment.userid = resultMoment[i]["user_id"].ToString();

                DefaultSqlDataSource.SelectCommand = "SELECT * FROM[user] WHERE[id] = @userid";
                // add parameters
                DefaultSqlDataSource.SelectParameters.Clear(); // must clear the parameters first!
                DefaultSqlDataSource.SelectParameters.Add("@userid", moment.userid);

                //execute sql
                DataView resultMomentUser = (DataView)DefaultSqlDataSource.Select(DataSourceSelectArguments.Empty);

                moment.username = (string)resultMomentUser[0]["username"];
                moment.usericonUrl = (string)resultMomentUser[0]["usericon"];
                moment.postTime = resultMoment[i]["datetime"].ToString();
                moment.photoUrl = resultMoment[i]["photo"].ToString();
                moment.message = (string)resultMoment[i]["message"];

                MomentList.Add(moment);

            }
            defaultMomentRepeater.DataSource = MomentList;
            defaultMomentRepeater.DataBind();
        }

        protected void postBtn_Click(object sender, EventArgs e)
        {
            string username = HttpContext.Current.User.Identity.Name;
            if (string.IsNullOrEmpty(username))
            {
                failLabel.Visible = true;
                
                //failLabel.Visible = false;
            }
            else {
                string postMessage = defaultPostMessage.Text;
                if (defaultPostPhotoUpload.HasFile)
                {
                    string relativePath = "~/user/postPhoto/";
                    string absolutePath = Server.MapPath(relativePath);
                    if (!System.IO.Directory.Exists(absolutePath))
                    {
                        // create upload file path
                        System.IO.Directory.CreateDirectory(absolutePath);
                    }
                    // rename upload file
                    int i = defaultPostPhotoUpload.FileName.LastIndexOf("."); // get the file extened name
                    string exten = defaultPostPhotoUpload.FileName.Substring(i);
                    string newFileName = Guid.NewGuid().ToString() + exten; // new file name
                    string serverSavePath = absolutePath + newFileName; // absolute save path
                    string virtualSavePath = relativePath + newFileName; // virtual http required path
                                                                         // save to server
                    defaultPostPhotoUpload.SaveAs(serverSavePath);


                    DefaultSqlDataSource.SelectCommand = "SELECT * FROM[user] WHERE[username] = @username";
                    // add parameters
                    DefaultSqlDataSource.SelectParameters.Clear(); // must clear the parameters first!
                    DefaultSqlDataSource.SelectParameters.Add("@username", username);

                    //execute sql
                    DataView result = (DataView)DefaultSqlDataSource.Select(DataSourceSelectArguments.Empty);
                    string userid = result[0]["id"].ToString();

                    DefaultMomentSqlDataSource.InsertCommand =
                        "INSERT INTO [moment] " +
                        "([user_id], [message], [photo], [datetime]) " +
                        "VALUES " +
                        "([@user_id], [@message], [@photo], [@datetime])";

                    DefaultMomentSqlDataSource.InsertParameters.Add("@user_id", DbType.Int32, userid);
                    DefaultMomentSqlDataSource.InsertParameters.Add("@message", postMessage);
                    DefaultMomentSqlDataSource.InsertParameters.Add("@photo", virtualSavePath);
                    DefaultMomentSqlDataSource.InsertParameters.Add("@datetime", DateTime.Now.ToString());
                    DefaultMomentSqlDataSource.Insert();

                    //successLabel.Visible = true;
                    momentsDisplay();
                    defaultPostMessage.Text = "";
                    //successLabel.Visible = false;
                }
                
            }

        }
    }
}