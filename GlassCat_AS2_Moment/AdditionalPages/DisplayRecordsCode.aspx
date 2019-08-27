<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayRecordsCode.aspx.cs" Inherits="GlassCat_AS2_Moment.AdditionalPages.DisplayRecordsCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <meta name="author" content="Li Xuekai">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="jumbotron">
        <asp:DataList ID="DisplayRecordsCodeList" runat="server" Font-Names="Arial">
            <HeaderStyle Font-Bold="true" />
            <HeaderTemplate>Display Records Code List</HeaderTemplate>
            <AlternatingItemStyle BackColor="LightBlue" />
            <ItemTemplate>
                <a target="_blank" href="/AdditionalPages/DisplayCode.aspx?filenames=<%# Container.DataItem %>">
                    <%# Container.DataItem %>
                </a>                
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div id="bodyPaddingDiv"></div>
    
</asp:Content>
