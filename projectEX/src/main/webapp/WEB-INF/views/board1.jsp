<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>테이블명 : board_study</h1>
	<table border="1">
		<tr>
			<th><input type="checkbox"></input></th>
			<th>글번호</th>
			<th>작성자(ID)</th>
			<th>제목</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list1}" var="list1">
		<tr>
			<td><input type="checkbox"></input></td>
			<td>${list1.seq}</td>
			<td>${list1.memId}</td>
			<td>${list1.boardSubject}</td>
			<td><fmt:formatDate value="${list1.regDate}" dateStyle="LONG"/></td>
			<td>${list1.uptDate}</td>
			<td>${list1.viewCnt}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>