<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ShowImage.aspx.vb" Inherits="SeymourWebsite.ShowImage" %>

<%@ Register assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
   function windowResize(width, height)
     {
       window.resizeTo(width, height)
     }
</script>
</head>
<body onload="windowResize(800, 800)">
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server"></dx:ASPxBinaryImage>
    
    </div>
    </form>
</body>
</html>
