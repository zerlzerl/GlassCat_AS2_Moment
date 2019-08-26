﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

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

            // dynamically display all the moments
            DefaultMomentSqlDataSource.SelectCommand = "SELECT * FROM[moment]";
            DataView resultMoment = (DataView)DefaultMomentSqlDataSource.Select(DataSourceSelectArguments.Empty);
            ArrayList MomentList = new ArrayList();
            for (int i = 0; i < resultMoment.Count; i++) {
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

          



            // display the first moment
            //DefaultMomentSqlDataSource.SelectCommand = "SELECT * FROM[moment]";
            //DataView resultMoment = (DataView)DefaultMomentSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //if (resultMoment.Count == 0) {
            //    defaultMomentUsername.Text = "Tim";
            //    defaultMomentUsericon.ImageUrl = "~/Resources/img/user1-128x128.jpg";
            //    defaultMomentDatetime.Text = (string)"2019/7/13";
            //    defaultMomentPhoto.ImageUrl = "~/Resources/img/cat2.jpg";
            //    defaultMomentMessage.Text = "I like dogs too.";
            //} else
            //{

            //    defaultMomentDatetime.Text = resultMoment[0]["datetime"].ToString();
            //    defaultMomentPhoto.ImageUrl = (string)resultMoment[0]["photo"];
            //    defaultMomentMessage.Text = (string)resultMoment[0]["message"];

            //    string momentUserid = resultMoment[0]["user_id"].ToString();
            //    DefaultSqlDataSource.SelectCommand = "SELECT * FROM[user] WHERE[id] = @userid";
            //    // add parameters
            //    DefaultSqlDataSource.SelectParameters.Clear(); // must clear the parameters first!
            //    DefaultSqlDataSource.SelectParameters.Add("@userid", momentUserid);

            //    //execute sql
            //    DataView resultMomentUser = (DataView)DefaultSqlDataSource.Select(DataSourceSelectArguments.Empty);

            //    defaultMomentUsername.Text = (string)resultMomentUser[0]["username"];
            //    if (resultMomentUser[0]["usericon"] == DBNull.Value)
            //    {
            //        defaultMomentUsericon.ImageUrl = "~/Resources/img/user1-128x128.jpg";
            //    }
            //    else
            //    {
            //        defaultMomentUsericon.ImageUrl = (string)resultMomentUser[0]["usericon"];
            //    }


        }

    }
    
}