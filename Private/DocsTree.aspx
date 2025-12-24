<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="DocsTree.aspx.vb" Inherits="SeymourWebsite.DocsTree" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OnTreeListDoubleClick(s, e) { window.location.href = 'DocLoad.aspx'; }
        function OnSearchClicked(s, e) { CallbackPanel1.PerformCallback('Search'); }
        function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main" style="height:850px; margin-left:0px">
              <div class="header1">DOCUMENTS (By Subject Folder)</div><br />
              <dx:ASPxButton ID="btnOpenDoc" runat="server"  style="z-index: 1; left: 392px; top: 139px; position: absolute; height: 24px; width: 182px" 
                 Text="Open Selected Document" AutoPostBack="true" Theme="Aqua">
                  <HoverStyle BackColor="#FF9900">
                  </HoverStyle>
             </dx:ASPxButton>
            <dx:ASPxLabel ID="Label3" runat="server" CssClass="mainbodytext_0px" Style="z-index: 101; left: 103px; position: absolute;
                        top: 87px; width: 782px; height: 24px;" 
              Text="Documents are listed by Folder Subject. Open (or close) a folder and 'Double-Click' the document or Click the 'Open Selected Document' button to open it."></dx:ASPxLabel>
        <dx:ASPxTreeList ID="ASPxTreeList1" ClientInstanceName="ASPxTreeList1" 
              runat="server" KeyFieldName="ID"
              Style="z-index: 102; left: 88px;
                   position: absolute; top: 188px; border: solid 1px black; background-color: white; height: 575px;" Width="800px" 
              CssFilePath="~/css/TreeList.css" 
              CssPostfix="BlackGlass" 
              EnableCallbacks="true" Theme="Aqua">
                   <Settings ShowColumnHeaders="False" />
                   <SettingsBehavior AllowFocusedNode="True" ExpandCollapseAction="NodeClick" ProcessFocusedNodeChangedOnServer="True" ProcessSelectionChangedOnServer="True" />
                   <SettingsSelection Enabled="True" />
                   <Styles CssFilePath="~/css/Treelist/styles.css" CssPostfix="BlackGlass">
                       <CustomizationWindowContent VerticalAlign="Top">
                       </CustomizationWindowContent>
                   </Styles>
                   <Images ImageFolder="~/css/Treelist/">
                       <CollapsedButton Height="20px" Url="~/css/Treelist/ClosedBlueFolder.jpg"
                           Width="20px" />
                       <ExpandedButton Height="20px" Url="~/css/TreeList/OpenFolder.png"
                           Width="20px" />
                       <CustomizationWindowClose Height="20px" Width="20px" />
                   </Images>
                   <SettingsPager>
                       <AllButton Text="All">
                       </AllButton>
                       <NextPageButton Text="Next &gt;">
                       </NextPageButton>
                       <PrevPageButton Text="&lt; Prev">
                       </PrevPageButton>
                   </SettingsPager>
                   <ClientSideEvents NodeDblClick="OnTreeListDoubleClick"></ClientSideEvents>
               </dx:ASPxTreeList>
     </div>
</asp:Content>
