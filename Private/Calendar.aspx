<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Calendar.aspx.vb" Inherits="SeymourWebsite.Calendar" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v19.1.Core, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div id="main" style="height:1000px">
           <div class="header1">CALENDAR</div><br />
                    <dx:ASPxLabel ID="Label1"  runat="server"  CssClass="mainbodytext_0px" Style="z-index: 0; left: 200px; position: absolute;
                 top: 71px" Text="Group"></dx:ASPxLabel>
             <dx:ASPxLabel ID="Label2"  runat="server"  CssClass="mainbodytext_0px" Style="z-index: 0; left: 503px; position: absolute;
                 top: 71px; height: 14px;" Text="Facility"></dx:ASPxLabel>
                <dx:ASPxComboBox ID="ddlGroup" runat="server"  CssClass="mainbodytext_0px" style="z-index:0; position:absolute; left: 249px; top: 67px; z-index: 100;" AutoPostBack="True" Width="192px" ValueType="System.String" Theme="Aqua">
                </dx:ASPxComboBox>

     <dx:ASPxComboBox  ID="ddlFacility" CssClass="mainbodytext_0px" runat="server" style="z-index:0; position:absolute; left: 562px; top: 67px; z-index: 101;" AutoPostBack="True" Width="192px" ValueType="System.String" Theme="Aqua">
            </dx:ASPxComboBox>
            <div>
       <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" Style="z-index: 100; left: 0px;
            position: absolute; left:100px; top:110px; width:750px;" Font-Names="Verdana" 
                Font-Size="8pt" Font-Underline="False" ActiveViewType="Month" Theme="Aqua" >
            
            <OptionsCustomization AllowAppointmentCreate="None" AllowAppointmentDelete="None"
                AllowAppointmentDrag="None" AllowAppointmentDragBetweenResources="None" 
                    AllowAppointmentEdit="None" AllowAppointmentMultiSelect="true" />
            <Views>
                <DayView ShowDayHeaders="False">
                    <VisibleTime End="23:59:00" Start="08:00:00" />
                   
<TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

                    <AppointmentDisplayOptions AppointmentAutoHeight="True" />
                </DayView>
                <WorkWeekView Enabled="False">
                   
                    <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                   
                </WorkWeekView>

<FullWeekView ViewSelectorItemAdaptivePriority="7"><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</FullWeekView>

                   <AgendaView Enabled="False">
                   
                </AgendaView>
                <WeekView Enabled="False">
                </WeekView>
                <MonthView CompressWeekend="False" WeekCount="4">
                    <MonthViewStyles>
                        <Appointment Font-Names="Verdana" Font-Size="8pt">
                        </Appointment>
                    </MonthViewStyles>
                     <AppointmentDisplayOptions EndTimeVisibility="Never" StartTimeVisibility="Never" AppointmentAutoHeight="false"  />
                   <CellAutoHeightOptions Mode="None" />
                </MonthView>
                <TimelineView Enabled="False">
                </TimelineView>


            </Views>
            
                  <Styles>
                      <DateHeader Font-Bold="False">
                      </DateHeader>
                  </Styles>
                  <Border BorderColor="Black" BorderStyle="Solid" />
        </dxwschs:ASPxScheduler>
                     
                     </div>
    </div>
</asp:Content>
