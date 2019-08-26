<%@ Page Title="Email" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.Email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:SqlDataSource ID="userEmailSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString6 %>' 
        ProviderName='<%$ ConnectionStrings:ConnectionString6.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    <div class="row">
        <div style="background-color: #f0f0f0; padding: 10px; font-size: 16px;">
            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="true" />
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathSeparator=" --> ">
            </asp:SiteMapPath>
        </div>
    </div>

    <div class="row" style="margin-top: 20px;">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Compose New Message</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="form-group">
                    <asp:Label Text="To: " runat="server" CssClass="control-label" />
                    <asp:GridView ID="UserContactGridView" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered table-hover" DataSourceID="userContactDataSource">
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username"></asp:BoundField>
                            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender"></asp:BoundField>
                            <asp:BoundField DataField="profession" HeaderText="profession" SortExpression="profession"></asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="EmailCheckbox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="userContactDataSource" ConnectionString='<%$ ConnectionStrings:ConnectionString5 %>'
                        ProviderName='<%$ ConnectionStrings:ConnectionString5.ProviderName %>'
                        SelectCommand="SELECT [email], [username], [gender], [profession] FROM [user]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="SenderNameInput" CssClass="form-control" runat="server" placeholder="Sender Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox ID="SubjectInput" CssClass="form-control" runat="server" placeholder="Subject:" />
                </div>
                <div class="form-group">
                    <asp:TextBox ID="ComposeTextbox" class="form-control" runat="server" TextMode="MultiLine" Rows="15"></asp:TextBox>
                </div>
                <div class="form-group">
                    <div class="btn btn-default btn-file">
                        <i class="fa fa-paperclip"></i>Attachment
                        <input type="file" name="attachment">
                    </div>
                    
                    <div class="pull-right">
                        <asp:Button ID="SendButton" runat="server" Text="Send Mail" CssClass="btn btn-block btn-primary" OnClick="SendButton_Click"></asp:Button>
                    </div>
                    <p class="help-block">Max. 10MB</p>
                </div>
                <asp:Label ID="successLabel" runat="server" CssClass="label label-success" Text="Mail Successfully Sent" Visible="false"></asp:Label>
                <asp:Label ID="failLabel" runat="server" CssClass="label label-warning" Text="Mail Send Fail" Visible="false"></asp:Label>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /. box -->
    </div>
</asp:Content>
