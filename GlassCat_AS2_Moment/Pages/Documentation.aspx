<%@ Page Title="Documentation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentation.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.Documentation" %>
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
        <li class="active">Documentation</li>
    </ol>--%>
    <h2>Assignment documentation</h2>
    <h3>1. Details of the author</h3>
        <strong>author1:</strong><p>Sun Yeqing (ID: 30074738, email: <a href="mailto:ysun0069@student.monash.edu">ysun0069@student.monash.edu</a>)</p>
        <strong>author2:</strong><p>Li Xuekai (ID: 30074398, email: <a href="mailto:xlii0121@student.monash.edu">xlii0121@student.monash.edu</a>)</p>
    <br />
    <h3>2. Details of the assignment</h3>
        <strong>unit's name:</strong><p>FIT5192 - Enterprise and Internet applications development</p>
        <strong>unit provider:</strong><p>Monash University, Faculty of Information Technology</p>
        <strong>assignment number:</strong><p>Assignment 2 (<a target="_blank" href="https://lms.monash.edu/pluginfile.php/8918172/mod_resource/content/14/Assignments/FIT5192-A2-2019_Specification.pdf">Website Development Using ASP.NET</a>)</p>
        <strong>date of submission:</strong><p>27th, Aug, 2019</p>
        <strong>tutor’s name:</strong><p>Murray Mount</p>
    <br />
    <h3>3. Task Allocation</h3>
        <strong>Sun Yeqing:</strong><p>Master Page; Home Page; About Us; Site Map; Documentation; Email</p>
        <strong>Li Xuekai:</strong><p>Registration; User Records Display & Search; Login System; Calendar</p>
    <br />
    <h3>4. References</h3>
        <strong>Microsoft ASP.NET overview:</strong><p><a href="https://docs.microsoft.com/en-us/aspnet/overview">https://docs.microsoft.com/en-us/aspnet/overview</a></p>
        <strong>Microsoft C# Guide:</strong><p><a href="https://docs.microsoft.com/en-us/dotnet/csharp/">https://docs.microsoft.com/en-us/dotnet/csharp/</a></p>
        <strong>Bootstrap v3.3.7 documentation:</strong><p><a href="https://getbootstrap.com/docs/3.3/css/">https://getbootstrap.com/docs/3.3/css/</a></p>
        <strong>Github front-end project, AdminLTE</strong><p><a href="https://github.com/ColorlibHQ/AdminLTE">https://github.com/ColorlibHQ/AdminLTE</a></p>
    <br />
    <h3>5. Functional description</h3>
        <strong>Login:</strong><p>All the pages except Login, Register and Homepage are not accessible until the user sign in. Validations here are necessary.</p>
        <strong>Register:</strong><p>A visitor could register to be a user of our website. All the fields are required to be filled in, but the user could skip the step of choosing a portrait.</p>
        <strong>Homepage:</strong><p>After a successful login, the blue-and-white card will no longer show the logo and slogan of our website, but the user's personal information. To the right of the card, 
            there's a list of moments post by all the members from our community. You can post one as well! At the bottom of this page, there come the advertisements which may be beneficial for your cats.</p>
        <strong>About us:</strong><p>It has two subpages, 'our history' and 'FAQ'.</p>
        <strong>Site map:</strong><p>Three ways are used to generate the treeview of our website. Two different .xml files are userd in method 2 and 3.</p>
        <strong>Documentation:</strong><p>Some important information are displayed here.</p>
        <strong>Email:</strong><p>You can send emails to one or multiple members of our community.</p>
        <strong>Calendar:</strong><p>You will get informed by browsing through this page if today has a big event.</p>

    
</asp:Content>
