<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="HomePage.aspx.vb" Inherits="SeymourWebsite.HomePage" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main" style="height:900px">
    
       <dx:aspxhtmleditor ID="ASPxHtmlEditor1" runat="server" 
              Style="position:absolute; top:50px; left:25px; width:900px; height:800px" >
        </dx:aspxhtmleditor>
    
        <asp:LinkButton ID="lnkEdit" runat="server" CssClass="mainbodytext_0px"  OnClick="lnkEdit_Click" 
            style="position:absolute; font-family:Arial; font-size:10pt; font-weight:bold; top: 7px; left: 50px;" 
            Text="Edit"></asp:LinkButton>
    
        <asp:LinkButton ID="lnkReturn" runat="server" CssClass="mainbodytext_0px"  OnClick="lnkReturn_Click" 
            style="position:absolute; font-family:Arial; font-size:10pt; font-weight:bold; top: 7px; left: 150px;" 
            Text="Return"></asp:LinkButton>
    
        <asp:LinkButton ID="lnkSave" runat="server"  CssClass="mainbodytext_0px" OnClick="lnkReturn_Click" 
            style="position:absolute; font-family:Arial; font-size:10pt; font-weight:bold; top: 7px; left: 100px;" 
            Text="Save"></asp:LinkButton>
    
       </div>
</asp:Content>
