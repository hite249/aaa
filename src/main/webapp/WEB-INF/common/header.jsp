<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- ${pageContext.request.contextPath}  -->
<script src="<c:url value="/resources/js/jquery-2.2.1.min.js" />"></script>
<script src="<c:url value="/resources/js/common.js" />"></script>
<script src="<c:url value="/resources/js/dx/dhtmlx.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/dx/fonts/font_roboto/roboto.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/dx/dhtmlx.css" />"/>
<script>
var imgPath = "<c:url value='/resources/js/dx/imgs/' />";
</script>
<form id="urlForm" action="/exam/" onsubmit="return urlSubmit(this)" method="POST">
<input type="text" id="urlStr" name="urlStr" style="display:none"/>
</form>