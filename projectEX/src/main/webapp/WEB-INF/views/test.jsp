<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.0.0.min.js" ></script>
<script>
	$(function(){
		$("#allCheck").click(function(){
			// 체크박스가 체크라면
			if($(this).is(":checked")) {
				// 모든 체크박스를 체크하라.
				$("#dvMid input[type=checkbox]").prop("checked",true);
				var all = []
				var a = $( "input[name=box]:checked");
				for(var i = 0; i < a.length; i++){
			        if(a[i].checked){ //선택되어 있으면 배열에 값을 저장함
				all.push(a[i].value);
			        }
				}
				var str = '';
		        for(var i in all){
		            str += all[i]+'';
		        }      
		        $('#dvBottom').html(str);
			}else {
				$("#dvMid input[type=checkbox]").prop("checked",false);
				var str = '';
				$('#dvBottom').html(str);
			}
		})
	})
	
	function fncOk() {
		var chkedLen = $("input[name=box]:checked").length;
		if(chkedLen < 1) {
			alert("항목을 체크하세요");
			return; // 여기까지만 실행하고 싶을 때 값이 없으면 그냥 return 값이 있다면 fasle까지 써주는게 좋다.
		}else if(chkedLen <= 4 || $("#allCheck").is(":checked")) {
			alert("등록 성공");
		}else {
			alert("등록 실패");
		}
	}
	
	function fncClick(box) {
		
		// alert($(box).val());
		
		var chkedLen = $("input[name=box]:checked").length;
		var chkBoxLen = $("input[name=box]").length;
		if(chkedLen == chkBoxLen) {
			$("#allCheck").prop("checked",true);
		}else {
			$("#allCheck").prop("checked",false);
		}
		
		// 체크가 되어 있으면
		if($(box).prop("checked")==true) {
			$("#dvBottom").append($(box).val()); // 그 값을 div에 추가하라.
		}else { // 체크가 안되어있으면
			var txt = $("#dvBottom").text().replace($(box).val(),""); // div에 있는 텍스트와 같은 값을 공백으로 바꿔라.
			$("#dvBottom").text(txt);
		}
	}
</script>
</head>
<body>
<%-- <%
	String txt = (String)request.getAttribute("key");
%>
	<c:out value="${key}"></c:out> --%>
	<div>
		<input type="checkbox" id="allCheck" /><label for="allCheck">전체</label>
		<input type="button" id="button1" value="확인" onclick=fncOk(); /><br/>
	</div>
	<div id="dvMid">
		<input type="checkbox" id="chk1" name="box" onclick=fncClick(this); value="컴퓨터" />컴퓨터
		<input type="checkbox" id="chk2" name="box" onclick=fncClick(this); value="마우스" />마우스
		<input type="checkbox" id="chk3" name="box" onclick=fncClick(this); value="키보드" />키보드
		<input type="checkbox" id="chk4" name="box" onclick=fncClick(this); value="본체" />본체
		<input type="checkbox" id="chk5" name="box" onclick=fncClick(this); value="모니터" />모니터
		<input type="checkbox" id="chk6" name="box" onclick=fncClick(this); value="충전기" />충전기
		<input type="checkbox" id="chk7" name="box" onclick=fncClick(this); value="배터리" />배터리
		<input type="checkbox" id="chk8" name="box" onclick=fncClick(this); value="모델" />모델
		<input type="checkbox" id="chk9" name="box" onclick=fncClick(this); value="브랜드" />브랜드
	</div>
	<div id="dvBottom">
	</div>
</body>
</html>