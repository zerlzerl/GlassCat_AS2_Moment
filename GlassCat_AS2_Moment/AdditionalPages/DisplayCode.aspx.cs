using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
namespace GlassCat_AS2_Moment.AdditionalPages
{
    public partial class DisplayCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Server.MapPath(Request.QueryString["filename"]);
            FileName.Text = Request.QueryString["filename"];
            if (!File.Exists(filePath))
            {
                Code.Text = "File not exists.";
                return;
            }

            FileInfo file = new FileInfo(filePath);
            if (file.Extension == ".mdb" || file.Extension == ".exe" || file.Extension == ".accdb"
                || file.Extension == ".docx" || file.Extension == ".xlsx" || file.Extension == ".jpg"
                || file.Extension == ".png")
            {
                Code.Text = "Sorry you cannot read a file with an extension of " + file.Extension;
                return;
            }

            Code.Text = ReadFile(filePath);
        }

        private string ReadFile(string filePath)
        {
            string fileOutput = "";
            try
            {
                StreamReader fileReader = new StreamReader(filePath);
                while (fileReader.Peek() > -1)
                {
                    fileOutput += fileReader.ReadLine()
                        .Replace("<", "&lt;")
                        .Replace(">", "&gt;")
                        .Replace(" ", "&nbsp;") + "<br />";
                }
                fileReader.Close();
            } catch (FileNotFoundException e)
            {
                fileOutput = e.Message;
            }
            return fileOutput;
        }
    }
}