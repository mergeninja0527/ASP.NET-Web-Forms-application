<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="RequestStatus.aspx.vb" Inherits="SeymourWebsite.RequestStatus" %>
<%@ Register Assembly="DevExpress.XtraReports.v19.1.Web.WebForms, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div id="main" style="height:600px">
            <div class="header1">STATUS OF MY REQUEST</div><br />
         
                   
                <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" 
        style="position:relative; top:15px; left: 75px;" Width="800px" Height="500px" Theme="Aqua">
        <SettingsSplitter SidePaneVisible="false" />
        
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
</asp:Content>
