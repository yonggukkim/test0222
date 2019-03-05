<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script >
	$(function (){ 
		$("#writeSubmit").click(function() {
			$("#writefrm").prop("method","post").prop("action","write").submit();
		})
	})
	
	$(function (){ 
		$("#modify").click(function() {
			$("#writefrm").prop("method","post").prop("action","modify").submit();
		})
	})
	$(document).ready(function(){
    	$("#writefrm :input:text:visible:enabled:first").focus();
    
	    $("#id").click(function(){
	    	$("input[name=memId]").focus();
	    })
	})
	
</script> -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form id="writefrm" accept-charset="utf-8">
			<c:choose>
			
			<c:when test="${modi ne null}">
			<input type="hidden" name="seq" value="${modi.seq}"/>
			<p>작성자 : <input type="text" name="memName" value="${modi.memName}" /></p>
			<p>id : <input type="text" name="memId" value="${modi.memId}" /></p>
			<p>제목 : <input type="text" name="boardSubject" value="${modi.boardSubject}" /></p>
			<p>내용 : <input type="text" name="boardContent" value="${modi.boardContent}" /></p>	
			<input type="button" value="수정" id="modify"/>
			</c:when>
			<c:otherwise>
			<p>작성자 : <input type="text" name="memName" /></p>
			<p id="id">id : <input type="text" name="memId" /></p>
			<p id="subject">제목 : <input type="text" name="boardSubject" /></p>
			<p id="content">내용 : <input type="text" name="boardContent" /></p>
			<input type="button" value="등록" id="writeSubmit" />
			</c:otherwise>
			</c:choose>
			<input type="button" value="취소" onClick="location.href='list'" />
		</form>
	</div>
</body>
</html>