<%@ include file="/WEB-INF/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function doAdd() {
		var params = "it_url,it_port,it_dbms,it_dbname,it_id,it_pwd";
		var au = new AjaxUtil("db/add", params);
		au.send();
	}
</script>
<body>
	<table border="1">
		<tr>
			<td colspan="2">신규데이터베이스 입력</td>
		</tr>
		<tr>
			<td>url</td>
			<td><input type="text" name="url" id="url"  value="jdbc:mysql://127.0.0.1:3306/iot"/></td>
		</tr>
		<tr>
			<td>port</td>
			<td><input type="text" name="port" id="port"  value="3306"/></td>
		</tr>
		<tr>
			<td>dbms</td>
			<td><input type="text" name="dbms" id="dbms" value="com.mysql.jdbc.Driver" /></td>
		</tr>
		<tr>
			<td>dbname</td>
			<td><input type="text" name="dbname" id="dbname"  value="mine"/></td>
		</tr>
		<tr>
			<td>id</td>
			<td><input type="text" name="id" id="id" value="root"/></td>
		</tr>
		<tr>
			<td>pwd</td>
			<td><input type="text" name="pwd" id="pwd" value="rnfma1"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="신규디비생성"
				onclick="doAdd()" /></td>
		</tr>
	</table>
</body>
</html>