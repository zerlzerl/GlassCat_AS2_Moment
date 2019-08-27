<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="GlassCat_AS2_Moment.Pages.Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <%--<link type="text/css" rel="stylesheet" href="~/Resources/css/calendar.css" />--%>
    <meta name="author" content="Li Xuekai">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:SqlDataSource ID="eventSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString7 %>'
        ProviderName='<%$ ConnectionStrings:ConnectionString7.ProviderName %>' SelectCommand="SELECT * FROM [event]"></asp:SqlDataSource>

    <div class="breadcrumbs">
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="true" />
        <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathSeparator=" --> ">
        </asp:SiteMapPath>
    </div>

    <div class="jumbotron">
        <div class="row">
            <div class="col-md-8">
                <asp:Calendar ID="EventCalendar" runat="server" BackColor="White" BorderColor="#AFAFAF" BorderStyle="Solid" BorderWidth="2px"
                    CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="16pt" ForeColor="#003399"
                    OnDayRender="EventCalendar_DayRender" OnSelectionChanged="EventCalendar_SelectionChanged">

                    <DayHeaderStyle BorderColor="#AFAFAF" BorderStyle="Solid" BorderWidth="2px" BackColor="#99CCCC"
                        ForeColor="#336666" Height="30px" Font-Size="16pt"></DayHeaderStyle>

                    <DayStyle BorderColor="#AFAFAF" BorderStyle="Solid" BorderWidth="2px" Height="60px" Width="80px" />

                    <NextPrevStyle Font-Size="10pt" ForeColor="#CCCCFF"></NextPrevStyle>

                    <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99"></SelectedDayStyle>

                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>

                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="20pt" ForeColor="#CCCCFF" Height="25px"></TitleStyle>

                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White"></TodayDayStyle>

                    <WeekendDayStyle BackColor="#CCCCFF"></WeekendDayStyle>

                </asp:Calendar>
            </div>
            <div class="col-md-4">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">Check Your Schedule</h3>
                        <!-- /.box-tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="height: 385px; overflow: auto">
                        <div class="alert alert-info" role="alert">
                            <b><asp:Label ID="selectedEventDate" runat="server" Text="Today" />:&nbsp;</b><br />
                            <asp:Label ID="selectedEventDescription" runat="server" Text="No event." />
                        </div>
                        <hr />
                        <h4>Future Events:</h4>
                        <asp:Repeater runat="server" ID="futureEventList">
                            <ItemTemplate>
                                <div class="alert alert-success" role="alert">
                                    <b>
                                        <asp:Label runat="server" Text="<%# ((CustomerEvent)Container.DataItem).eventDatetime.ToShortDateString() %>" />:&nbsp;</b><br />
                                    <asp:Label runat="server" Text="<%# ((CustomerEvent)Container.DataItem).eventDescription %>" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>


                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <a target="_blank" class="btn btn-primary btn-block hideAdditionalBtn"
                href="/AdditionalPages/DisplayCode.aspx?filenames=~/Pages/Calendar.aspx;~/Pages/Calendar.aspx.cs">Calendar</a>
        </div>
    </div>
    <div id="bodyPaddingDiv"></div>
    
</asp:Content>
