<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Vehicle.aspx.vb" Inherits="SeymourWebsite.Vehicle" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" lang="javascript">
          function OnVehicleListBoxIndexChanged(s, e) { CallbackPanelVehicle.PerformCallback('VehicleListBox'); }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="main" style="height:400px; margin-left:0px">
          <div class="header1">VEHICLE REGISTRATION</div><br />
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" 
            style="position:absolute; left:123px; height:153px; width:215px; top: 110px;" 
            HeaderText="Vehicles On File" Theme="Aqua">
           <PanelCollection>
           <dx:PanelContent ID="PanelContent3" runat="server">   
            
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelListBox" 
                   ClientInstanceName="CallbackPanelListBox" runat="server"
                   style="z-index: 100; left: 5px; top: -5px; position: relative; height:90px; width: 200px;" >
            <PanelCollection>
            <dx:PanelContent ID="PanelContent4" runat="server" >
            <dx:ASPxListBox ID="lstVehicle" runat="server" ValueType="System.String" TextField="Vehicle" 
            style="position:relative; top: 0px; left: 3px; width: 186px; height: 75px;" ClientInstanceName="VehicleListBox">
                <Border BorderStyle="None" BorderWidth="0px" />
            <ClientSideEvents SelectedIndexChanged="OnVehicleListBoxIndexChanged"></ClientSideEvents>
            <Border BorderStyle="None" BorderWidth="0px"></Border>
        </dx:ASPxListBox>
         </dx:PanelContent>
           </PanelCollection>
            </dx:ASPxCallbackPanel>
           </dx:PanelContent>
           </PanelCollection>
        </dx:ASPxRoundPanel>

         <dx:ASPxButton ID="btnAdd" runat="server" 
            style="z-index: 1; left: 154px; top: 279px; position: absolute; height: 25px; width: 75px" 
            Text="Add" ClientInstanceName="VehicleAdd" AutoPostBack="True" Theme="Aqua">
                <HoverStyle BackColor="#FF9900"> </HoverStyle>
            <%--<ClientSideEvents Click="OnVehicleAdd" />--%>
        </dx:ASPxButton>

        <dx:ASPxButton ID="btnRemove" runat="server" 
            style="z-index: 1; left: 237px; top: 279px; position: absolute; height: 25px; width:75px" 
            Text="Remove" ClientInstanceName="VehicleRemove" AutoPostBack="True" Theme="Aqua">
               <HoverStyle BackColor="#FF9900"> </HoverStyle>
            <%-- <ClientSideEvents Click="OnVehicleRemove" />--%>
        </dx:ASPxButton>

         <dx:ASPxButton ID="btnCancel" runat="server" 
            style="z-index: 1; left: 632px; top: 279px; position: absolute; height: 25px; width: 75px" 
            Text="Cancel" ClientInstanceName="VehicleCancel" AutoPostBack="True" Theme="Aqua">
                <HoverStyle BackColor="#FF9900"> </HoverStyle>
            <%-- <ClientSideEvents Click="OnVehicleCancel" />--%>
        </dx:ASPxButton>
        <dx:ASPxButton ID="btnSave" runat="server" 
            style="z-index: 1; left: 548px; top: 279px; position: absolute; height: 25px; width: 75px" 
            Text="Save" ClientInstanceName="VehicleSave" AutoPostBack="True" Theme="Aqua">
               <HoverStyle BackColor="#FF9900"> </HoverStyle>
             <%--<ClientSideEvents Click="OnVehicleSave" />--%>
        </dx:ASPxButton>

        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
              style="z-index: 90; left:382px; top: 110px; position: absolute; height:130px; width: 475px;" 
              HeaderText="Vehicle Information" Theme="Aqua">
           <PanelCollection>
           <dx:PanelContent ID="PanelContent2" runat="server" >         
            <dx:ASPxCallbackPanel ID="CallbackPanelVehicle" 
                   ClientInstanceName="CallbackPanelVehicle" runat="server"
                   
                   style="z-index: 100; left: 5px; top: -5px; position: relative; height:90px; width: 456px;" 
                   SettingsLoadingPanel-ShowImage="false" >
<SettingsLoadingPanel Enabled="False"></SettingsLoadingPanel>
            <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" >
                <dx:ASPxLabel ID="lblLicense" runat="server" 
                    style="z-index: 1; left: 12px; top: 11px; position: absolute" 
                    Text="License">
                    </dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtLicense" runat="server" Height="21px"
                    style="z-index: 101;position:absolute; top:8px; left:80px; width: 124px;">
                    </dx:ASPxTextBox>
                <dx:ASPxLabel ID="lblMake" runat="server" 
                    style="z-index: 1; left: 12px; top: 36px; position: absolute; height: 18px; width: 39px;" 
                    Text="Make"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtMake" runat="server" 
                    style="z-index: 1; left:80px; top: 34px; position: absolute; width: 124px"></dx:ASPxTextBox>
               <dx:ASPxLabel ID="lblModel" runat="server" 
                    style="z-index: 1; left: 12px; top: 59px; position: absolute; height: 18px; width: 39px;" 
                    Text="Model"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtModel" runat="server" 
                    style="z-index: 1; left: 80px; top: 59px; position: absolute; width: 124px"></dx:ASPxTextBox>
                <dx:ASPxLabel ID="lblColor" runat="server" 
                    style="z-index: 1; left: 236px; top: 8px; position: absolute; height: 20px; width: 44px;" 
                    Text="Color"></dx:ASPxLabel>
                <dx:ASPxLabel ID="lblYear" runat="server" 
                    style="z-index: 1; left: 236px; top: 35px; position: absolute; height: 20px;" 
                    Text="Year"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtColor" runat="server" Height="21px" Width="124px" 
                    Text="" style="z-index: 200;position:absolute; top:8px; left:306px" 
                    ReadOnly="false">
                </dx:ASPxTextBox>
                <dx:ASPxLabel ID="lblSticker" runat="server" 
                    style="z-index: 1; left: 236px; top: 59px; position: absolute; height: 20px;" 
                    Text="Sticker ID"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtYear" runat="server" Height="21px" Width="124px" 
                    Text="" style="z-index: 200;position:absolute; top:34px; left:306px">
                </dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtSticker" runat="server" Height="21px" Width="124px" 
                    Text="" style="z-index: 200;position:absolute; top:60px; left:306px" >
                </dx:ASPxTextBox>
               
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
          </dx:PanelContent>
     </PanelCollection>
     </dx:ASPxRoundPanel>

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
    </dx:ASPxPopupControl>
    <dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="mContent" runat="server"  Visible="false"/>       
    </div>

</asp:Content>
