<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Default.aspx.vb" Inherits="SeymourWebsite._Default" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
          #mainTop {position:relative;  height: 200px; width: 960px;  background-color: white; z-index:100}
        #mainSignIn {position:relative; height: 200px; width: 960px;  background-color:white; z-index:100}
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <div id="mainTop" style="z-index:100">
          <br />
          
           <p class="mainbodytext_100px">Welcome to our online services. We are glad you're here.</p>
             
<p class="mainbodytext_100px">You can send questions or suggestions to your Community Manager or to your Board or select from any of the other options above for information or other services. Be sure to check the announcements page for anything new in your community.</p>

           <p class="mainbodytext_100px">All of us here at Rancho Bernardo Swim and Tennis strive to nurture a positive, friendly sense of community for you – the people we serve. We work collaboratively with your community leaders focused on the unique needs and interests of your community. We value your comments and feedback. Thank you for this opportunity to be in service to you.</p>

        </div>
     
         
        <div id="mainSignIn" style="z-index:100">
         

            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="275px" Height="200px" Styles-Panel-Paddings-PaddingLeft="325px" >
<Styles>
<Panel>
<Paddings PaddingLeft="325px"></Paddings>
</Panel>
</Styles>
                <PanelCollection>
                <dx:PanelContent runat="server">
   
                         <dx:ASPxLabel ID="lbldate" runat="server" Text="<<date>>" CssClass="mainbodytext_center" style=" position:absolute; top: 14px; width:275px; left: 349px;"></dx:ASPxLabel>
              <dx:ASPxLabel CssClass="mainbodytext_center" style="Z-INDEX: 100; position: absolute; top: 48px; width:275px; color:red; left: 349px;" 
                ID="lblHomeownerSignIn" runat="server" Text="Please Sign-In" 
                EnableTheming="False"></dx:ASPxLabel>
                      <dx:ASPxLabel style="Z-INDEX: 100; position:  absolute; TOP: 83px; width:782px; height: 19px; left: 96px;" 
                id="lblSignedIn" runat="server" Text="" CssClass="mainbodytext_center"
                EnableTheming="false"></dx:ASPxLabel>

          <dx:ASPxComboBox ID="ASPxComboBoxAdmin" runat="server"  
             style="z-index:1000; top:133px; position: absolute; height: 22px; width: 250px; left: 358px;" 
             ValueType="System.String" AutoPostBack="True" Theme="">
         </dx:ASPxComboBox>

                        </dx:PanelContent>
            </PanelCollection>

                 </dx:ASPxPanel>
           
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
