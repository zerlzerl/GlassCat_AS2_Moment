using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.AdditionalPages
{
    public partial class UserGridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DisplayData(object sender, GridViewCommandEventArgs e)
        {
            int clickedIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow clickedRow = userGridView.Rows[clickedIndex];
            TitleLabel.Text = "Detail information of user: " + clickedRow.Cells[1].Text;
            string detailHtml = "";
            detailHtml += "<table class='table'>";

            detailHtml += "<tr>";
            detailHtml += "<th>Column Name</th>";
            detailHtml += "<th>Value</th>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>ID</td>";
            detailHtml += "<td>" + clickedRow.Cells[0].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Username</td>";
            detailHtml += "<td>" + clickedRow.Cells[1].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Password</td>";
            detailHtml += "<td>" + clickedRow.Cells[2].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Gender</td>";
            detailHtml += "<td>" + clickedRow.Cells[3].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Profession</td>";
            detailHtml += "<td>" + clickedRow.Cells[4].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Favorite Cat Breeds</td>";
            detailHtml += "<td>" + clickedRow.Cells[5].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Email</td>";
            detailHtml += "<td>" + clickedRow.Cells[6].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Motto</td>";
            detailHtml += "<td>" + clickedRow.Cells[7].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Age</td>";
            detailHtml += "<td>" + clickedRow.Cells[8].Text + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>Have a Cat?</td>";
            detailHtml += "<td>" + (((CheckBox)clickedRow.Cells[9].Controls[0]).Checked ? "Yes" : "No") + "</td>";
            detailHtml += "</tr>";

            detailHtml += "<tr>";
            detailHtml += "<td>User Portrial</td>";
            detailHtml += "<td><img style='max-width: 150px;' class='img-rounded img-responsive' src='" + ((HyperLink)(clickedRow.Cells[10].Controls[0])).NavigateUrl.Substring(1) + "' /></td>";
            detailHtml += "</tr>";

            detailHtml += "</table>";

            DetailLabel.Text = detailHtml;
        }
    }
}