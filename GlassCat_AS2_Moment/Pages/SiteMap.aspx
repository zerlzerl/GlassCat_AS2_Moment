<%@ Page Title="Site map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="breadcrumbs">
        <asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" ShowStartingNode="true" />
        <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathSeparator=" --> ">
        </asp:SiteMapPath>
    </div>

    <div class="jumbotron">
        <h2>Site map for GlassCat</h2>

        <p>Method 1: without extra xml files</p>
        <asp:TreeView ID="TreeView1" runat="server">
            <Nodes>
                <asp:TreeNode Text="Home" NavigateUrl="/">
                    <asp:TreeNode Text="Register" NavigateUrl="/Register.aspx" />
                    <asp:TreeNode Text="About us" NavigateUrl="/Pages/About.aspx">
                        <asp:TreeNode Text="Our History" NavigateUrl="/Pages/History.aspx" />
                        <asp:TreeNode Text="FAQ" NavigateUrl="/Pages/FAQ.aspx" />
                    </asp:TreeNode>
                    <asp:TreeNode Text="Site map" NavigateUrl="/Pages/SiteMap.aspx" />
                    <asp:TreeNode Text="Documentation" NavigateUrl="/Pages/Documentation.aspx" />
                    <asp:TreeNode Text="Email" NavigateUrl="/Pages/Email.aspx" />
                    <asp:TreeNode Text="Calendar" NavigateUrl="/Pages/Calendar.aspx" />
                    <asp:TreeNode Text="Login" NavigateUrl="/Login.aspx" />
                </asp:TreeNode>
            </Nodes>
        </asp:TreeView>

        <br />
        <p>Method 2: with Web.sitemap as the SiteMap datasource (required in assignment)</p>
        <div>
            <asp:TreeView ID="TreeView2" runat="server" DataSourceID="SiteMapDataSource1">
            </asp:TreeView>
            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        </div>

        <br />
        <p>Method 3: with DataBindings</p>
        <asp:TreeView ID="TreeView3"
            DataSourceID="WebsiteXmlDataSource"
            runat="server">

            <DataBindings>
                <asp:TreeNodeBinding DataMember="Book" TextField="Title" />
                <asp:TreeNodeBinding DataMember="Chapter" TextField="Heading" />
                <asp:TreeNodeBinding DataMember="Section" TextField="Heading" />
            </DataBindings>

        </asp:TreeView>

        <asp:XmlDataSource ID="WebsiteXmlDataSource"
            DataFile="~/Web1.sitemap"
            runat="server"></asp:XmlDataSource>

        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn"
                    href="/AdditionalPages/DisplayCode.aspx?filenames=~/Pages/SiteMap.aspx;~/Pages/SiteMap.aspx.cs;~/Web.sitemap;~/Web1.sitemap">SiteMap</a>
            </div>
        </div>

    </div>

</asp:Content>
