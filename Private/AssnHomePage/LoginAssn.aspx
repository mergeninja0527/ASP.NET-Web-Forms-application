<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="LoginAssn.aspx.vb" Inherits="SeymourWebsite.LoginAssn" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div id="main"  style="height:500px">
        <dx:ASPxTextBox ID="txtHeader"  CssClass="headertext_center" runat="server" Height="23px" 
                Style="z-index: 100; left: 102px; position: absolute; top: 15px;  border-style:none" Width="767px" HorizontalAlign="Center"  ></dx:ASPxTextBox>
        <dx:ASPxImage ID="Image1" runat="server" Height="183px"  CssClass="mainbodytext_0px" Style="z-index: 101; float:right;
            position: absolute; top: 55px; left: 655px; border:1px solid gray" Width="269px" BackColor="Transparent" />
        <dx:ASPxMemo ID="txtText"  CssClass="mainbodytext_0px" runat="server"  Style="z-index: 102;
            left: 53px; position: absolute; top: 55px; overflow:auto; padding:0px; border-width:0px; width: 577px;" height="418px" ReadOnly="True" Theme="Aqua"></dx:ASPxMemo>
    </div>
</asp:Content>
