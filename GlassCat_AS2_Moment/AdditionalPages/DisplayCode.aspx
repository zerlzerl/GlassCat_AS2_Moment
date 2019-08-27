<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayCode.aspx.cs" Inherits="GlassCat_AS2_Moment.AdditionalPages.DisplayCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:Repeater ID="CodesReqeater" runat="server">
        <ItemTemplate>
            <div class="panel panel-default" style="width: 100%; margin-top:20px">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="FileName" runat="server" Text="<%# ((CodeObject)Container.DataItem).filename %>" />
                    </h3>
                </div>
                <div class="panel-body">
                    <asp:Panel ID="CodePanel" runat="server">
                        <pre>
                            <asp:Label ID="Code" runat="server" Text="<%# ((CodeObject)Container.DataItem).code %>" />
                        </pre>
                    </asp:Panel>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
        

</asp:Content>
