﻿<%@ Page Title="About us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.About" %>

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


        <h2>About us, GlassCat</h2>
        <p>
            Some people want to raise cats but in fail.
        <br />
            Some others want to show off their cats but find no place.
        <br />
            Both of them have deep affections for cats, and both you and I belong to them.
        <br />
            This is just the very reason why we meet here.
        <br />
            This is just the very palce where we can pour out all the passions.
        <br />
            Nice to meet you here.
        <br />
            Hope you have a good time.
        </p>

        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn"
                    href="/AdditionalPages/DisplayCode.aspx?filenames=~/Pages/About.aspx;~/Pages/About.aspx.cs">About us</a>
            </div>
        </div>
    </div>
    <div id="bodyPaddingDiv"></div>
</asp:Content>
