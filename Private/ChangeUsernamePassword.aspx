<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="ChangeUsernamePassword.aspx.vb" Inherits="SeymourWebsite.ChangeUsernamePassword" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div id="main"  style="height:350px" class="style1">
                   <div class="header1">CHANGE YOUR USERNAME AND/OR PASSWORD</div><br />
         <dx:ASPxLabel ID="Label7"  runat="server"  CssClass="headertext_center"
              Style="z-index: 106; left: 323px; position: absolute;  top: 97px; width: 309px;" 
              Text="NEW USERNAME AND PASSWORD"></dx:ASPxLabel>
         <dx:ASPxLabel CssClass="mainbodytext_0px" style="Z-INDEX: 100; LEFT: 304px; POSITION: absolute; TOP: 141px;" id="Label1" 
              runat="server" Text="New Username:"></dx:ASPxLabel>
	     <dx:ASPxTextBox ID="txtNewUsername" SkinID="TextBox" runat="server" 
              Style="z-index: 102; left: 438px; position: absolute; top: 137px;" 
              Width="200px" Height="16px" TabIndex="1"></dx:ASPxTextBox>
         <dx:ASPxLabel  CssClass="mainbodytext_0px" style="Z-INDEX: 100; LEFT: 307px; POSITION: absolute; TOP: 170px;" 
              id="Label5" runat="server" Text="New Password:"></dx:ASPxLabel>
         <dx:ASPxTextBox ID="txtNewPassword" CssClass="mainbodytext_0px"  runat="server" 
              Style="z-index: 103; left: 438px; position: absolute; top: 166px;" 
              Width="200px" Height="16px" TabIndex="2" TextMode="Password" Password="true"></dx:ASPxTextBox>     
           <dx:ASPxLabel CssClass="mainbodytext_0px" style="Z-INDEX: 100; LEFT: 259px; POSITION: absolute; TOP: 200px;" 
              id="Label6" runat="server" Text="Reenter New Password:"></dx:ASPxLabel>
         <dx:ASPxTextBox ID="txtReenterPassword" CssClass="mainbodytext_0px"  runat="server" 
              Style="z-index: 103; left: 438px; position: absolute; top: 196px;" 
              Width="200px" Height="16px" TabIndex="2" TextMode="Password" Password="true"></dx:ASPxTextBox>
              
         <dx:ASPxButton ID="btnModify" CssClass="mainbodytext_center" runat="server" 
              Style="z-index: 104; left: 453px; position: absolute; top: 261px" Text="Modify" Theme="Aqua"
              Width="80px" Height="30px"  TabIndex="3">
             <HoverStyle BackColor="#FF9900"></HoverStyle>
         </dx:ASPxButton>        
    </div>
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
</asp:Content>
