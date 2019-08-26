<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.FAQ" %>
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
        <li class="active">FAQ</li>
    </ol>--%>
    <h2>Some frequently asked questions:</h2>
    <h3>Q1. Why do you compare cats as glass?</h3>
    <p>
        Cats are like glass, so soft that it can be of any shape.
        <br />
        Cats are like glass, so fragile that it deserves our special care.
        <br />
        Cats are like glass, so ubiquitous that it can be found anywhere.
        <br />
        Aren't they alike?
    </p>
    <br />
    <h3>Q2. Can I post photos of my lovely cat here?</h3>
    <p>
        Yes, of course. 
        <br />
        This is what our website is designed for.
    </p>
    <br />
    <h3>Q3. Can I chat with other users?</h3>
    <p>
        Sorry, but we are working on this feature.
        <br />
        The new version will soon be released.
        <br />
        You can keep looking forward to it.
    </p>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn" 
                href="/AdditionalPages/DisplayCode.aspx?filenames=~/Pages/FAQ.aspx;~/Pages/FAQ.aspx.cs">FAQ</a>
        </div>
    </div>
    
</asp:Content>
