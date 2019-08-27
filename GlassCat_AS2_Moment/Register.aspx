<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <meta name="author" content="Li Xuekai">
    <style type="text/css">
        .rbl input[type="radio"] {
            margin-left: 10px;
            margin-right: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:SqlDataSource ID="RegisterSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
        ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>

    <div class="row">
        <div class="col-md-4 col-md-push-4">
            <div class="register-box">
                <div class="register-logo" style="margin-bottom: 10px;">
                    <a href="/Default.aspx"><b>Glass</b>Cat</a>
                </div>

                <div class="register-box-body">
                    <p class="login-box-msg">Register a new membership</p>

                    <div class="form-group has-feedback">
                        <label for="registerUsername">Enter username: &nbsp;</label>
                        <asp:TextBox ID="registerUsername" runat="server" CssClass="form-control" placeholder="Username" />
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        <!-- username required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerUsername"
                            Display="Dynamic" ToolTip="Required" ErrorMessage="Error: Username cannot be empty" />
                        <!-- username duplicated validator -->
                        <asp:CustomValidator ID="registerUsernameDuplicateValidator" runat="server" OnServerValidate="registerUsernameValidate"
                            Display="Dynamic" CssClass="label label-info" />
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerEmail">Enter email: &nbsp;</label>
                        <asp:TextBox ID="registerEmail" runat="server" CssClass="form-control" placeholder="Email" />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        <!-- email required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerEmail"
                            Display="Dynamic" ErrorMessage="Error: Email cannot be empty" />
                        <!-- email regular expression validator -->
                        <asp:RegularExpressionValidator runat="server" CssClass="label label-warning" ControlToValidate="registerEmail"
                            Display="Dynamic" ErrorMessage="Error: Invalid email address" ValidationExpression="\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}" />
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerPassword">Enter password: &nbsp;</label>
                        <asp:TextBox ID="registerPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" />
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        <!-- password required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerPassword"
                            Display="Dynamic" ErrorMessage="Error: Password cannot be empty" />
                        <!-- password valid regular expression validator -->
                        <asp:RegularExpressionValidator runat="server" CssClass="label label-warning" ControlToValidate="registerPassword" Display="Dynamic"
                            ErrorMessage="Error: Invalid password. A password should contain 8-20 characters, including a mixture of upper and lower case letters, 
                            at least 1 digit and at least an arbitrary set of special characters."
                            ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!]).{8,20})" />
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerPasswordConfirmation">Password confirm: &nbsp;</label>
                        <asp:TextBox ID="registerPasswordConfirmation" runat="server" TextMode="Password" CssClass="form-control" placeholder="Retype Password" />
                        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                        <!-- password confirmation required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerPasswordConfirmation"
                            Display="Dynamic" ErrorMessage="Error: Password confirmation cannot be empty" />
                        <!-- password and confirmation compare validator -->
                        <asp:CompareValidator runat="server" CssClass="label label-warning" ControlToValidate="registerPasswordConfirmation"
                            Display="Dynamic" ControlToCompare="registerPassword" ErrorMessage="Error: password and comfirmation must be the same" />
                    </div>

                    <div class="form-group has-feedback">
                        <label for="genderRadioButtonList">Choose your gender: &nbsp;</label>
                        <asp:RadioButtonList ID="genderRadioButtonList" runat="server" RepeatLayout="flow" RepeatDirection="Horizontal" CssClass="btn-group rbl">
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                        </asp:RadioButtonList>
                        <!-- gender required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="genderRadioButtonList"
                            Display="Dynamic" ErrorMessage="Error: Gender cannot be empty" />
                    </div>

                    <div class="form-group has-feedback">
                        <label for="genderRadioButtonList">Choose your profession: &nbsp;</label>
                        <asp:DropDownList ID="professionDropDownList" runat="server">
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Teacher</asp:ListItem>
                            <asp:ListItem>Driver</asp:ListItem>
                            <asp:ListItem>Worker</asp:ListItem>
                            <asp:ListItem>Programmer</asp:ListItem>
                            <asp:ListItem>Scientist</asp:ListItem>
                            <asp:ListItem>Musician</asp:ListItem>
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerAge">Enter your age: &nbsp;</label>
                        <asp:TextBox ID="registerAge" runat="server" CssClass="form-control" placeholder="Your Age" />
                        <!-- age required validator -->
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerAge"
                            Display="Dynamic" ErrorMessage="Error: Age cannot be empty" />
                        <asp:RangeValidator runat="server" CssClass="label label-warning" ControlToValidate="registerAge" Type="Integer"
                            Display="Dynamic" ErrorMessage="Error: Valid age is  0 to 100" MinimumValue="0" MaximumValue="100"></asp:RangeValidator>
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerFavoriteCatBreeds">Your favorite cat breeds: &nbsp;</label>
                        <asp:ListBox ID="registerFavoriteCatBreeds" runat="server" SelectionMode="Multiple" Rows="6">
                            <asp:ListItem>Chinese Li Hua</asp:ListItem>
                            <asp:ListItem>Ragdoll</asp:ListItem>
                            <asp:ListItem>Siamese Cat</asp:ListItem>
                            <asp:ListItem>Scottish Fold</asp:ListItem>
                            <asp:ListItem>British Shorthair</asp:ListItem>
                            <asp:ListItem>Persian Cat </asp:ListItem>
                            <asp:ListItem>Russian Blue Cat</asp:ListItem>
                            <asp:ListItem>American Shorthair</asp:ListItem>
                            <asp:ListItem>Exotic shorthair</asp:ListItem>
                            <asp:ListItem>Norwegian Forest Cat</asp:ListItem>
                            <asp:ListItem>Mumbai Cat</asp:ListItem>
                            <asp:ListItem>Maine Coon</asp:ListItem>
                        </asp:ListBox>
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerMotto">Your motto: &nbsp;</label>
                        <asp:TextBox ID="registerMotto" runat="server" CssClass="form-control" placeholder="Your motto" />
                        <span class="glyphicon glyphicon-heart form-control-feedback"></span>
                        <asp:RequiredFieldValidator runat="server" CssClass="label label-warning" ControlToValidate="registerMotto"
                            Display="Dynamic" ErrorMessage="Error: Motto cannot be empty" />
                    </div>

                    <div class="form-group has-feedback">
                        <label for="ownCatCheckbox">Do you have a cat? &nbsp;</label>
                        <div class="checkbox icheck" style="margin-left: 20px;">
                            <label>
                                <asp:CheckBox ID="ownCatCheckbox" runat="server" />
                                <label for="ownCatCheckbox">I do have a cat. &nbsp;</label>
                            </label>
                        </div>
                    </div>

                    <div class="form-group has-feedback">
                        <label for="registerUserIconUpload">Your portrial: &nbsp;</label>
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:FileUpload ID="registerUserIconUpload" runat="server" onchange="showUploadBtn()"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Button ID="uploadPortrialBtn" runat="server" Text="Upload" OnClick="uploadPortrialBtn_Click"
                                    CssClass="btn btn-success btn-block btn-flat" style="display: none;"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group has-feedback">
                        <asp:Image ID="registerPortraitPreview" runat="server" AlternateText="user image" CssClass="img-rounded img-responsive" Visible="false" />
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <asp:Button ID="registerBtn" Text="Register" runat="server" OnClick="registerBtn_Click" Class="btn btn-primary btn-block btn-flat" />
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
    <div class="row">
        <div class="col-md-2 col-md-offset-7">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn" href="/AdditionalPages/AddRecordsCode.aspx">Add Record</a>
        </div>
        <div class="col-md-3">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn" href="/AdditionalPages/UserGridView.aspx">Click here to see all the users</a>
        </div>
    </div>
    <script type="text/javascript">        
        function showUploadBtn() {
            $('#ContentPlaceHolder_uploadPortrialBtn').show();
        }
    </script>
</asp:Content>
