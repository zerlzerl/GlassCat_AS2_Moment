﻿<%@ Page Title="Site map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
  
    <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li class="active">Site map</li>
    </ol>
    <h2>Site map for GlassCat</h2>
    <%--<form runat="server">--%>

        <p>Method 1: without extra xml files</p>
        <asp:TreeView ID="TreeView1" runat="server">
            <Nodes>    
                <asp:TreeNode Text="GlassCat">
                    <asp:TreeNode Text="Home" NavigateUrl="/" Target="_blank"/>    
                    <asp:TreeNode Text="Register" NavigateUrl="/Pages/Register.aspx" Target="_blank"/>  
                    <asp:TreeNode Text="About us" NavigateUrl="/Pages/About.aspx" Target="_blank">    
                        <asp:TreeNode Text="Our History" NavigateUrl="/Pages/History.aspx" Target="_blank" />    
                        <asp:TreeNode Text="FAQ" NavigateUrl="/Pages/FAQ.aspx" Target="_blank" />   
                    </asp:TreeNode>   
                    <asp:TreeNode Text="Site map" NavigateUrl="/Pages/SiteMap.aspx" Target="_blank"/>    
                    <asp:TreeNode Text="Documentation" NavigateUrl="/Pages/Documentation.aspx" Target="_blank"/>  
                    <asp:TreeNode Text="Email" NavigateUrl="/Pages/Email.aspx" Target="_blank"/>    
                    <asp:TreeNode Text="Calendar" NavigateUrl="/Pages/Calendar.aspx" Target="_blank"/>
                    <asp:TreeNode Text="Login" NavigateUrl="/Pages/Login.aspx" Target="_blank"/>  
                </asp:TreeNode>
            </Nodes> 
        </asp:TreeView>

        <br />
        <p>Method 2: with Web.sitemap as the datasource</p>
        <asp:TreeView id="WebsiteTreeView" 
        DataSourceID="WebsiteXmlDataSource"
        runat="server">
         
            <DataBindings>
                <asp:TreeNodeBinding DataMember="Book" TextField="Title"/>
                <asp:TreeNodeBinding DataMember="Chapter" TextField="Heading"/>
                <asp:TreeNodeBinding DataMember="Section" TextField="Heading"/>
            </DataBindings>
         
        </asp:TreeView>

        <asp:XmlDataSource id="WebsiteXmlDataSource"  
        DataFile="~/Web.sitemap"
        runat="server">
        </asp:XmlDataSource>


    <%--</form>--%>
    
         
</asp:Content>
