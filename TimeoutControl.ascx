<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="TimeoutControl.ascx.vb" Inherits="SeymourWebsite.TimeoutControl" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
  <link href="~/css/styles.css" type="text/css" rel="stylesheet" /> 
<script type="text/javascript">

	window.SessionTimeout = (function() {

		var _timeLeft, _popupTimer, _countDownTimer;

		var stopTimers = function() {
			window.clearTimeout(_popupTimer);
			window.clearTimeout(_countDownTimer);
		};

		var updateCountDown = function() {
			var min = Math.floor(_timeLeft / 60);
			var sec = _timeLeft % 60;
			if(sec < 10)
				sec = "0" + sec;

			document.getElementById("CountDownHolder").innerHTML = min + ":" + sec;

			if(_timeLeft > 0) {
				_timeLeft--;
				_countDownTimer = window.setTimeout(updateCountDown, 1000);
			} else  {
				<%--window.location = <%=QuotedTimeOutUrl%>;--%>
				window.location = "/DefaultSignIn.aspx"
			}            
		};

		var showPopup = function() {
			_timeLeft = 60;
			updateCountDown();
			ClientTimeoutPopup.Show();
		};

		var schedulePopup = function() {       
			stopTimers();
			_popupTimer = window.setTimeout(showPopup, <%=PopupShowDelay%>);
		};

		var sendKeepAlive = function() {
			stopTimers();
			ClientTimeoutPopup.Hide();
			ClientKeepAliveHelper.PerformCallback();
		};

		return {
			schedulePopup: schedulePopup,
			sendKeepAlive: sendKeepAlive
		};

	})();    

</script>


<dx:ASPxPopupControl ID="TimoutPopup" runat="server" AllowDragging="True" ClientInstanceName="ClientTimeoutPopup" CloseAction="None" HeaderText="Session Expiring" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowFooter="True" Width="250px" Theme="Aqua">
    <FooterTemplate>
        <dx:ASPxButton ID="OKButton" runat="server" AutoPostBack="False" Text="OK" CssClass="mainbodytext_center" Style="z-index: 104; position: relative;
                        top: 0px;  left: 80px;" Width="80px"  Height="30px"
                TabIndex="4" Theme="Aqua">
            <ClientSideEvents Click="SessionTimeout.sendKeepAlive" />
        </dx:ASPxButton>
    </FooterTemplate>
      <Border BorderColor="" BorderStyle="Solid" BorderWidth="0px" />
        <HeaderStyle BackColor="" Font-Bold="True" ForeColor="#3C3C3C" Font-Size="9pt"  >
           
            <BorderBottom BorderWidth="0px" BorderColor="#FFBABA" BorderStyle="Solid" />
            <Paddings PaddingBottom="6px" PaddingLeft="13px" PaddingRight="8px" PaddingTop="6px" />
        </HeaderStyle>
       <FooterStyle BackColor="white" >
           
            <BorderBottom BorderWidth="0px" BorderColor="#FFBABA" BorderStyle="Solid" />
            <Paddings PaddingBottom="6px" PaddingLeft="13px" PaddingRight="8px" PaddingTop="6px" />
        </FooterStyle>
    
        <ContentStyle BackColor="white" ForeColor="black" Font-Bold="false">
           
            <Paddings PaddingBottom="10px" PaddingLeft="13px" PaddingRight="13px" PaddingTop="9px" />
        </ContentStyle>
    <ContentCollection>

<dx:PopupControlContentControl runat="server">Due to inactivity your login session will expire in ...<br />
    <br />
    <span id="CountDownHolder"></span><span> secs</span><br />
    <br />
    Click OK to continue your session.</dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxGlobalEvents ID="GlobalEvents" runat="server">
    <ClientSideEvents ControlsInitialized="SessionTimeout.schedulePopup" />
</dx:ASPxGlobalEvents>
<dx:ASPxCallback ID="KeepAliveHelper" runat="server" ClientInstanceName="ClientKeepAliveHelper">
</dx:ASPxCallback>