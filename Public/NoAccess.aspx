<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSignIn.Master" CodeBehind="NoAccess.aspx.vb" Inherits="SeymourWebsite.NoAccess" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="main" style="height:350px">
        <br />
         <h1>Member Sign-In Status</h1>
            <div class="header1">NO PORTAL ACCESS</div><br />
         <p class="mainbodytext_50px">We appreciate your interest in the our Web Portal. But your community does not have access to this service. Please contact your association manager for further assistance.</p>
                <dx:ASPxButton ID="btnSignIn" runat="server" Style="z-index: 104; left: 441px; position: absolute;
                        top: 202px" Text="OK" Width="80px" Height="30px" TabIndex="4" Theme="Aqua">
                    <HoverStyle BackColor="#FF9900">
                    </HoverStyle>
          </dx:ASPxButton>
         </div>
</asp:Content>
