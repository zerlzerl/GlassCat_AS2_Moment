<%@ Page Title="Index" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GlassCat_AS2_Moment.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="jumbotron">
        <div style="text-align:center; margin-bottom:40px;">
            <h2>Moment</h2>
        </div>
            <div class="col-md-6 col-md-offset-3">
                <!-- Box Comment -->
                <div class="box box-widget">
                    <div class="box-header with-border">
                        <div class="user-block">
                            <img class="img-circle" src="/Resources/img/user1-128x128.jpg" alt="User Image">
                            <span class="username"><a href="#">Jonathan Burke Jr.</a></span>
                            <span class="description">Shared publicly - 7:30 PM Today</span>
                        </div>
                        <!-- /.user-block -->
                        <div class="box-tools">
                            <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                                <i class="fa fa-circle-o"></i>
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
                        <img class="img-responsive pad" src="/Resources/img/photo2.png" alt="Photo">

                        <p>I took this photo this morning. What do you guys think?</p>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->

          </div>
          <!-- /.row -->

        <form id="form1" runat="server">
            <div style="text-align:center;">  
                <asp:ScriptManager ID="ScriptManager1" runat="server" />  
                <asp:Timer ID="Timer1" Interval="2000" runat="server" />  
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                    <Triggers>  
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />  
                    </Triggers>  
                    <ContentTemplate>  
                        <asp:AdRotator ID="AdRotator1" runat="server" Target="_self" AdvertisementFile="~/AdFile1.xml"/> 
                    </ContentTemplate>  
                </asp:UpdatePanel>  
            </div> 
        </form>
    </div>
</asp:Content>
