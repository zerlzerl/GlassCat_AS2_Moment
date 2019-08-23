<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <asp:SqlDataSource ID="LoginSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>

    <div class="row">
        <div class="col-md-4 col-md-push-4">
            <div class="login-box">
                <div class="login-logo">
                    <a href="../../index2.html"><b>Our</b>&nbsp;Moment</a>
                </div>
                <!-- /.login-logo -->
                <div class="login-box-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <form id="LoginForm" runat="server">
                        <!-- username field -->
                        <div class="form-group has-feedback">
                            <asp:TextBox ID="loginUsername" runat="server" CssClass="form-control" placeholder="Username" />
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>     
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="loginUsername" ErrorMessage="Error: Username cannot be empty" />
                        </div>
                        <!-- password field -->
                        <div class="form-group has-feedback">
                            <asp:TextBox ID="loginPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" />
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="loginPassword" ErrorMessage="Error: Password cannot be empty" />
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Button ID="loginBtn" Text="Login" runat="server" OnClick="ValidateUser" Class="btn btn-primary btn-block" />

                            </div>
                        </div>
                        
                    </form>



                </div>
                <!-- /.login-box-body -->
            </div>
            <!-- /.login-box -->
        </div>
    </div>
</asp:Content>
