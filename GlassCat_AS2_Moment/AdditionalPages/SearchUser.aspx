<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchUser.aspx.cs" Inherits="GlassCat_AS2_Moment.AdditionalPages.SearchUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <div class="col-xs-4 form-group">
            <label for="userIdInput">User ID: &nbsp;</label>
            <asp:TextBox ID="userIdInput" runat="server" CssClass="form-control" placeholder="User ID" />
        </div>
        <div class="col-xs-4 form-group">
            <label for="usernameInput">Username: &nbsp;</label>
            <asp:TextBox ID="usernameInput" runat="server" CssClass="form-control" placeholder="Username" />
        </div>
        <div class="col-xs-4 form-group">
            <label for="emailInput">Email: &nbsp;</label>
            <asp:TextBox ID="emailInput" runat="server" CssClass="form-control" placeholder="Email" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4 form-group">            
            <asp:Button ID="searchUsers" runat="server" Text="Search" CssClass="btn btn-primary btn-block btn-flat" OnClick="searchUsers_Click"/>
        </div>
    </div>


    <%--<div class="row">
        <asp:GridView ID="userSearchGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username"></asp:BoundField>
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password"></asp:BoundField>
                <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender"></asp:BoundField>
                <asp:BoundField DataField="profession" HeaderText="profession" SortExpression="profession"></asp:BoundField>
                <asp:BoundField DataField="interests" HeaderText="interests" SortExpression="interests"></asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                <asp:ImageField DataImageUrlField="usericon" ControlStyle-CssClass="img-rounded img-responsive" HeaderText="usericon" SortExpression="usericon"></asp:ImageField>
                <asp:BoundField DataField="motto" HeaderText="motto" SortExpression="motto"></asp:BoundField>
                <asp:BoundField DataField="age" HeaderText="age" SortExpression="age"></asp:BoundField>
                <asp:CheckBoxField DataField="own_cats" HeaderText="own_cats" SortExpression="own_cats"></asp:CheckBoxField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="searchUserDataSource" ConnectionString='<%$ ConnectionStrings:ConnectionString4 %>' ProviderName='<%$ ConnectionStrings:ConnectionString4.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    </div>--%>
</asp:Content>
