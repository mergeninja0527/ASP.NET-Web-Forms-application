<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="RegistrationAddress.aspx.vb" Inherits="SeymourWebsite.RegistrationAddress" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript" lang="javascript">
         function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main" style="height:450px; margin-left:0px">
        <h1>MEMBER WEBSITE REGISTRATION</h1>
          <br />
                     <dx:ASPxLabel id="lbllastName" CssClass="text10pt_left"
                style="Z-INDEX: 100; LEFT: 282px; POSITION: absolute; TOP: 143px" runat="server"
				Width="88px" text="Last Name" Height="20px"></dx:ASPxLabel>
			<dx:ASPxTextBox ID="txtLastName" class="text10pt_left" runat="server" Style="z-index: 101; left: 380px; position: absolute; top: 140px"
                Width="200px" Height="16px" TabIndex="2"></dx:ASPxTextBox>
            <dx:ASPxLabel ID="lblfirstName" CssClass="mainbodytext_0px" runat="server" Style="z-index: 108; left: 282px; position: absolute;
                top: 119px" Width="88px" Text="First Name"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label5" CssClass="smalltext" runat="server"  Style="z-index: 109; left: 598px; position: absolute;
                top: 120px;" Text="(e.g. 'James')" Width="110px"></dx:ASPxLabel>
            <dx:ASPxTextbox id="txtFirstName" class="mainbodytext_0px" style="Z-INDEX: 110; LEFT: 380px; POSITION: absolute; TOP: 116px"
				runat="server" Width="200px" CausesValidation="True" Height="16px" TabIndex="1"></dx:ASPxTextbox>
            <dx:ASPxLabel ID="Label4" CssClass="mainbodytext_0px" runat="server" Style="z-index: 113; left: 115px; position: absolute; top: 68px; width: 786px;"
                Text="Please enter the information below. This information will be compared to your name and address on file with the management office. We do this for security purposes." 
            ></dx:ASPxLabel>
			    <dx:ASPxButton id="cmdRegister"  CssClass="mainbodytext_center"  style="Z-INDEX: 111; LEFT: 423px; POSITION: absolute; TOP: 298px"
				        runat="server" Text="Register" Height="30px" Width="80px" TabIndex="8" Theme="Aqua">
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
            </dx:ASPxButton>
            <dx:ASPxLabel ID="Label3" CssClass="mainbodytext_0px" runat="server" Style="z-index: 112; left: 128px;
                position: absolute; top: 251px; width: 762px; height: 52px;" 
                Text="A temporary Username and Password will be emailed to you. Then please Sign-In and change your username and/or password to something more familiar. If registration problems occur please contact the Management Office for assistance."></dx:ASPxLabel>
             &nbsp; &nbsp;
            <asp:TextBox class="mainbodytext_0px" ID="txtMessage" runat="server" 
                Style="z-index: 114; left: 220px; overflow: hidden; color: red; padding-left:10px; position: absolute; top: 372px; width: 533px; border-width:0px; height: 63px;" 
                TextMode="MultiLine"  ReadOnly="True"></asp:TextBox>
             &nbsp; &nbsp;
             <dx:ASPxLabel ID="Label10" class="smalltext" runat="server" Style="z-index: 116; left: 598px; position: absolute;
                 top: 168px;" Text="(e.g. '12345')" Width="204px"></dx:ASPxLabel>
             <dx:ASPxLabel ID="Label11" class="smalltext" runat="server" Style="z-index: 117; left: 598px; position: absolute;
                 top: 144px;" Text="(e.g. 'Madison')" Width="110px"></dx:ASPxLabel>
             &nbsp;
             <dx:ASPxTextBox ID="txtStreetNo" class="mainbodytext_0px" runat="server" Height="16px" Style="z-index: 119; left: 380px;
                 position: absolute; top: 164px; " TabIndex="5" Width="200px"></dx:ASPxTextBox>
             <dx:ASPxLabel ID="Label1" CssClass="mainbodytext_0px" runat="server" Style="z-index: 120; left: 282px; position: absolute;
                 top: 167px; " Text="Street No" Width="88px"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="txtStreetName" class="mainbodytext_0px" runat="server" Height="16px" Style="z-index: 119; left: 380px;
                 position: absolute; top: 189px; " TabIndex="5" Width="200px"></dx:ASPxTextBox>
             &nbsp; &nbsp;
            <asp:Label ID="Label2" CssClass="mainbodytext_0px" runat="server" Style="z-index: 120; left: 282px; position: absolute;
                 top: 192px; width: 137px;" Text="Street Name"></asp:Label>
            <dx:ASPxTextBox ID="txtUnitNo" class="mainbodytext_0px" runat="server" Height="16px" Style="z-index: 119; left: 380px;
                 position: absolute; top: 215px; " TabIndex="5" Width="200px"></dx:ASPxTextBox>
            &nbsp; &nbsp;
            <dx:ASPxLabel ID="Label7" CssClass="mainbodytext_0px" runat="server" Style="z-index: 120; left: 282px; position: absolute;
                 top: 218px; " Text="Unit No" Width="88px"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label6" class="smalltext" runat="server" Style="z-index: 116; left: 598px; position: absolute;
                 top: 193px;" Text="(e.g. 'Park Place')" Width="204px"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label8" class="smalltext" runat="server" Style="z-index: 116; left: 598px; position: absolute;
                 top: 219px;" Text="(e.g. 'A, B, etc.')" Width="204px"></dx:ASPxLabel>
          <dx:ASPxButton ID="lnkSignIn" runat="server" EnableTheming="false" Visible="true" Text="Go Sign-In"
                style="position:absolute; text-align:right; top:347px; left:397px; color:#3389C2; font-family:Arial; font-size:10pt; font-weight:bold; text-decoration: none; z-index: 100;" 
                Width="128px" HorizontalAlign="Center" RenderMode="Link"></dx:ASPxButton>
        <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
            HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true"
            PopupAnimationType="None" Height="120" Width="300">
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
            </CloseButtonStyle><ClientSideEvents CloseUp="messagepopupclosed" />
        </dx:ASPxPopupControl>
        <dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="mContent" runat="server"  Visible="false"/>
        <dx:ASPxCallback ID="ASPxCallbackMessage" runat="server" ClientInstanceName="CallbackMessage" OnCallback="ASPxCallbackMessage_Callback">
        </dx:ASPxCallback>      
      </div>

</asp:Content>
