<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script>
$(function() {
    $("#datepicker, #datepicker1").datepicker({
        dateFormat: 'yy/mm/dd'
    });
});
  </script>	
<script>
	$(function() {
		$("#write").click(function() {
			$("#frm").prop("method", "get").prop("action", "write").submit();
		})
	})
	$(function() {
		$("#search").click(function() {
			$("#frm").prop("method", "post").prop("action", "list").submit();
		})
	})
	$(function() {
		$("#delete").click(
				function() {
					var chkedLen = $("input[name=chk]:checked").length;
					if (chkedLen < 1) {
						alert("항목을 체크하세요");
					} else {
						$("#frm").prop("method", "post").prop("action",
								"delete").submit();
					}
				})
	})
	$(function() {
		$("#test").click(
				function() {
					var chkedLen = $("input[name=chk]:checked").length;
					if (chkedLen < 1) {
						alert("항목을 체크하세요");
					} else {
						$("#frm").prop("method", "post")
								.prop("action", "test1").submit();
					}
				})
	})

	// 체크를 통한 삭제
	$(function() {
		$("#allCheck").click(function() {
			// 체크박스가 체크라면
			if ($(this).is(":checked")) {
				// 모든 체크박스를 체크하라.
				$("#frm input[type=checkbox]").prop("checked", true);
			} else {
				$("#frm input[type=checkbox]").prop("checked", false);
			}
		})
	})

	function fncClick(box) {

		// alert($(box).val());

		var chkedLen = $("input[name=chk]:checked").length;
		var chkBoxLen = $("input[name=chk]").length;
		if (chkedLen == chkBoxLen) {
			$("#allCheck").prop("checked", true);
		} else {
			$("#allCheck").prop("checked", false);
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>테이블명 : board_study</h1>
	<form id="frm" accept-charset="utf-8">
		<select name="searchOption">
			<option value="all" >전체</option>
			<option value="writer" >작성자</option>
			<option value="title" >제목</option>
			<option value="content" >제목 + 내용</option>
		</select><input type="search" name="keyword" value="${keyword}"/><input type="button" value="검색" id="search" />
		<p><input type="text" id="datepicker" name="datepicker" autocomplete="off"> ~ <input type="text" id="datepicker1" name="datepicker1" autocomplete="off"></p>
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
			<c:choose>
			<c:when test="${ empty list}">
			<tr>
				<td>검색된 데이터가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
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
			</c:otherwise>
			</c:choose>
			<tr>
				<td><input type="button" value="글쓰기" id="write"></input></td>
				<td><input type="button" value="삭제" id="delete"></input></td>
				<td><input type="button" value="삭제" id="test"></input></td>
			</tr>
		</table>
		<div id="paging">
				<a href="#"><<</a>
				<a href="#"><</a>
				<c:forEach var="i" begin="${paging.startpage}" end="${paging.endpage}" step="1">
					<a href="list?nowPage=${i}">[${i}]</a>
				</c:forEach>
				<a href="#">></a>
				<a href="#">>></a>
		</div>
	</form>
</body>
</html>