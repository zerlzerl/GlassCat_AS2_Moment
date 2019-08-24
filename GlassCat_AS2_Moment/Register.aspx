<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-push-4">
            <div class="register-box">
                <div class="register-logo">
                    <a href="/Default.aspx"><b>Glass</b>Cat</a>
                </div>

                <div class="register-box-body">
                    <p class="login-box-msg">Register a new membership</p>

                    <div class="form-group has-feedback">
                        <asp:TextBox ID="registerUsername" runat="server" CssClass="form-control" placeholder="Username" />
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        <!-- username required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerUsername"
                            ErrorMessage="Error: Username cannot be empty" />
                    </div>

                    <div class="form-group has-feedback">
                        <asp:TextBox ID="registerEmail" runat="server" CssClass="form-control" placeholder="Email" />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        <!-- email required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerEmail"
                            ErrorMessage="Error: Email cannot be empty" />
                        <asp:RegularExpressionValidator runat="server" CssClass="label label-warning" ControlToValidate="registerEmail" 
                            ErrorMessage="Error: Invalid email address" ValidationExpression="\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}"/>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Retype password">
                        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
                        </div>
                        <!-- /.col -->
                    </div>
                    <hr />
                    <a href="/Login.aspx" class="text-center">I already have a membership</a>
                </div>
                <!-- /.form-box -->
            </div>
            <!-- /.register-box -->
        </div>
    </div>

</asp:Content>
