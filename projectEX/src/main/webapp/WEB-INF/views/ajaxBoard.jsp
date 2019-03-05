<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<h1>테이블명 : board_study</h1>
		<form id="frm" accept-charset="utf-8">
			<select id="searchOption" name="searchOption">
				<option value="all" <c:if test="${reset.searchOption eq 'all'}">selected</c:if>>전체</option>
				<option value="writer" <c:if test="${reset.searchOption eq 'writer'}">selected</c:if>>작성자</option>
				<option value="title" <c:if test="${reset.searchOption eq 'title'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${reset.searchOption eq 'content'}">selected</c:if>>제목 + 내용</option>
			</select><input type="search" id="keyword" name="keyword" value="${reset.keyword}"/><input type="button" value="검색" id="search" />
			<p><input type="text" id="datepicker" name="datepicker" value="${reset.datepicker}" autocomplete="off"> ~ <input type="text" id="datepicker1" name="datepicker1" value="${reset.datepicker1}" autocomplete="off"></p>
			<div id="ajaxtest"></div>
		</form>
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
				<td colspan="7">검색된 데이터가 없습니다.</td>
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
				<td><input type="button" value="엑셀다운로드" id="excel"></input></td>
			</tr>
		</table>
<!-- 		 style="cursor:pointer;" -->
		<div id="ajaxpaging">
			<button id="ajaxfirstPage" >&lt;&lt;</button>
			<button id="ajaxprevBlockPage" >&lt;</button>
			<c:forEach var="j" begin="${paging.startpage }" end="${paging.endpage }">
				<button type="button" class="pageGroup" value=${j }>${j }</button>
			</c:forEach>
			<button id="ajaxnextBlockPage" >&gt;</button>
			<button id="ajaxmaxPage" >&gt;&gt;</button>
			<input type="hidden" id="pageNow" value="${paging.nowPage }" />
			<input type="hidden" id="firstPage" value="${paging.firstPage }" />
			<input type="hidden" id="maxPage" value="${paging.maxpage }" />
		</div>