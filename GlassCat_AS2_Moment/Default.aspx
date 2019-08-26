<%@ Page Title="Index" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"  Inherits="GlassCat_AS2_Moment.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DefaultMomentSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [moment]"></asp:SqlDataSource>
    <div class="jumbotron">

        <div style="text-align: center; margin-bottom: 40px;">
            <h2>GlassCat</h2>
            <h3 style="color:coral">
                Cats are like glass, deserving special care.
            </h3>
        </div>
        

        <p>
            This website is designed for those who love cats no matter whether they own one or not. 
            They can share with other users their thoughts as well as photos of lovely cats here.
        </p>

        <div class="row">
            <!-- Personal center -->
            <div class="col-md-4">

                <!-- Widget: user widget style 1 -->
                <div class="box box-widget widget-user">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header bg-aqua-active">
                        <h3 class="widget-user-username">
                            <asp:Label ID="defaultUsername" runat="server" Text="Label"></asp:Label>
                        </h3>
                        <h5 class="widget-user-desc"><asp:Label ID="defaultUserProfession" runat="server" Text="Label"></asp:Label></h5>
                    </div>
                    <div class="widget-user-image">
                        <asp:Image CssClass="img-circle" ID="defaultUserPortrait" runat="server" style="max-height:90px"/>
                        <%--<img class="img-circle" src="/Resources/img/user1-128x128.jpg" alt="User Avatar">--%>
                    </div>
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="description-block">
                                    <span class="description-text"><asp:Label ID="defaultUserMotto" runat="server" Text="Label"></asp:Label></span>
                                </div>
                            </div>

                            <%--<div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">12</h5>
                                    <span class="description-text">CATS</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">130</h5>
                                    <span class="description-text">FOLLOWERS</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4">
                                <div class="description-block">
                                    <h5 class="description-header">35</h5>
                                    <span class="description-text">LIKES</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->--%>


                        </div>
                        <!-- /.row -->
                    </div>
                </div>
                <!-- /.widget-user -->
            </div>

            <!-- Cards -->
            <div class="col-md-8">

                <div class="row">
                    <div class="col-md-12">


                        <!-- to be iterated -->
                        <!-- Box Comment -->
                        <div class="box box-widget">
                            <div class="box-header with-border">
                                <div class="user-block">
                                    <%--<img class="img-circle" src="/Resources/img/user1-128x128.jpg" alt="User Image">--%>
                                    <asp:Image ID="defaultMomentUsericon" CssClass="img-circle" runat="server" />
                                    <span class="username"><a href="#">
                                        <asp:Label ID="defaultMomentUsername" runat="server" Text="Label"></asp:Label>
                                    </a></span>
                                    <span class="description">
                                        <asp:Label ID="defaultMomentDatetime" runat="server" Text="Label"></asp:Label>
                                    </span>
                                </div>
                                <!-- /.user-block -->
                                <div class="box-tools" style="position: absolute; right: 10px; top: 5px;">
                                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Like">
                                        <i class="fa fa-heart-o"></i>
                                    </button>
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <%--<img class="img-responsive pad" src="/Resources/img/photo2.png" alt="Photo">--%>
                                <asp:Image ID="defaultMomentPhoto" CssClass="img-responsive pad" runat="server" />
                                <p><asp:Label style="margin-left:10px;" ID="defaultMomentMessage" runat="server" Text="Label"></asp:Label></p>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                    </div>
                </div>

            </div>
            <!-- /.col -->

        </div>
        <!-- /.row -->

        
    </div>
    
    <div style="text-align: center; margin-bottom:20px">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="Timer1" Interval="2000" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:AdRotator ID="AdRotator1" runat="server" Target="_blank" AdvertisementFile="~/AdFile1.xml" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    




    <div class="row">
        <div class="col-md-3 col-md-offset-3">
            QUICK LINK
            <a href="http://users.monash.edu.au/~sgrose/msh/disclaimer.html">
                <p>Monash course disclaimer</p>
            </a>
        </div>
        <div class="col-md-3 col-md-offset-1">
            CONTACT US
            <a href="http://users.monash.edu.au/~sgrose/msh/disclaimer.html">
                <p>ysun0069@student.monash.edu</p>
            </a>
        </div>
    </div>
</asp:Content>
