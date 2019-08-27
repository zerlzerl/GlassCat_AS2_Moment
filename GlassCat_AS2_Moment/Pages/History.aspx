<%@ Page Title="History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <meta name="author" content="Sun Yeqing">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="breadcrumbs">
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="true" />
        <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathSeparator=" --> ">
        </asp:SiteMapPath>
    </div>

    <div class="jumbotron">
        <h2>The history of us, GlassCat</h2>
        <p>
            Our company, GlassCat, is found on 19th, Aug, 2019.
        <br />
            There are merely one employer and one employee at first.
        <br />
            However, our team are much more ambitious, and our strength are more powerful now,
        <br />
            just because of your trust and joining us. 
        </p>
        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn"
                    href="/AdditionalPages/DisplayCode.aspx?filenames=~/Pages/History.aspx;~/Pages/History.aspx.cs">History</a>
            </div>
        </div>
    </div>
    <div id="bodyPaddingDiv"></div>
    
</asp:Content>
