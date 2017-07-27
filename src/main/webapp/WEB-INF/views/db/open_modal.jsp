<%@ include file="/WEB-INF/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Modal windows</title>
	<style>
		div.controls {
			margin: 0px 10px;
			font-size: 14px;
			font-family: Tahoma;
			color: #404040;
			height: 80px;
		}
		div#winVP {
			position: relative;
			height: 350px;
			border: 1px solid #dfdfdf;
			margin: 10px;
		}
	</style>
	<script>
		var dhxWins, w1,f1;
		
		function doOnLoad() {
			
			dhxWins = new dhtmlXWindows();
			dhxWins.attachViewportTo("winVP");
			
			w1 = dhxWins.createWindow("w1", 20, 30, 270, 300);
 
            var formData = [
				{type: "settings", position: "label-left", labelWidth: 100, inputWidth: 120},
				{type: "block", inputWidth: "auto", offsetTop: 12, list: [
					{type: "input", label: "DB URL", value: "jdbc:mysql://127.0.0.1:3306/study_jsp", name:"url"},
					{type: "input", label: "Driver Name", value: "com.mysql.jdbc.Driver", name:"dbms"},
					{type: "input", label: "DB Name", value: "mine", name:"dbname"},
					{type: "input", label: "User Name", value: "root", name:"id"},
					{type: "password", label: "Password", value: "1234", name:"pwd"},
					{type: "button", value: "Proceed", name:"submit",offsetLeft: 70, offsetTop: 14}
				]}
			];
			var f1 = w1.attachForm(formData, true);
			f1.attachEvent("onButtonClick",function(name){
				if(name=="submit"){ 
					var aud = new AjaxUtilDx("db/add",f1)
					aud.send();
				}
			});
			w1.hide();
			w1.setText("Add DB Connector");
		}
		
		function showModal() {
			w1.show();
		}
		
		function doOnUnload() {
			if (dhxWins != null && dhxWins.unload != null) {
				dhxWins.unload();
				dhxWins = w1 = w2 = w3 = null;
			}
		}
		
	</script>
</head>
<body onload="doOnLoad();" onunload="doOnUnload();">
	<div id="winVP"></div>
	<div class="controls">
		Window #1 <input type="button" value="show-modal" onclick="showModal();"><br>
	</div>
</body>
</html>