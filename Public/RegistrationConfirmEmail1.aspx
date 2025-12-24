<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="RegistrationConfirmEmail1.aspx.vb" Inherits="SeymourWebsite.RegistrationConfirmEmail1" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div id="main"  style="height:450px">
            <div class="header1">REGISTRATION EMAIL CONFIRMATION</div><br />
                <dx:ASPxLabel ID="lblEnterEmail" CssClass="mainbodytext_0px" runat="server" Style="z-index: 100; left: 92px; position: absolute;
                        top: 67px; width: 812px;" Text="You must have an email address on file with the management company to register on this website. If one is on file it will appear in the email address below. If that is correct then click the OK button. If it not correct or none is showing then enter your email address. Your temporary username and password will be emailed to that email address."></dx:ASPxLabel>
                    <dx:ASPxLabel ID="Label1" CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 254px; position: absolute;
                        top: 133px; width: 94px; height: 14px;" text="Email Address:"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEmail" CssClass="mainbodytext_0px" runat="server" Style="z-index: 102; left: 356px; position: absolute;
                        top: 129px; font-size: 8pt;" Width="300px" TabIndex="1"></dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnOK" CssClass="mainbodytext_center" runat="server" Style="position: absolute; top: 371px; left: 390px; z-index: 103;" 
                        Text="I agree" Width="80px" Height="30px" TabIndex="2" Theme="Aqua" >
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
            </dx:ASPxButton>
                    &nbsp;
                    <dx:ASPxButton ID="btnCancel" CssClass="mainbodytext_center" runat="server" Style="position: absolute; top: 371px; left: 493px; z-index: 104;" 
                        Text="Cancel" Width="80px" Height="30px" TabIndex="2" Theme="Aqua" >
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
            </dx:ASPxButton>
                     
            <dx:ASPxLabel ID="Label2" CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 92px; position: absolute;
                        top: 173px; width: 177px; text-decoration:underline; font-weight:bold" 
                Text="Emergency Problems"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label3" CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 119px; position: absolute;
                        top: 193px; width: 790px;" 
                Text="E-mail should never be used for emergency problems. In the event of an emergency, call 911."></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label4"  CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 92px; position: absolute;
                        top: 226px; width: 176px; text-decoration:underline; font-weight:bold" 
                Text="Urgent Problems"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label5"  CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 118px; position: absolute;
                        top: 246px; width: 789px;" 
                Text="E-mail should never be used for urgent problems. In these cases, the homeowner should call the management office."></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label6"  CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 92px; position: absolute;
                        top: 281px; text-decoration:underline; font-weight:bold" 
                Text="Sensitive Homeowner Information"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label7"  CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 118px; position: absolute;
                        top: 300px; width: 819px" 
                Text=" E-mail should be concise. If the homeowner has a problem that is too complex or sensitive to discuss via e-mail, the homeowner should make an appointment by calling the management office."></dx:ASPxLabel>
            
    </div>
</asp:Content>
