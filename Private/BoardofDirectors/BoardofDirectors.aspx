<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="BoardofDirectors.aspx.vb" Inherits="SeymourWebsite.BoardofDirectors" %>
<%@ Register Assembly="DevExpress.XtraReports.v19.1.Web.WebForms, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="main"  style="height:750px; margin-left:0px">
            <div class="header1">BOARD OF DIRECTORS</div><br />
         <dx:ASPxTextbox ID="txtMeetingFreq" CssClass="textbox_noborder" runat="server" 
                Style="z-index: 100; left: 400px; position: absolute;top: 108px;"  Width="400px" 
                ReadOnly="True"></dx:ASPxTextbox>
            <dx:ASPxTextbox ID="txtAssociation"  CssClass="textbox_noborder" runat="server"
                  ReadOnly="True" Style="z-index: 106; left: 400px; position: absolute; top: 67px;" Width="400px"></dx:ASPxTextbox>
             <dx:ASPxTextbox ID="txtMeetingTime"  CssClass="textbox_noborder" runat="server" 
                Style="z-index: 102; left: 400px;position: absolute; top: 130px" 
                Width="400px" ReadOnly="True"></dx:ASPxTextbox>:
              <dx:ASPxLabel ID="Label1"  CssClass="mainbodytext_0px" runat="server" Style="z-index: 103; left: 205px; position: absolute;
                 top: 108px; width: 190px;" Text="Board Meeting Frequency:"></dx:ASPxLabel>
             <dx:ASPxLabel ID="Label3"   CssClass="mainbodytext_0px" runat="server" Style="z-index: 104; left: 205px; position: absolute; top: 67px;" 
             Text="Association Name:" Width="176px"></dx:ASPxLabel>
              <dx:ASPxLabel ID="Label2"   CssClass="mainbodytext_0px" runat="server" Style="z-index: 105; left: 205px; position: absolute;top: 130px;"
             Text="Day and Time:" Width="176px"></dx:ASPxLabel>
       <dx:ASPxLabel ID="Label5"   CssClass="mainbodytext_0px" runat="server" Style="z-index: 105; left: 205px; width: 190px;
                 position: absolute; top: 86px" Text="Meeting Place:"></dx:ASPxLabel>
        <dx:ASPxTextbox ID="txtMeetingPlace" CssClass="textbox_noborder" runat="server" 
                 ReadOnly="True" Style="z-index: 102; left: 400px; position: absolute; top: 88px; height: 16px;" Width="400px"></dx:ASPxTextbox>
          <%--<dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" ReportSourceId="Charles_VS19_041220.XrtraRpt_Principals"></dx:ASPxWebDocumentViewer>--%>
        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" 
        style="position:relative; top:100px; left: 75px;" Width="800px" Height="500px" Theme="Aqua">
        <SettingsSplitter  SidePaneVisible="false" />
       
        <StylesReportViewer>
            <BookmarkSelectionBorder BorderColor="Gray" BorderStyle="Dashed" BorderWidth="3px"></BookmarkSelectionBorder>
            <Paddings Padding="10px"></Paddings>
        </StylesReportViewer>
            <StylesToolbar Alignment="Center">
        </StylesToolbar>
        <StylesSplitter>
            <Pane>
                <Paddings Padding="0px"></Paddings>
            </Pane>
        </StylesSplitter>
    </dx:ASPxDocumentViewer>
        </div>

          <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true" CloseOnEscape="true"
         PopupAnimationType="None" Height="120" Width="300" PopupVerticalOffset="150">
        <Border BorderColor="" BorderStyle="Solid" BorderWidth="0px" />
        <HeaderStyle BackColor="" >
      
            <BorderBottom BorderWidth="0px" BorderColor="#FFBABA" BorderStyle="Solid" />
            <Paddings PaddingBottom="6px" PaddingLeft="13px" PaddingRight="8px" PaddingTop="6px" />
        </HeaderStyle>
        <ContentStyle BackColor="white">
            <Paddings PaddingBottom="10px" PaddingLeft="13px" PaddingRight="13px" PaddingTop="9px" />
        </ContentStyle>
        <CloseButtonStyle>
            <Paddings Padding="0px" PaddingLeft="3px" />
        </CloseButtonStyle>
    </dx:ASPxPopupControl>
    <dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="mContent" runat="server"  Visible="false"/>   
</asp:Content>
