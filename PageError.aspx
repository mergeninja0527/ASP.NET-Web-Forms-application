<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PageError.aspx.vb" Inherits="SeymourWebsite.PageError" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      
             <div id="main" style="height:300px">
         <br />
          <div class="header1"></div><br />

              <div style="text-align:center">We&#39;re sorry but an error has occured.
    
                    <dx:ASPxButton ID="btnSignIn" runat="server" Style="z-index: 104; position: absolute;
                        top: 175px;" Text="Home Page" Width="120px" Height="40px" 
                TabIndex="4" Theme="Aqua">
                        <HoverStyle BackColor="#FF9900">
                        </HoverStyle>
                         </dx:ASPxButton>

            </div>
    
        </div>
    </form>
</body>
</html>
