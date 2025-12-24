<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="MemberDirectory.aspx.vb" Inherits="SeymourWebsite.MemberDirectory" %>
<%@ Register Assembly="DevExpress.XtraReports.v19.1.Web.WebForms, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript" lang="javascript">
         function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="main" style="height:800px; margin-left:0px">
            <div class="header1">MEMBER DIRECTORY</div><br />
            <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" 
        style="position:relative; top:15px; left: 75px;" Width="800px" Height="650px" Theme="Aqua">
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
  
              <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true"
         PopupAnimationType="None" Height="120" Width="300" Theme="Aqua"  PopupVerticalOffset="150">
        <Border BorderColor="" BorderStyle="Solid" BorderWidth="0px" />
        <HeaderStyle BackColor="" Font-Bold="True" ForeColor="#3C3C3C" Font-Size="9pt"  >
            
            <BorderBottom BorderWidth="0px" BorderColor="#FFBABA" BorderStyle="Solid" />
            <Paddings PaddingBottom="6px" PaddingLeft="13px" PaddingRight="8px" PaddingTop="6px" />
        </HeaderStyle>
        <ContentStyle BackColor="white" ForeColor="#D8000C" Font-Bold="false">
        
            <Paddings PaddingBottom="10px" PaddingLeft="13px" PaddingRight="13px" PaddingTop="9px" />
        </ContentStyle>
        <CloseButtonStyle>
            <Paddings Padding="0px" PaddingLeft="3px" />
        </CloseButtonStyle>
        <ClientSideEvents CloseUp="messagepopupclosed" />
    </dx:ASPxPopupControl>
    <dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="mContent" runat="server"  Visible="false"/>
    <dx:ASPxCallback ID="ASPxCallbackMessage" runat="server" ClientInstanceName="CallbackMessage" OnCallback="ASPxCallbackMessage_Callback">
    </dx:ASPxCallback>

    </div>
</asp:Content>
