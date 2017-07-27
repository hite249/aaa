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
	</table>
	<script>
		$(document).ready(function(){
			var au = new AjaxUtil("/user/userlistaction","it_mode");
			au.setCallbackSuccess(returnList);
			au.send(); 
		})
		
		function returnList(list){
			var url = list.url;
			var data = list.data;
			var role = list.role;
	    	var msg = list.msg;
	    	$("#tablelist").html("<tr><th>아이디</th><th>비밀번호</th><th>삭제</th><th>게시판권한</th></tr>");
	    	for(i=0; i<data.length;i++){
	    		$("#tablelist").append("<tr><td>"+data[i].user_id+"</td><td>"+data[i].user_pwd+"</td><td><input type='button' value='삭제' onclick='mdel(\""+data[i].user_id+"\");' ></td></tr>");
	    	}			
		}
	</script>
	<input type="hidden" name="mode" id="mode" value="list"/>
	<input type="hidden" name="userid" id="userid" value=""/>
	<input type="hidden" name="role" id="role" value=""/>
</body>
</html>