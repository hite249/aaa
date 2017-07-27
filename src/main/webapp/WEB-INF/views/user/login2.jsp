<%@ include file="/WEB-INF/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title> User Login</title>
</head>
<script>
function doLogin() {
	var data = {};
	data["userid"] = $("input[name=userid]").val();
	data["userpwd"] = $("input[name=userid]").val();
	//alert(JSON.stringify(data));
	
	$.ajax({ 
        type     : "POST"
    ,   url      : "/exam/user/login"
    ,   dataType : "json" 
    ,   beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "application/json");
        xhr.setRequestHeader("Content-Type", "application/json");
    }
    ,   data     : JSON.stringify(data)
    ,   success : returnLogin
    /*
    ,   success  :function(json) {
    	var url = json.url;
    	var data = json.data;
    	var msg = json.msg;
	}
    */
    ,
	error : function(xhr, status, e) {
    	alert(e);
   	 $('#result').html(e);
	},
	done : function(e) {
		alert("DONE");
	}
	});

}

function returnLogin(result){
	alert(result);
}
</script>

<body>
<div id="result"></div>
<table>
	<tr>
		<td> 아이디1</td>
		<td> <input type="text" name="userid"> </td>
	</tr>
	<tr>
		<td> 패스워드</td>
		<td> <input type="password"  name="userpwd"> </td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="로그인" onclick="doLogin()"></td>
	</tr>
</table>
</body>
</html>
