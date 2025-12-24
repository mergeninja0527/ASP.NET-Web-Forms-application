<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="DocsGrid.aspx.vb" Inherits="SeymourWebsite.DocsGrid" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Docs.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Docs" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function OnTreeListDoubleClick(s, e) { window.location.href = 'DocLoad.aspx'; }
        function OnSearchClicked(s, e) { CallbackPanel1.PerformCallback('Search'); }
        function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="main" style="height:800px">
          <div class="header1">DOCUMENTS (By Date Posted)</div><br /> 
        <dx:ASPxButton ID="btnOpenDoc" runat="server"  style="z-index: 1; left: 392px; top: 80px; position: absolute; height: 24px; width: 182px" 
                 Text="Open Selected Document" AutoPostBack="true" Theme="Aqua">
            <HoverStyle BackColor="#FF9900">
            </HoverStyle>
             </dx:ASPxButton>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssClass="mainbodytext_0px" Text="Search for text" style="z-index: 1; left: 186px; top: 194px; position: absolute; height: 19px; width: 100px; text-align:left">
          </dx:ASPxLabel>
            <dx:ASPxTextBox ID="txtSearch" runat="server" ClientInstanceName ="txtSearch" CssClass="mainbodytext_0px"
                           style="z-index: 1; left: 282px; top: 193px; position: absolute; height: 19px; width: 170px; " 
              Width="170px" Theme="Aqua">
          </dx:ASPxTextBox>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="In" style="z-index: 1; left: 468px; top: 197px; position: absolute; height: 19px; width: 30px; ">
          </dx:ASPxLabel>
           <dx:ASPxComboBox ID="cboSearchOption" runat="server" ValueType="System.String" CssClass="mainbodytext_0px" style="z-index: 101; left: 493px; top: 193px; position: absolute; width: 100px; background-color:white" Theme="Aqua">
          </dx:ASPxComboBox>
        


        <dx:ASPxButton ID="btnSearch" runat="server" 
              style="z-index: 1; left: 613px; top: 190px; position: absolute; height: 25px; width: 102px" 
              Text="Search" ClientInstanceName="Search" AutoPostBack="False" Theme="Aqua">
                  <ClientSideEvents Click="OnSearchClicked"></ClientSideEvents>
                  <HoverStyle BackColor="#FF9900">
                  </HoverStyle>
          </dx:ASPxButton>
        </div>
    <dx:ASPxLabel ID="Label3" runat="server" CssClass="mainbodytext_0px" Style="left: 105px; position: absolute; top: 120px; width: 742px; height: 48px; z-index:100" 
              Text="Documents are listed in order of date posted (most recent on top). You can also type in some text to SEARCH for text in the documents. Then clear the text and then SEARCH to show all documents. 'Double-Click' the document or Click the 'Open Selected Document' button to open it."></dx:ASPxLabel>
   

             <dx:ASPxCallbackPanel ID="CallbackPanel1"  ClientInstanceName="CallbackPanel1" runat="server" 
                 style="z-index: 100; left: 88px; top: 270px; position: absolute; height:430px; width: 800px;" >
                <PanelCollection>
                    <dx:PanelContent runat="server">
                          <dx:ASPxGridView ID="grdDocSearch" runat="server" KeyFieldName="ID" ClientInstanceName="grdDocSearch"            
              Style="position:absolute; top: 0px; left: 1px; width:800px; height:400px" 
              AutoGenerateColumns="False" Theme="Aqua" >
              <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                  ProcessFocusedRowChangedOnServer="True" AllowSort="False" />

<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

              <SettingsPager Mode="ShowAllRecords">
              </SettingsPager>
              <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                <Columns>
                 <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="-1" Visible="False" ></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Folder" VisibleIndex="0" ></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="1" ></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DatePosted" VisibleIndex="2"  Width="150px">
                        <PropertiesTextEdit DisplayFormatString="M/d/yyyy">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                 </Columns>
                 <ClientSideEvents RowDblClick="OnTreeListDoubleClick"></ClientSideEvents>               
          </dx:ASPxGridView>
                     <dx:ASPxLabel ID="lblSearchCount" runat="server" Text=""  CssClass="mainbodytext_0px" style="z-index: 1; left: 1px; top: 465px; position: absolute; height: 20px; width: 400px; font-family:Verdana; font-size:7pt; font-weight:normal; color: #303030" >
          </dx:ASPxLabel>
                    
                     </dx:PanelContent>
                </PanelCollection>
              

          </dx:ASPxCallbackPanel>
</asp:Content>
