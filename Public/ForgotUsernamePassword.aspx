<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="ForgotUsernamePassword.aspx.vb" Inherits="SeymourWebsite.ForgotUsernamePassword" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div id="main" style="height:350px">
            <div class="header1">FORGOT USERNAME AND PASSWORD</div><br />
                   <dx:ASPxLabel ID="lblEnterEmail_nomargin" CssClass="mainbodytext_0px" runat="server" Style="z-index: 100; left: 141px; position: absolute;
                        top: 75px; width: 686px; height: 28px;" Text="Please enter your last name and email address. If we find a match in our records we'll email your username name and password to you."></dx:ASPxLabel>
                    <dx:ASPxLabel ID="Label1"  CssClass="mainbodytext_0px"  runat="server" Style="z-index: 101; left: 253px; position: absolute;
                        top: 162px; width: 100px; height: 19px;" text="Email Address:"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEmail"  CssClass="mainbodytext_0px"  runat="server" Style="z-index: 102; left: 365px; position: absolute;
                        top: 161px;" Width="300px" TabIndex="2"></dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnLoginInfo"  CssClass="mainbodytext_center"  runat="server" Style="position: absolute; top: 223px; left: 440px; z-index: 103;" 
                        Text="Send" Width="80px" Height="30px" TabIndex="2" Theme="Aqua" >
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
            </dx:ASPxButton>
                    <dx:ASPxTextBox ID="txtLastName" CssClass="mainbodytext_0px" runat="server" Style="z-index: 102; left: 365px; position: absolute;
                        top: 129px;" Width="300px" TabIndex="1"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="Label2" cssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 253px; position: absolute;
                        top: 132px; width: 97px; height: 19px;" text="Last Name:"></dx:ASPxLabel>

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
            <dx:ASPxButton ID="lnkSignIn" runat="server" EnableTheming="false" HorizontalAlign="Center" RenderMode="Link" style="position: absolute; text-align: right; top: 276px; left: 413px; color: #3389C2; font-family: Arial; font-size: 10pt; font-weight: bold; text-decoration: none; z-index: 100;" Text="Go Sign-In" Visible="true" Width="128px">
            </dx:ASPxButton>
    </div>
</asp:Content>
