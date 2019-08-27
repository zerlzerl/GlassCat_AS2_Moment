<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchUser.aspx.cs" Inherits="GlassCat_AS2_Moment.AdditionalPages.SearchUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="jumbotron">
        <div class="row">
        <div class="col-xs-2 form-group">
            <label for="userIdInput" class="control-label h4">User ID: &nbsp;</label>
        </div>
        <div class="col-xs-3 form-group">
            <asp:TextBox ID="userIdInput" runat="server" CssClass="form-control" placeholder="User ID" />
        </div>
        <div class="col-xs-3 form-group">            
            <asp:Button ID="SearchIDBtn" runat="server" Text="Search via ID" CssClass="btn btn-primary btn-block btn-flat" OnClick="searchUsers_Click"/>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-2 form-group">
            <label for="usernameInput" class="control-label h4">Username: &nbsp;</label>
        </div>
        <div class="col-xs-3 form-group">
            <asp:TextBox ID="usernameInput" runat="server" CssClass="form-control" placeholder="Username" />
        </div>
        <div class="col-xs-3 form-group">            
            <asp:Button ID="searchUsernameBtn" runat="server" Text="Search via username" CssClass="btn btn-primary btn-block btn-flat" OnClick="searchUsers_Click"/>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-2 form-group">
            <label for="emailInput" class="control-label h4">Email: &nbsp;</label>
        </div>
        <div class="col-xs-3 form-group">
            <asp:TextBox ID="emailInput" runat="server" CssClass="form-control" placeholder="Email" />
        </div>
        <div class="col-xs-3 form-group">            
            <asp:Button ID="searchEmailBtn" runat="server" Text="Search via email" CssClass="btn btn-primary btn-block btn-flat" OnClick="searchUsers_Click"/>
        </div>
    </div>
    <asp:SqlDataSource runat="server" ID="searchUserDataSource" ConnectionString='<%$ ConnectionStrings:ConnectionString4 %>' 
        ProviderName='<%$ ConnectionStrings:ConnectionString4.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    
    
    <asp:ListView ID="searchUserListView" runat="server">
        <ItemTemplate>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">User ID: <%# Eval("ID") %></h3>
                    </div>
                    <div class="panel-body">
                        <div class="row" style="margin-bottom:10px;">
                            <div class="col-md-3">
                                Username: <br /><b><%# Eval("username") %></b><br />
                            </div>
                            <div class="col-md-3">
                                Email: <br /><b><%# Eval("email") %></b>
                            </div>
                            <div class="col-md-3">
                                Password: <br /><b><%# Eval("password") %></b>
                            </div>
                            <div class="col-md-3">
                                Gender: <br /><b><%# Eval("gender") %></b>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom:10px;">
                            <div class="col-md-3">
                                Profession: <br /><b><%# Eval("profession") %></b>
                            </div>                            
                            <div class="col-md-3">
                                Own a cat? <br /><b><%# ((Eval("own_cats").ToString() == "True") ? "Yes" : "No") %></b>
                            </div>
                            <div class="col-md-6">
                                Favorite Cat Breeds: <br /><b><%# Eval("interests") %></b>
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                User Portrial: <br /><img src="<%# Eval("usericon").ToString().Substring(1) %>" class="img-rounded img-responsive" />
                            </div>
                            <div class="col-md-3">
                                Age: <br /><b><%# string.IsNullOrEmpty(Eval("age").ToString()) ? "Not set" : Eval("age") %></b>
                            </div>
                            <div class="col-md-6">
                                Motto: <br /><b><%# Eval("motto") %></b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>

    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn" 
                href="/AdditionalPages/DisplayCode.aspx?filenames=~/AdditionalPages/SearchUser.aspx;~/AdditionalPages/SearchUser.aspx.cs">Search Records</a>
        </div>        
    </div>
    </div>
    
</asp:Content>
