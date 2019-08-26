using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void registerUsernameValidate(object source, ServerValidateEventArgs args)
        {
            string username = registerUsername.Text;
            if (string.IsNullOrEmpty(username))
            {
                return;
            }
            // set select sql
            RegisterSqlDataSource.SelectCommand = "SELECT COUNT(*) from [user] WHERE [username]=@username";

            // set select parameter
            RegisterSqlDataSource.SelectParameters.Clear();
            RegisterSqlDataSource.SelectParameters.Add("@username", username);

            // execute select command
            int count = (int)((DataView)RegisterSqlDataSource.Select(DataSourceSelectArguments.Empty))[0][0];
            if (count == 0)
            {
                // no same username
                args.IsValid = true;
            } else
            {
                args.IsValid = false;
                registerUsernameDuplicateValidator.ErrorMessage = "This username has already been registered, try another";
            }
        }

        protected void uploadPortrialBtn_Click(object sender, EventArgs e)
        {
            // retain password after submit protrial
            string password = registerPassword.Text;
            string passwordConfrim = registerPasswordConfirmation.Text;

            string serverSavePath = "~/user/protrial/";
            if (registerUserIconUpload.HasFile)
            {
                string userProtrialPath = Server.MapPath(serverSavePath);
                if (!System.IO.Directory.Exists(userProtrialPath)) 
                {
                    // create upload file path
                    System.IO.Directory.CreateDirectory(userProtrialPath);
                }
                // rename upload file
                int i = registerUserIconUpload.FileName.LastIndexOf("."); // get the file extened name
                string exten = registerUserIconUpload.FileName.Substring(i);
                string newFileName = Guid.NewGuid().ToString() + exten; // new file name
                string savePath = userProtrialPath + newFileName; // absolute save path
                string virtualSavePath = serverSavePath + newFileName; // virtual http required path

                // save to server
                registerUserIconUpload.SaveAs(savePath);

                // show on the page
                registerPortraitPreview.ImageUrl = virtualSavePath;
                registerPortraitPreview.Visible = true;

                // hide upload btn
                uploadPortrialBtn.Visible = false;
                registerUserIconUpload.Visible = false;


                // retain password after submit protrial
                registerPassword.Attributes.Add("value", password);
                registerPasswordConfirmation.Attributes.Add("value", passwordConfrim);
            }
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // get register data from page forms
                string username = registerUsername.Text;
                string password = registerPassword.Text;
                string email = registerEmail.Text;
                string gender = genderRadioButtonList.SelectedValue;
                string profession = professionDropDownList.SelectedValue;
                string age = registerAge.Text;

                List<string> favoriteCatBreeds = new List<string>();
                foreach (ListItem item in registerFavoriteCatBreeds.Items)
                {
                    if (item.Selected)
                    {
                        // item ...
                        favoriteCatBreeds.Add(item.Value);
                    }
                }
                string favoriteCatBreedsStr = string.Join(",", favoriteCatBreeds.ToArray());
                string motto = registerMotto.Text;
                bool ownCats = ownCatCheckbox.Checked;
                string userProtrialUrl = registerPortraitPreview.ImageUrl;

                // set insert sql
                RegisterSqlDataSource.InsertCommand =
                    "INSERT INTO [user] " +
                    "([username], [password], [gender], [profession], [interests], [own_cats], [email], [usericon], [motto], [age]) " +
                    "VALUES " +
                    "([@username], [@password], [@gender], [@profession], [@interests], [@own_cats], [@email], [@usericon], [@motto], [@age])";

                RegisterSqlDataSource.InsertParameters.Clear();
                RegisterSqlDataSource.InsertParameters.Add("@username", username);
                RegisterSqlDataSource.InsertParameters.Add("@password", password);
                RegisterSqlDataSource.InsertParameters.Add("@gender", gender);
                RegisterSqlDataSource.InsertParameters.Add("@profession", profession);
                RegisterSqlDataSource.InsertParameters.Add("@interests", favoriteCatBreedsStr);
                RegisterSqlDataSource.InsertParameters.Add("@own_cats", DbType.Boolean, ownCats ? "true" : "false");
                RegisterSqlDataSource.InsertParameters.Add("@email", email);
                RegisterSqlDataSource.InsertParameters.Add("@usericon", userProtrialUrl);
                RegisterSqlDataSource.InsertParameters.Add("@motto", motto);
                RegisterSqlDataSource.InsertParameters.Add("@age", DbType.Int32, age);

                RegisterSqlDataSource.Insert();

                Response.Redirect("/Login.aspx");
            }
        }
    }
}