<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserGridView.aspx.cs" Inherits="GlassCat_AS2_Moment.AdditionalPages.UserGridView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="userGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="GlassCat_AS2" 
                    CssClass="table table-bordered table-hover" OnRowCommand="DisplayData">
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
                        <asp:HyperLinkField Target="_blank" HeaderText="user_icon_url" DataNavigateUrlFields="usericon" DataNavigateUrlFormatString="{0}" DataTextField="username" />
                        <asp:ButtonField ButtonType="Button" Text="Display Details" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="GlassCat_AS2" ConnectionString='<%$ ConnectionStrings:ConnectionString3 %>' ProviderName='<%$ ConnectionStrings:ConnectionString3.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="TitleLabel" runat="server"></asp:Label>
                    </h3>
                </div>
                <div class="panel-body">
                    <asp:Label ID="DetailLabel" runat="server"></asp:Label>
                </div>
            </div>
            
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-8">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn" href="/AdditionalPages/DisplayRecordsCode.aspx">Display Record</a>
        </div>
        <div class="col-md-2">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn" href="/AdditionalPages/SearchUser.aspx">Search User</a>
        </div>
    </div>
</asp:Content>
