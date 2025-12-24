<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="BoardRequest.aspx.vb" Inherits="SeymourWebsite.BoardRequest" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" lang="javascript">
         function OnSearchClicked(s, e) { CallbackPanel1.PerformCallback('Search'); }
         function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main" style="height:750px; margin-left:0px">
              <div class="header1"><%= TitlePage  %></div><br />
            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Height="80px" Width="600px"
                 HeaderText = "Search Parameters" 
                 style="z-index: 900; left: 40px; top: 75px; position:absolute; " Theme="Aqua">
                <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" > 
                <div style="height: 80px">
                    <dx:ASPxLabel ID="lblDateRange" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 101; left: 20px; position: absolute;
                        width: 76px; top: 39px;" Text="Date Range" Height="13px"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblStatus" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 101; left: 333px; position:absolute;
                        top: 39px; width: 55px;" Text="Status"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblOrderBy" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 101; left: 333px; position:absolute;
                        top: 64px; width: 55px;" Text="Order By"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblJobType" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 101; left: 20px; position:absolute;
                        top: 64px; width: 84px;" Text="Activity Type"></dx:ASPxLabel> 
                    <dx:ASPxComboBox ID="cboDateRange" runat="server"  CssClass="mainbodytext_0px"
                        style="z-index: 999; left: 116px; position: absolute; top: 35px;" 
                        Height="21px" Width="185px" Theme="Aqua" >
                    </dx:ASPxComboBox>
                    <dx:ASPxTextBox ID="txtReportType" runat="server"  CssClass="mainbodytext_0px"
                        style="z-index: 999; left: 116px; top: 60px; position: absolute" ReadOnly="True" 
                        Height="21px" Width="185px" Theme="Aqua" >
                    </dx:ASPxTextBox>
                    <dx:ASPxComboBox ID="cboJobStatus" runat="server"  CssClass="mainbodytext_0px"
                        style="z-index: 999; left: 399px; top: 35px; position: absolute" 
                        Height="21px" Width="185px" Theme="Aqua" >
                    </dx:ASPxComboBox>
                     <dx:ASPxComboBox ID="cboOrderBy" runat="server"  CssClass="mainbodytext_0px"
                        style="z-index: 999; left: 399px; top:60px; position: absolute" 
                        Height="21px" Width="185px" Theme="Aqua" > 
                    </dx:ASPxComboBox>
          

                    <dx:ASPxButton ID="btnSearch" runat="server"   CssClass="mainbodytext_center"
                        style="z-index: 1; left: 250px; top: 96px; position: absolute; height: 25px; width: 100px;" 
                        Text="Search" ClientInstanceName="Search" AutoPostBack="False" Theme="Aqua" >
                        <ClientSideEvents Click="OnSearchClicked"></ClientSideEvents>
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
                    </dx:ASPxButton>
                    </div>
               </dx:PanelContent>
            </PanelCollection>
             </dx:ASPxRoundPanel>

   

           <dx:ASPxCallbackPanel ID="CallbackPanel1"  ClientInstanceName="CallbackPanel1" runat="server" 
                 style="z-index: 100; left: 30px; top: 240px; position: absolute; height:176px; width: 890px;" >
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxGridView ID="JobGrid" runat="server" Width="890px"      
                            style="z-index: 110; left: 0px; top: 0px; position: absolute; height: 150px" Theme="Aqua">
                            <SettingsBehavior AllowSelectByRowClick="True" AllowGroup="False" 
                                AllowSort="False" />
                            <Settings VerticalScrollableHeight="100" />

<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>

                            <Styles>
                                <Header Wrap="True">
                                </Header>
                            </Styles>
                        </dx:ASPxGridView>
                    </dx:PanelContent>
                </PanelCollection>
           </dx:ASPxCallbackPanel>
              
              <dx:ASPxButton ID="btnSummaryReport" runat="server" style="position:absolute; left: 726px; top:183px; width: 160px; height: 25px;" Text="Detail Report" Theme="Aqua">
                  <HoverStyle BackColor="#FF9900">
                  </HoverStyle>
    </dx:ASPxButton>
             <dx:ASPxLabel ID="lblReport" runat="server" 
                 Text="Select one or more individual records by holding the Ctrl key down while selecting rows; or select contiguous records using the Shift key" 
                 style="position:absolute; top: 82px; left: 688px; width: 241px; text-align:center" >
             </dx:ASPxLabel>
              
              <dx:ASPxButton ID="btnGridReport" runat="server" style="position:absolute; left: 726px; top:147px; width: 160px; height: 25px;" Text="Grid Listing Report" Theme="Aqua">
                  <HoverStyle BackColor="#FF9900">
                  </HoverStyle>
    </dx:ASPxButton>
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
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="CallbackMessage" OnCallback="ASPxCallbackMessage_Callback">
    </dx:ASPxCallback>

 <%--            <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true"
         PopupAnimationType="None" Height="120" Width="300">

<ContentCollection>

<dx:PopupControlContentControl runat="server">
    
    </dx:PopupControlContentControl>
</ContentCollection>

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
    <dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="mContent" runat="server"  Visible="false"/>--%>

    <dx:ASPxCallback ID="ASPxCallbackMessage" runat="server" ClientInstanceName="CallbackMessage" OnCallback="ASPxCallbackMessage_Callback">
    </dx:ASPxCallback>
    </div>
</asp:Content>
