<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="DefaultSignIn.aspx.vb" Inherits="SeymourWebsite.DefaultSignIn" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        #mainTopHeader {position:relative;  height: 180px; width: 960px;  background-color: #d22f25; margin-top:0px}
          #mainTop {position:relative;  height: 70px; width: 960px;  background-color: white;}
        #mainSignIn {position:relative; height: 350px; width: 960px;  background-color:white}
        .text14pt_Italics {
	font-weight: bold;
	font-size: 14pt;
    font-style:italic;
	color: white;
    width: 960px;
    text-align:center;
	line-height:100%;
}
.text12pt_headertext{
	font-weight: bold;
	font-size: 10pt;
    font-style:normal;
	color: white;
    width: 900px;
    text-align:center;
	line-height:100%; 
}
      .text12pt_default{
	font-weight: normal;
	font-size: 10pt;
    font-style:normal;
	color: #575757;
    width: 960px;
    text-align:left;
	line-height:120%;
}
      .centered
{
    margin: 0 auto;
    float: none !important;
    display: table;
}
.center
{
    text-align:center
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
  <div id="mainTopHeader">
        <br />
           <div class="text14pt_Italics">Welcome to Our New Online Portal</div>
            <br />
           <div class="text12pt_headertext" style="padding-left:20px; padding-right:20px">We are excited to be live with our online portal. From here, you can send us work order requests get news and announcements, view calendars and change your contact information</div>
            <br />
           <div class="text12pt_headertext">Additional online services will be added, please be sure to check back often</div>
           <br />
            <div class="text14pt_Italics">Celebrating 45 years of Service</div>
        </div>
         <br />
         <div id="mainTop">
           <div class="text12pt_default" style="text-align:center">Sign-In to access your association's online service now.</div>
             <br />
         <div class="text12pt_default"  style="text-align:center">If you are new to the website, be sure to <a style="font-weight:bold; color:#575757" href="Public/RegistrationAddress.aspx">REGISTER HERE</a> to receive a password to the private and secured portions of the site.<br />
              Or, if you forgot your username or password <a style="font-weight:bold; color:#575757" href="Public/ForgotUsernamePassword.aspx">CLICK HERE</a>.</div>
             </div>
        <div id="mainSignIn">
         

            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="275px" Height="325px" Styles-Panel-Paddings-PaddingLeft="335px"  >

<Styles>
<Panel>
<Paddings PaddingLeft="335px"></Paddings>
</Panel>
</Styles>

                <PanelCollection>
                <dx:PanelContent runat="server">
   
                         <dx:ASPxLabel ID="lbldate" runat="server" Text="<<date>>" CssClass="mainbodytext_center"   style=" position:absolute; top: 23px; width:275px; font-family: Arial; Font-Size:11pt; color:#A70821; left: 335px; right: 350px;"></dx:ASPxLabel>

                         <dx:ASPxLabel CssClass="mainbodytext_center" style="Z-INDEX: 100; position: absolute; top: 48px; width:275px; font-family:  Arial; Font-Size:12pt; color:#575757; font-weight:bold; " 
                ID="lblHomeownerSignIn" runat="server" Text="Please Sign-In" 
                EnableTheming="False"></dx:ASPxLabel>
                
                  <dx:ASPxTextBox ID="txtUsername" runat="server" Width="250px"  Style="z-index: 103;  position:  absolute; top: 106px; margin-left:15px" TabIndex="1" Theme="">
         </dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtPassword" runat="server" Width="250px"  Style="z-index: 103;position:  absolute; top: 160px; margin-left:15px" Password="True" TabIndex="2" Theme=""></dx:ASPxTextBox>
        <dx:ASPxCheckBox ID="chkRememberMe" runat="server" CssClass="mainbodytext_0px" Style="z-index: 108;
                        position: absolute; top: 203px; width: 286px; font-family: Arial; Font-Size:10pt; color:black; margin-left:15px; left: 335px;" Text=" Remember Me On This Computer" TabIndex="3" Theme="">
         </dx:ASPxCheckBox>
                
                <dx:ASPxLabel CssClass="mainbodytext_0px" style="Z-INDEX: 100;  position: absolute; TOP: 80px; width:64px; font-family: Arial; Font-Size:10pt; color:black; margin-left:15px " 
                id="lblUsername" runat="server" Text="Username:"></dx:ASPxLabel>
               
				<dx:ASPxLabel CssClass="mainbodytext_0px" style="Z-INDEX: 101;  position:  absolute; TOP: 135px;font-family: Arial; Font-Size:10pt; color:black; margin-left:15px" 
                 id="lblPassword" runat="server" Width="64px" text="Password:"></dx:ASPxLabel>

                    <dx:ASPxButton ID="btnSignIn" runat="server" CssClass="mainbodytext_center" Style="z-index: 104; position: absolute;
                        top: 244px; margin-left:87px; left: 342px;" Text="Sign-In" Width="80px"  Height="30px"
                TabIndex="4" Theme="Aqua">
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
                         </dx:ASPxButton>
               
    
       
<%--          <dx:ASPxComboBox ID="ASPxComboBoxAdmin" runat="server" 
             style="z-index:1000; top:293px; position: absolute; height: 22px; width: 250px; left: 325px;" 
             ValueType="System.String" AutoPostBack="True">
         </dx:ASPxComboBox>--%>

                        </dx:PanelContent>
            </PanelCollection>

                 </dx:ASPxPanel>

        <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true" CloseOnEscape="true"
         PopupAnimationType="None" Height="120" Width="300"  PopupVerticalOffset="150">
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

     </div>
</asp:Content>