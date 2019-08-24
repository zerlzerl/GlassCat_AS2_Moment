<%@ Page Title="History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div style="background-color:#f0f0f0; padding:10px; font-size:16px;">
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="true" />
        <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathSeparator=" --> ">
        </asp:SiteMapPath>
    </div>
    <%--<ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><a href="/Pages/About.aspx">About us</a></li>
        <li class="active">Our history</li>
    </ol>--%>
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
    
</asp:Content>
