<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BoardReportGridWindow.aspx.vb" Inherits="SeymourWebsite.BoardReportGridWindow" %>
<%@ Register Assembly="DevExpress.XtraReports.v19.1.Web.WebForms, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" 
        style="position:relative; top:10px; left: 9px;" Width="1100px" Height="775px" Theme="Aqua">
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
    </form>
</body>
</html>
