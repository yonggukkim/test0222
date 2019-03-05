<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "inline; filename=myfile.xls");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
			<tr>
				<th><input type="checkbox" id="allCheck"></input></th>
				<th>글번호</th>
				<th>작성자(ID)</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><input type="checkbox" value="${list.seq}" name="chk"></input></td>
					<td>${list.seq}</td>
					<td>${list.memName}(${list.memId})</td>
					<td><a href="modify?seq=${list.seq}" id="reload">${list.boardSubject}</a></td>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${list.uptDate}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>