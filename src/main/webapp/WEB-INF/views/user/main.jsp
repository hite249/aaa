<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/header.jsp" %>

<html>
<head>
	<title> User Main</title>
</head>
<body>
<script>

function doMovePage(url) {
	var data = {};
	data["url"] = url;
	
	$.ajax({ 
        type     : "POST"
    ,   url      : "/exam/pagemove"
    ,   dataType : "json" 
    ,   beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "application/json");
        xhr.setRequestHeader("Content-Type", "application/json");
    }
    ,   data     : JSON.stringify(data)
    ,   success  :function(json) {
    	alert(json);
    	$("#resultDiv").html(json);
	},
	error : function(xhr, status, e) {
    	alert(e);
   	 $('#result').html(e);
	},
	done : function(e) {
		alert("DONE");
	}
	});
}
</script>
메인 페이지 <br>
${userid}님 반갑습니다.

<br><a href="/exam/user/logoutaction">로그아웃</a>
<br><a href="#" onclick="pageMove('/user/join')">회원가입</a>
<br><a href="#" onclick="pageMove('/user/userlist')">회원리스트</a>
<br><a href="#" onclick="pageMove('/board/list')">게시판리스트</a>
<br><a href="#" onclick="pageMove('/db/main_dbms')">디비연결</a>
<br><a href="#" onclick="pageMove('/db/open_modal')">디비추가</a>
<div id="resultDiv"></div>
</body>
</html>