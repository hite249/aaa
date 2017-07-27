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
	<input type="hidden" value="list" name="mode" id="mode" />
	<input type="hidden" value="role" name="role" id="" />
	<input type="button" value="글쓰기" id="regiBtn" />
	<br><a href="#" onclick="pageMove('/user/userlist')">권한설정하기</a>
<script>
	$(document).ready(function(){
		var au = new AjaxUtil("board/boardaction","mode");
		au.setCallbackSuccess(returnList);
		au.send();
	})
	function returnList(list){
		var url = list.url;
		var data = list.data;
		var role = list.role;
		var msg = list.msg;
		$("#role").val(role);
		if(role==null){
			alert("리스트 보기 권한이 없습니다.");
			pageMove("/user/userlist");
		}else{
			$("#tablelist").html("<tr><th>제목</th><th>내용</th><th>글쓴이</th><th>수정</th><th>삭제</th></tr>");
	    	for(i=0; i<data.length;i++){
	    		$("#tablelist").append("<tr><td>"+data[i].SUBJECT+"</td><td>"+data[i].CONTENT+"</td><td>"+data[i].WRITER+"</td><td><input type='button' value='수정' id='modBtn' /></td><td><input type='button' value='삭제' id='delBtn' /></td></tr>");
	    	}
		}
	}
	$("#regiBtn").click(function(){
		var au = new AjaxUtil("board/boardwrite","mode,role");
		au.send();
	})
	$("#modBtn").click(function(){
		alert(1);
		var au = new AjaxUtil("board/boardmod","mode,role");
		au.send();
	})
	$("#delBtn").click(function(){
		var au = new AjaxUtil("board/boarddel","mode,role");
		au.send();
	})
</script>
</body>
</html>