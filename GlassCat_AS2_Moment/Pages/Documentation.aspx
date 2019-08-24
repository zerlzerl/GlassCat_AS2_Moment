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
    Documentation
   
    
</asp:Content>
