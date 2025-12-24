<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="RegistrationAccount.aspx.vb" Inherits="SeymourWebsite.RegistrationAccount" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function OnTreeListDoubleClick(s, e) { window.location.href = 'DocLoad.aspx'; }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="main" style="height:400px;background-color: white">
            <div class="header1">MEMBER WEBSITE REGISTRATION</div><br />
             <dx:ASPxLabel id="lbllastName" CssClass="mainbodytext_0px" 
                style="Z-INDEX: 100; LEFT: 273px; POSITION: absolute; TOP: 225px" runat="server"
				        Width="88px" text="Last Name" Height="20px"></dx:ASPxLabel>
				    <dx:ASPxTextBox ID="txtLastName" CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 368px; position: absolute; top: 224px"
                        Width="200px" Height="16px" TabIndex="2"></dx:ASPxTextBox>
                    
                    <dx:ASPxLabel ID="lblfirstName" CssClass="mainbodytext_0px" runat="server" Style="z-index: 108; left: 273px; position: absolute;
                        top: 199px; height: 18px;" Width="88px" Text="First Name"></dx:ASPxLabel>
             <dx:ASPxLabel ID="Label5" CssClass="smalltext" runat="server" Style="z-index: 109; left: 596px; position: absolute;
                 top: 200px; " Text="(e.g. 'James')" Width="110px" height="17"></dx:ASPxLabel>
                    <dx:ASPxTextbox id="txtFirstName" CssClass="mainbodytext_0px" style="Z-INDEX: 110; LEFT: 368px; POSITION: absolute; TOP: 197px"
				        runat="server" Width="200px" Height="16px" TabIndex="1"></dx:ASPxTextbox>
                  
                    <dx:ASPxLabel ID="Label4" CssClass="mainbodytext_0px" runat="server" Style="z-index: 113; left: 101px; position: absolute; top: 81px; width: 800px;"
                Text="Please enter your information below.  The information you enter must exactly match the information on file in our office. This portal is only available to the owner of record on the Grant Deed. Matched users will advance to a Confirmation Page.  A temporary Username and Password will be emailed to you at your email address on file. Sign in using the temporary username and password. Usernames and passwords may be changed under the Home option, after signing in. If you need assistance, please contact us directly."
                ></dx:ASPxLabel>
				        
			        <dx:ASPxButton id="cmdRegister"  CssClass="mainbodytext_center"  style="Z-INDEX: 111; LEFT: 423px; POSITION: absolute; TOP: 298px"
				        runat="server" Text="Register" Height="30px" Width="80px" TabIndex="8" Theme="Aqua">
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
            </dx:ASPxButton>

            <%-- &nbsp; &nbsp;
                    <dx:ASPxTextBox CssClass="text10pt_left" ID="txtMessage" runat="server" 
                 Style="z-index: 114; left: 100px; overflow: hidden; color: red; padding-left:10px; position: absolute; top: 401px; width: 779px; border-width:0px; height: 50px;" 
                TextMode="MultiLine"  ReadOnly="True"></dx:ASPxTextBox>
             &nbsp; &nbsp;--%>
             <dx:ASPxLabel ID="Label10" CssClass="smalltext" runat="server" Style="z-index: 116; left: 596px; position: absolute;
                 top: 255px; margin-bottom: 0px;" Text="(e.g. '0012' - see statement)'" Width="204px"></dx:ASPxLabel>
             <dx:ASPxLabel ID="Label11" CssClass="smalltext" runat="server" Style="z-index: 117; left: 596px; position: absolute;
                 top: 228px;" Text="(e.g. 'Madison')" Width="110px"></dx:ASPxLabel>
             &nbsp;
             <dx:ASPxTextBox ID="txtAccountNo" CssClass="mainbodytext_0px" runat="server" Height="16px" Style="z-index: 119; left: 368px;
                 position: absolute; top: 251px; " TabIndex="5" Width="200px"></dx:ASPxTextBox>
             <dx:ASPxLabel ID="Label1" CssClass="mainbodytext_0px" runat="server" Style="z-index: 120; left: 273px; position: absolute;
                 top: 255px; height: 14px;" Text="Account No" Width="88px"></dx:ASPxLabel>
     <dx:ASPxButton ID="lnkSignIn" runat="server" EnableTheming="false" Visible="true" Text="Go Sign-In"
                style="position:absolute; text-align:right; top:350px; left:396px; color:#3389C2; font-family:Arial; font-size:10pt; font-weight:bold; text-decoration: none; z-index: 100;" 
                Width="128px" HorizontalAlign="Center" RenderMode="Link"></dx:ASPxButton>

         <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true"
         PopupAnimationType="None" Height="150" Width="400"  PopupVerticalOffset="150">
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
