using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Collections;

namespace GlassCat_AS2_Moment.AdditionalPages
{   
    public partial class DisplayCode : System.Web.UI.Page
    {
        public partial class CodeObject
        {
            public string filename;
            public string code;

            public CodeObject()
            {
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string filenames = Request.QueryString["filenames"];
            string[] filenameList = new string[1];
            if (string.IsNullOrEmpty(filenames))
            {
                filenameList[0] = "";
            }
            else
            {
                filenameList = filenames.Split(';');
            }
            ArrayList CodeList = new ArrayList();
            foreach(string filename in filenameList) {
                CodeObject code = new CodeObject();
                string filePath = Server.MapPath(filename);
                code.filename = filename;
                if (!File.Exists(filePath))
                {
                    code.code = "File not exists.";
                    return;
                }

                FileInfo file = new FileInfo(filePath);
                if (file.Extension == ".mdb" || file.Extension == ".exe" || file.Extension == ".accdb"
                    || file.Extension == ".docx" || file.Extension == ".xlsx" || file.Extension == ".jpg"
                    || file.Extension == ".png")
                {
                    code.code = "Sorry you cannot read a file with an extension of " + file.Extension;
                    return;
                }
                code.code = ReadFile(filePath);
                CodeList.Add(code);
            }
            CodesReqeater.DataSource = CodeList;
            CodesReqeater.DataBind();
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