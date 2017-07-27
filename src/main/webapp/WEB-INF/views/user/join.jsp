<%@ include file="/WEB-INF/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title> User Login</title>
</head>
<script>
function doJoin() {
	var params = "it_userid,it_userpwd,it_username,s_admin,s_boardadmin,it_age";
	var au = new AjaxUtil("user/signin", params);
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
		<td> 유저이름</td>
		<td> <input type="text" name="username"> </td>
	</tr>
	<tr>
		<td> 관리자여부</td>
		<td><select name="admin">
			<option value="1">Y</option>
			<option value="0">N</option>
		</select> </td>
	</tr>
	<tr>
		<td> 게시판관리자여부</td>
		<td><select name="boardadmin">
			<option value="1">Y</option>
			<option value="0">N</option>
		</select> </td>
	</tr>
	<tr>
		<td> 나이</td>
		<td> <input type="text"  name="age"> </td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="로그인" onclick="doJoin()"></td>
	</tr>
</table>
</body>
</html>
