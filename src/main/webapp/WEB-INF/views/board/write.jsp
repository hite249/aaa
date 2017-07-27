<%@ include file="/WEB-INF/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0" id="tablelist">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" id="subject" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content"></textarea></td>
		</tr>
	</table>
	<input type="button" value="등록" id="regiBtn" />
	<script>
		$("#regiBtn").click(function(){
			alert("누르면 등록");
		})
	</script>
</body>
</html>