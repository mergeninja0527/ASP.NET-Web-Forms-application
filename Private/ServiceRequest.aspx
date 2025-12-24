<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="ServiceRequest.aspx.vb" Inherits="SeymourWebsite.ServiceRequest" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

   <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <script type="text/javascript">
              function messagepopupclosed(s, e) { CallbackMessage.PerformCallback(); }
    </script>
             <script type="text/javascript">

                 // <![CDATA[
                 var fieldSeparator = "|";
                 var uploadInProgress = false
                 function FileUploadStart(s, e) {
                     document.getElementById("<%=UploadStart.ClientID%>").value = "UploadStarted";
                 }
                 function FileUploaded(s, e) {
                     if (e.isValid) {
                         var linkFile = document.createElement("a");
                         var indexSeparator = e.callbackData.indexOf(fieldSeparator);
                         var fileName = e.callbackData.substring(0, indexSeparator);
                         var pictureUrl = e.callbackData.substring(indexSeparator + fieldSeparator.length);
                         var date = new Date();
                         var imgSrc = "UploadFile/" + pictureUrl + "?dx=" + date.getTime();
                         linkFile.innerHTML = fileName;
                         linkFile.setAttribute("href", imgSrc);
                         linkFile.setAttribute("target", "_blank");
                         var hf0 = memoUploadFiles.GetValue();
                         if (hf0 != null) { hf0 = hf0 + "\n" + fileName }
                         else { hf0 = fileName }
                         //memoUploadFiles.setVisible(True);
                         memoUploadFiles.SetText(hf0);
                     }
                 }
    // ]]>
    </script>
      <div id="main"  style="height:600px;background-color:white">
            <div class="header1">SERVICE REQUEST</div>
                    <dx:ASPxLabel CssClass="mainbodytext_0px" ID="Label1" runat="server" Text="Contact Name:"
                         Style="z-index: 100; left: 71px; position: absolute; top: 98px; width: 131px;"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtAddress" CssClass="mainbodytext_0px" runat="server" Style="z-index: 103; left: 196px;
                        position: absolute; top: 117px; background-color:Transparent; border-style:none" 
                        Width="265px" Height="16px"  ReadOnly="True" Font-Size="Small"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="Label3" CssClass="mainbodytext_0px" runat="server" Style="z-index: 104; left: 71px; position: absolute;
                        top: 147px; width: 107px;" Text="Association:" height="13px"></dx:ASPxLabel>                    
                    <dx:ASPxTextBox ID="txtAssociation" CssClass="mainbodytext_0px"  runat="server" Style="z-index: 107; left: 196px;
                        position: absolute; top: 142px; background-color:Transparent; border-style:none; width: 300px;"
                        TextMode="SingleLine" Height="16px"  
              ReadOnly="True" Font-Size="Small"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="Label7" CssClass="mainbodytext_0px" runat="server" Style="z-index: 108; left: 71px; position: absolute;
                        top: 170px; width: 128px;" Text="Phone Number(s):" height="13px"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPhone" CssClass="mainbodytext_0px"  runat="server" Style="z-index: 109; left: 196px; position: absolute;
                        top: 165px; background-color:Transparent; border-style:none; height: 22px; width: 266px;" TextMode="SingleLine"  ReadOnly="True" Font-Size="Small"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="Label10" CssClass="mainbodytext_0px" runat="server" Style="z-index: 110; left: 71px; position: absolute;
                        top: 194px" Text="Email Address:" Width="117px" height="13px"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEmail" CssClass="mainbodytext_0px"  runat="server" Style="z-index: 111; left: 196px; position: absolute;
                        top: 189px; background-color:Transparent; border-style:none; width: 265px;" 
              TextMode="SingleLine" Height="16px"  ReadOnly="True" Font-Size="Small"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="Label9" CssClass="mainbodytext_0px" runat="server" Style="z-index: 112; left: 71px; position: absolute;
                        top: 307px" Text="Message:" Width="140px"></dx:ASPxLabel>

                   <dx:ASPxLabel ID="Label6" CssClass="mainbodytext_0px"  runat="server" EncodeHtml="false" Style="z-index: 100; left: 520px;
                 position: absolute; top: 68px; width: 389px; height: 225px; font-size:9pt" > </dx:ASPxLabel>
                    
                    &nbsp;
                    &nbsp;
                    <dx:ASPxLabel ID="Label8" CssClass="mainbodytext_0px" runat="server" Style="z-index: 118; left: 71px; position: absolute;
                        top: 283px" Text="Priority:" Width="73px"></dx:ASPxLabel>
        &nbsp; &nbsp;
                    <dx:ASPxLabel ID="Label13" CssClass="headertext_left" runat="server" Style="z-index: 121; left: 71px;
                        position: absolute; top: 69px; width: 305px;  text-decoration:underline" 
              Text="Member Contact Information"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="Label14"  runat="server" CssClass="headertext_left" Style="z-index: 122; left: 71px;
                        position: absolute; top: 227px; height: 18px; width: 220px; text-decoration:underline" 
              Text="On-line Request"></dx:ASPxLabel>

                               <dx:ASPxUploadControl ID="UploadControl" CssClass="mainbodytext_0px" runat="server" Theme="Aqua"
              style="position:absolute; top: 342px; left: 520px; width: 381px;"  UploadButton-Text="" ShowTextBox="false" AutoStartUpload="true"
              ShowAddRemoveButtons="false" ShowUploadButton="false" AddUploadButtonsHorizontalPosition="Left" BrowseButton-Text="Add Documents"
                    ShowProgressPanel="true" ClientInstanceName="UploadControl" OnFileUploadComplete="UploadControl_FileUploadComplete" OnFileUploadStart="UploadControl_FileUploadStart"
                    FileInputCount="1">
                    <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.gif,.bmp,.doc,.docx,.xls,.xlsx,.txt,.xml,.csv,.pdf,.rtf,.png" MaxFileSize="4194303">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) { FileUploaded(s, e) }" FileUploadStart="function(s, e) { FileUploadStart(s, e) }" />
                    
                </dx:ASPxUploadControl>
          <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit"  CssClass="mainbodytext_center"
              style="position:absolute; top: 544px; left: 434px; height: 21px; width: 95px;" Theme="Aqua">
               <ClientSideEvents Click="function(s, e) { FileUploaded(s, e) }" />
               <HoverStyle BackColor="#FF9900">
               </HoverStyle>
          </dx:ASPxButton>
                    <dx:ASPxTextBox ID="txtContact" CssClass="mainbodytext_0px" runat="server" Style="z-index: 101; left: 196px;
                        position: absolute; top: 93px;  border-style:none; "
                        TextMode="SingleLine" Width="265px" Height="16px" 
              ReadOnly="True"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="Label2" CssClass="mainbodytext_0px" runat="server" Style="z-index: 102; left: 71px; position: absolute;
                        top: 122px; " Text="Property Address:" 
              height="13px"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="Label15" CssClass="mainbodytext_0px" runat="server" Style="z-index: 117; left: 71px; position: absolute;
                        top: 259px" Text="Subject:" Width="73px"></dx:ASPxLabel>
          <dx:ASPxLabel ID="lblUploadFiles" CssClass="mainbodytext_0px" runat="server" Style="z-index: 100; left: 520px;
                 position: absolute; top: 369px; width: 371px; height: 19px;" 
                 Text="Attachments:" Font-Italic="True" Font-Size="Small"></dx:ASPxLabel>
          <dx:ASPxComboBox ID="ASPxSubject" runat="server" ValueType="System.String"  CssClass="mainbodytext_0px"
              
              style="position:absolute; top: 255px; left: 156px; height: 21px; width: 265px;" Theme="Aqua">
          </dx:ASPxComboBox>
          <dx:ASPxComboBox ID="ASPxPriority" runat="server" ValueType="System.String" 
              
              style="position:absolute; top: 281px; left: 156px; height: 21px; width: 265px;" Theme="Aqua">
          </dx:ASPxComboBox>
           <dx:ASPxMemo ID="ASPxDescription" runat="server"  CssClass="mainbodytext_0px"
              style="position:absolute; top: 331px; left: 71px; width: 350px; height: 180px;" Rows="10" >
          </dx:ASPxMemo>
          <dx:ASPxMemo ID="memoUploadFiles" ClientInstanceName="memoUploadFiles" runat="server" CssClass="mainbodytext_0px" Style="position:absolute; top: 395px; left: 520px; width: 376px; height: 110px; color:#D5E7FE; vertical-align:top" Rows="5">
              <Border BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
          </dx:ASPxMemo>
          <asp:HiddenField ID="UploadStart" runat="server" />
    </div>

          <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="PopupControl" EnableHotTrack="False"
        HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" runat="server" ShowFooter="false" ShowHeader="true" EnableHierarchyRecreation="true" CloseOnEscape="true"
         PopupAnimationType="None" Height="120" Width="300"  PopupVerticalOffset="150">
        <Border BorderColor="" BorderStyle="Solid" BorderWidth="0px" />
        <HeaderStyle BackColor="" >
      
            <BorderBottom BorderWidth="0px" BorderColor="#FFBABA" BorderStyle="Solid" />
            <Paddings PaddingBottom="6px" PaddingLeft="13px" PaddingRight="8px" PaddingTop="6px" />
        </HeaderStyle>
        <ContentStyle BackColor="white">
            <Paddings PaddingBottom="10px" PaddingLeft="13px" PaddingRight="13px" PaddingTop="9px" />
        </ContentStyle>
        <CloseButtonStyle>
            <Paddings Padding="0px" PaddingLeft="3px" />
        </CloseButtonStyle>
    </dx:ASPxPopupControl>
    <dx:ASPxMemo ID="ASPxMemo1" ClientInstanceName="mContent" runat="server"  Visible="false"/>   
             </asp:Content>
