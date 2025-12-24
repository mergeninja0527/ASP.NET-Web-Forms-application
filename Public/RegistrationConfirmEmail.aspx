<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="RegistrationConfirmEmail.aspx.vb" Inherits="SeymourWebsite.RegistrationConfirmEmail" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main"  style="height:575px">
            <h1>REGISTRATION EMAIL CONFIRMATION</h1>
                <dx:ASPxLabel ID="lblEnterEmail" CssClass="mainbodytext_0px" runat="server" Style="z-index: 100; position: absolute;
                        top: 63px; width: 868px; left: 48px;" 
                
                Text="You must have an email address on file with Management to register on this website. If one is on file, it will appear below.  If this email address is correct and it is the primary email address at which you wish to receive correspondence, notifications & documentation, please read the consent form below.  Afterwards, you may click the acknowledgement check box, followed by the I AGREE button to continue.  Your temporary username and password will be emailed to you at this email address.  If the email address is incorrect, please click the <b>NEW EMAIL</b> button for additional options." EncodeHtml="False"></dx:ASPxLabel>
             &nbsp;
                    <dx:ASPxLabel ID="Label1" CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 221px; position: absolute;
                        top: 146px; width: 92px; height: 14px;" text="Email Address:"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEmail" CssClass="mainbodytext_0px" runat="server" Style="z-index: 102; left: 329px; position: absolute;
                        top: 142px" Width="300px" TabIndex="1" ReadOnly="true"></dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnOK"  CssClass="mainbodytext_center" Theme="Aqua" runat="server" Style="position: absolute; top: 493px; left: 385px; z-index: 103;" 
                        Text="I Agree" Width="80px" Height="30px" TabIndex="2" />
                    &nbsp;
                    <dx:ASPxButton ID="btnCancel"  CssClass="mainbodytext_center" Theme="Aqua" runat="server" Style="position: absolute; top: 493px; left: 478px; z-index: 104;" 
                        Text="Cancel" Width="80px" Height="30px" TabIndex="2" />
          <dx:ASPxLabel ID="Label2" runat="server" CssClass="mainbodytext_0px"  Style="z-index: 100; left: 49px; position: absolute;
                        top: 191px; width: 866px;" Text="<b>CONSENT FOR ELECTRONIC DELIVERY OF NOTICES & DOCUMENTS</b><br \><br \>I understand that California Civil Code allows for the use of e-mail, fax or other electronic means instead of first-class mail or personal delivery, as a method of transmission if the recipient agrees with this method. <br \><br \>By having previously signed and submitted a consent form as an owner and Member of the Association, I have agreed to (a) not receive the Association documents by first-class mail or personal delivery, and have instead chosen the option to have them sent by e-mail or other electronic transmission; (b) agreed that delivery of said documents is complete at transmission and that all statutory or other notice requirements as defined in the Association’s governing documents are perfected at transmission.  Further, as the owner of this property, I understand and agree that it is the owner’s responsibility to provide a written request to the Association’s management company to: 1) change the owner’s e-mail address on file with the Association; 2) withdraw consent to e-mail delivery; and/or 3) obtain a paper copy of specific electronic records, which I may do at any time.  Upon receipt of an owners request for copies of the Association’s records, the management company will confirm receipt of the written request within five (5) business days and will provide paper copies of the specified electronic records." EncodeHtml="False"></dx:ASPxLabel>
            <dx:ASPxLabel ID="Label3" runat="server" CssClass="mainbodytext_0px"  Style="z-index: 100; left: 79px; position: absolute;
                        top: 444px; width: 817px;" Text="I have read and agree to the above consent form and I have confirmed that the email listed above is the email at which I wish to receive electronic delivery of Association communications, notices and documentation moving forward."></dx:ASPxLabel>
                    <dx:ASPxButton ID="btnNewEmail" CssClass="mainbodytext_center" runat="server" Style="position: absolute; top: 138px; left: 661px; z-index: 103; width: 93px; right: 206px;" 
                        Text="New Email" Height="30px" TabIndex="2" Theme="Aqua"/>
            <dx:ASPxCheckBox ID="chkAccept" runat="server" Style="position: absolute; top: 443px; left: 50px; height: 24px;" Text=" " AutoPostBack="True">
            </dx:ASPxCheckBox>
    </div>
</asp:Content>
