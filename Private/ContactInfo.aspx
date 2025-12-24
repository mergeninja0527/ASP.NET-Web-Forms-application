<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" MaintainScrollPositionOnPostback="true" CodeBehind="ContactInfo.aspx.vb" Inherits="SeymourWebsite.ContactInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript" lang="javascript">
         function OnContactSavedClicked(s, e) { CallbackPanelContact.PerformCallback('Save'); }
         function OnContactCancelClicked(s, e) { CallbackPanelContact.PerformCallback('Cancel'); }
         function OnContactDropDownChanged(s, e) { CallbackPanelContact.PerformCallback('DropDownChanged'); }
         function OnContactUnlistedNameCheckChanged(s, e) { CallbackPanelContact.PerformCallback('UnlistedNameChanged'); }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div id="main" style="height:650px; margin-left: 0px;">
            <div class="header1">MEMBER CONTACT INFORMATION</div><br />
                  <dx:ASPxLabel ID="lbl1"  CssClass="mainbodytext_0px"  runat="server" Style="z-index: 100; left: 296px; position: absolute;
                        top: 109px" Width="69px" Text="Address"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="Label3"   CssClass="mainbodytext_0px"  runat="server" Style="z-index: 101; left: 296px; position: absolute;
                        top: 137px" Text="Association" Width="74px"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtAddress"  CssClass="mainbodytext_0px" 
                        runat="server" ReadOnly="True" Style="z-index: 102;
                        left: 398px;  position: absolute; top: 107px" Width="301px" Theme="Aqua">
                        <Border BorderStyle="None" />
          </dx:ASPxTextBox>
                    <dx:ASPxLabel ID="lblContact"   CssClass="mainbodytext_0px"  runat="server" Style="z-index: 103; left: 296px; position: absolute;
                        top: 167px" Width="68px" Text="Role "></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblName"   CssClass="mainbodytext_0px"  runat="server" Style="z-index: 104; left: 296px; position: absolute;
                        top: 80px; right: 595px;" Width="69px" Text="Name"></dx:ASPxLabel>
          <dx:ASPxTextBox ID="txtName"  CssClass="mainbodytext_0px" runat="server" 
                     Style="z-index: 105; left: 398px; position: absolute; top: 78px;" Width="301px" ReadOnly="True" Theme="Aqua">
              <Border BorderStyle="None" />
          </dx:ASPxTextBox>
                    <dx:ASPxTextBox ID="txtAssociationName"  CssClass="mainbodytext_0px"   runat="server" ReadOnly="True" 
                        Style="z-index: 107; left: 398px; position: absolute; top: 136px"  Width="301px" Theme="Aqua">
                        <Border BorderStyle="None" />
          </dx:ASPxTextBox>
           <dx:ASPxTextBox ID="txtRole"  CssClass="mainbodytext_0px"   runat="server" ReadOnly="True" 
                        Style="z-index: 107; left: 398px; position: absolute; top: 165px"  Width="301px" Theme="Aqua">
                        <Border BorderStyle="None" />
          </dx:ASPxTextBox>
                   <%--<dx:ASPxComboBox ID="ddlRoleType" CssClass="mainbodytext_0px" AutoPostBack ="false"
                        runat="server"  Style="z-index: 106; left: 398px; position: absolute; top: 165px" Width="250px"
                        ClientInstanceName="DropDownChanged" Theme="Aqua">
                        <ClientSideEvents SelectedIndexChanged="OnContactDropDownChanged"></ClientSideEvents>
                     </dx:ASPxComboBox>--%>

           <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
              style="z-index: 90; left: 80px; top: 207px; position: absolute; height:265px; width: 800px;" 
              HeaderText="Contact Information" Theme="Aqua">
           <PanelCollection>
           <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">          
               <dx:ASPxCallbackPanel ID="CallbackPanelContact"  
                   ClientInstanceName="CallbackPanelContact" runat="server" 
                   style="z-index: 100; left:-10px; top: 1px; position: relative; height:265px; width: 743px;" >
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                    <dx:ASPxLabel ID="lblEditName"  CssClass="mainbodytext_0px" runat="server" Style="z-index: 204; left: 10px; position: absolute; top: 10px" Width="69px" Text="Name"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEditName" runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 162px; position: absolute; top: 6px; width: 300px;" Width="301px" 
                            ReadOnly="True" Theme="Default"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="lblMailAddress"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 104; left: 10px; position: absolute; top: 52px; width: 100px;" Text="Mailing Address"></dx:ASPxLabel>
                        <dx:ASPxMemo ID="txtMailAddress" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 105; left: 162px; position: absolute; top: 34px; height: 45px; overflow:hidden"  Width="301px" ReadOnly="True" Theme="Default">
                            <ClientSideEvents Init="function(s, e){
                                            s.GetInputElement().style.overflowY='hidden';
                                            }" />
                        </dx:ASPxMemo>
                    <dx:ASPxLabel ID="lblPhone1" runat="server" CssClass="mainbodytext_0px"  Style="z-index: 104; left: 10px; position: absolute; top: 96px; width: 100px;" Text="Phone 1" Theme=""></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPhone1" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 105; left: 162px; position: absolute; top: 92px;" Width="150px" Theme="Aqua"></dx:ASPxTextBox>
                   <dx:ASPxComboBox ID="ddlPhone1Type"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 106; left: 325px; position: absolute; top: 92px" Width="100px" AutoPostBack="False" Theme="Aqua" ></dx:ASPxComboBox>
                    <dx:ASPxLabel ID="lblPhone2" runat="server" CssClass="mainbodytext_0px" Style="z-index: 104; left: 10px; position: absolute;  top: 125px; width: 119px;" Text="Phone 2"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPhone2"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 162px; position: absolute; top: 121px;"  Width="150px" Theme=""></dx:ASPxTextBox>
                   <dx:ASPxComboBox ID="ddlPhone2Type" runat="server" CssClass="mainbodytext_0px" Style="z-index: 106; left:325px; position: absolute; top: 121px" Width="100px" AutoPostBack="False" Theme="Aqua" ></dx:ASPxComboBox>
                   <dx:ASPxLabel ID="lblPhone3" runat="server" CssClass="mainbodytext_0px" Style="z-index: 104; left: 10px; position: absolute; top: 154px; width: 100px;" Text="Phone 3"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPhone3"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 162px; position: absolute; top: 151px;" Width="150px" Theme=""></dx:ASPxTextBox>
                   <dx:ASPxComboBox ID="ddlPhone3Type"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 106; left: 325px; position: absolute; top: 150px" Width="100px" AutoPostBack="False" Theme="Aqua" ></dx:ASPxComboBox>
                   <dx:ASPxLabel ID="lblEmail"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 104; left: 10px; position: absolute; top: 183px; width: 119px;" Text="E-mail"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEMail"  runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 162px; position: absolute; top: 179px; width: 300px;" Theme=""></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="DirectoryLabel"  runat="server" CssClass="mainbodytext_0px"  Style="z-index:104; left: 527px; position: absolute; top: 28px; width: 200px;" Text="Make visible in Member Directory:"></dx:ASPxLabel>
                     <dx:ASPxCheckBox ID="chkListedEmail" runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 528px; position: absolute; top: 76px; width: 61px; height: 26px;" Text="E-mail" CheckState="Unchecked"  Theme=""></dx:ASPxCheckBox>
                     <dx:ASPxCheckBox ID="chkListedHomePhone" runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 528px; position: absolute; top: 102px; width: 100px;"  Text="Home Phone" CheckState="Unchecked" Height="26px" Theme=""></dx:ASPxCheckBox>
                     <dx:ASPxCheckBox ID="chkListedCellPhone" runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 528px; position: absolute; top: 129px; width: 91px;"  Text="Cell Phone" CheckState="Unchecked" Height="26px" Theme=""></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="chkListedWorkPhone" runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 528px; position: absolute; top: 155px; width: 100px; bottom: 62px;"  Text="Work Phone" CheckState="Unchecked" Height="26px" Theme=""></dx:ASPxCheckBox>
                      <dx:ASPxCheckBox ID="chkNoEmailAtAll" runat="server"  CssClass="mainbodytext_0px" Style="z-index: 105; left: 159px; position: absolute; top: 214px; width: 341px; height: 17px;"  Text = "Send Official Notice by Email (USPS not required)" Theme=""></dx:ASPxCheckBox>
                     
                     <dx:ASPxCheckBox ID="chkListedMailAddress" runat="server" CssClass="mainbodytext_0px" Style="z-index: 104; left: 528px; position: absolute; top: 51px; width: 100px; height: 26px;"  Text="Mail Address" CheckState="Unchecked" Theme="">
                        
                        </dx:ASPxCheckBox>
                     
                  
                        <dx:ASPxCheckBox ID="chkUnlisted" runat="server" CssClass="mainbodytext_0px" Style="z-index: 105; left: 159px; position: absolute; top: 235px; width: 320px; height: 26px;" Text="Unlisted (Contact infomation is not visible)" CheckState="Unchecked" AutoPostBack="True">
                        </dx:ASPxCheckBox >
                     
                      
                        
                     
                      
                    </dx:PanelContent>
                </PanelCollection>
           </dx:ASPxCallbackPanel>
      </dx:PanelContent>
     </PanelCollection>
     </dx:ASPxRoundPanel>

           <dx:ASPxButton ID="btnSave" runat="server" Text="Save" 
                   style="z-index: 1000; position:absolute; top: 561px; left: 391px; height:30px; width:80px"
                   ClientInstanceName="Save" AutoPostBack="False"
              Cursor="pointer" Theme="Aqua">
                   <ClientSideEvents Click="OnContactSavedClicked" />
                   <HoverStyle BackColor="#FF9900">
                   </HoverStyle>
          </dx:ASPxButton>
          <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" 
              style="position:absolute; top: 561px; left: 489px; height:30px; width:80px"
              ClientInstanceName="Cancel" AutoPostBack="False" 
              Cursor="pointer" Theme="Aqua"  >
              <ClientSideEvents Click="OnContactCancelClicked" />
              <HoverStyle BackColor="#FF9900">
              </HoverStyle>
          </dx:ASPxButton>
                    

        
                    </div>
</asp:Content>
