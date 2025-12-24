<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="BoardDocs.aspx.vb" Inherits="SeymourWebsite.BoardDocs" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" lang="javascript">
        function OnBoardDocTreeListDoubleClick(s, e) { window.location.href = 'BoardDocLoad.aspx'; }
        function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div id="main" style="height:900px; margin-left:0px">
            <div class="header1">BOARD DOCUMENTS</div><br />
               <dx:ASPxLabel ID="Label1" CssClass="mainbodytext_0px" runat="server" Style="z-index: 102; left: 200px; position: absolute;
            top: 88px; width: 561px;" 
              Text="'Click' on a folder to expand or close the document list then 1) SELECT a document in the list and click the VIEW BUTTON or 2) DOUBLE-CLICK the document to open it."></dx:ASPxLabel>
          <a id="cmdActivityLog" runat="server" class="buttonimage" href="http://www.adobe.com" style="z-index: 103; left: 800px; position: absolute;
                        top: 88px; " target="_blank"><img style="height:31px; width:88px; border: none" id="imgActivityLog" runat="server" src="../Images/AdobeReaderLogo.bmp" alt="Adobe Reader" /></a>
            
             <dx:ASPxButton ID="btnView" runat="server" Height="30px" Style="z-index: 100; left: 88px;
                 position: absolute; top: 88px" TabIndex="3" Text="View Doc" Width="80px" Theme="Aqua" >
                 <HoverStyle BackColor="#FF9900">
                 </HoverStyle>
          </dx:ASPxButton>
          <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" 
              CssFilePath="~/css/TreeList/styles.css" 
              CssPostfix="BlackGlass" 
              Style="z-index: 102; left: 89px; position: absolute; top: 136px" Height="700px" 
              Width="800px" Theme="Aqua">
                 <Styles CssFilePath="~/css/TreeList/styles.css" CssPostfix="FFOffice2010Blue">
                 </Styles>
                 <Images ImageFolder="~/css/Treelist/">
                     <CollapsedButton Height="16px" Url="~/css/TreeList/ClosedBlueFolder.jpg"
                         Width="16px" />
                     <ExpandedButton Height="16px" Url="~/css/TreeList/OpenFolder.png"
                         Width="16px" />
                     <CustomizationWindowClose Height="13px" Width="13px" />
                 </Images>
                 <SettingsText LoadingPanelText="" />
                 <SettingsLoadingPanel Text="" />
                 <SettingsSelection Enabled="True" />
                 <SettingsPager>
                     <AllButton>
                         <Image Height="15px" Width="21px" />
                     </AllButton>
                     <FirstPageButton>
                         <Image Height="15px" Width="21px" />
                     </FirstPageButton>
                     <LastPageButton>
                         <Image Height="15px" Width="21px" />
                     </LastPageButton>
                     <NextPageButton>
                         <Image Height="15px" Width="16px" />
                     </NextPageButton>
                     <PrevPageButton>
                         <Image Height="15px" Width="16px" />
                     </PrevPageButton>
                 </SettingsPager>
                 <Settings ShowColumnHeaders="False" />
                 <SettingsBehavior AllowFocusedNode="True" ExpandCollapseAction="NodeClick" ProcessFocusedNodeChangedOnServer="True" ProcessSelectionChangedOnServer="True" />
                 <Border BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                 <ClientSideEvents NodeDblClick="OnBoardDocTreeListDoubleClick"></ClientSideEvents>
             </dx:ASPxTreeList>
          </div>
             <div>

                 <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true"
         PopupAnimationType="None" Height="120" Width="300"  PopupVerticalOffset="150">
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
