<%@ include file="/WEB-INF/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
	<title> User Login</title>
</head>
<script>
function doLogin() {
	var au = new AjaxUtil("user/loginaction", "it_userid,it_userpwd");
	au.send();
}

</script>

<body>
<div id="result"></div>
<table>
	<tr>
		<td> 아이디</td>
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
