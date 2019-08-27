using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.Pages
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = HttpContext.Current.User.Identity.Name;
            if(string.IsNullOrEmpty(username))
            {
                SenderNameInput.Text = "";
            } else
            {
                SenderNameInput.Text = "GlassCat@126.com";                
            }
            SenderNameInput.ReadOnly = true;
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            MailMessage newEmailMsg = new MailMessage();
            foreach (GridViewRow userRow in UserContactGridView.Rows)
            {
                CheckBox isSelectedBox = (CheckBox)userRow.FindControl("EmailCheckbox"); // get selected user contacts
                if (isSelectedBox != null && isSelectedBox.Checked)
                {
                    // select a user
                    newEmailMsg.To.Add(new MailAddress(
                        userRow.Cells[3].Text,  // address
                        "Dear " + userRow.Cells[0].Text  // displayName
                        ));

                }
            }
            
            if (AttachmentUpload.HasFile)
            {
                // add attachment
                string filePath = "~/user/files/";
                string absoluteFilePath = Server.MapPath(filePath);
                if (!System.IO.Directory.Exists(absoluteFilePath))
                {
                    // create upload file path
                    System.IO.Directory.CreateDirectory(absoluteFilePath);
                }
                string fileName = AttachmentUpload.FileName;
                AttachmentUpload.SaveAs(absoluteFilePath + fileName);
                Attachment newAttachment = new Attachment(absoluteFilePath + fileName);
                newEmailMsg.Attachments.Add(newAttachment);
            }
            // get current users email
            // string username = HttpContext.Current.User.Identity.Name;
            // userEmailSearchDataSource.SelectCommand = "SELECT * FROM [user] WHERE [username] = '" + username + "'";
            // DataView result = (DataView)userEmailSearchDataSource.Select(DataSourceSelectArguments.Empty);
            // string currentUserEmail = (string)result[0]["email"];

            newEmailMsg.From = new MailAddress("GlassCat@126.com", "Glasscat");
            newEmailMsg.Subject = SubjectInput.Text;
            newEmailMsg.Body = ComposeTextbox.Text;

            try
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.126.com";
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("GlassCat", "glasscat123");
                smtp.Send(newEmailMsg);
                successLabel.Visible = true;
            } catch (Exception exc)
            {
                failLabel.Text = exc.Message;
                failLabel.Visible = true;
            }
        }
    }
}