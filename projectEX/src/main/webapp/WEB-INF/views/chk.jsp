<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.0.0.min.js" ></script>
<script>
	 $(document).ready(function(){ 
		 /*	//전체선택 체크박스 클릭 
		$("#allCheck").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allCheck").prop("checked")) { 
			//해당화면에 전체 checkbox들을 체크해준다 
			$("input[name=box]").prop("checked",true); 
			// 체크된 값 저장.....
			var boxvalue = [];
			var list = $( "input[name=box]");
			 for(var i = 0; i < list.length; i++){
			        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
			        	boxvalue.push(list[i].value);
			        }
			 }
			        //선택된 체크박스의 값을 콘솔에 출력
			        var str = '';
			        for(var i in boxvalue){
			            str += boxvalue[i]+' ';
			        }      
			        $('#console').html(str); 
			// 전체선택 체크박스가 해제된 경우 
			} else {  
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked",false); 
				var str = '';
		        for(var i in boxvalue){
		            str += boxvalue[i]+' ';
		        }      
		        $('#console').html(str);
			}
		})
		
		$("#checkboxId1").click(function(){
			if($("#checkboxId1").prop("checked")) {
				if($("input[name=box]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}else {
					$("#allCheck").prop("checked", false)
				}
				var boxvalue = [];
				var list = $( "input[name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("#allCheck").prop("checked",false);
				$("input[id=checkboxId1]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId2").click(function(){
			if($("#checkboxId2").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId2]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId3").click(function(){
			if($("#checkboxId3").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId3]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId4").click(function(){
			if($("#checkboxId4").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId4]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId5").click(function(){
			if($("#checkboxId5").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId5]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId6").click(function(){
			if($("#checkboxId6").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId6]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId7").click(function(){
			if($("#checkboxId7").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId7]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId8").click(function(){
			if($("#checkboxId8").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId8]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		})
		
		$("#checkboxId9").click(function(){
			if($("#checkboxId9").prop("checked")) {
				if($("input[type=checkbox]").prop("checked",true)) {
					$("#allCheck").prop("checked", true)
				}
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			} else {
				$("input[type=checkbox][id=checkboxId9]").prop("checked",false);
				var boxvalue = [];
				var list = $( "input[type=checkbox][name=box]");
				 for(var i = 0; i < list.length; i++){
				        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
				        	boxvalue.push(list[i].value);
				        }
				 }
				        //선택된 체크박스의 값을 콘솔에 출력
				        var str = '';
				        for(var i in boxvalue){
				            str += boxvalue[i]+' ';
				        }      
				        $('#console').html(str);
			}
		}) */
		
		$("#allCheck").click(function() {
			if($("#allCheck").prop("checked")) {
				$("input[name=box]").prop("checked",true);
			}else{
				$("input[name=box]").prop("checked",false);
			}
		})
		
		$("#checkboxId1").click(function() {
			if($("#checkboxId1").prop("checked")) {
				var a1 = $("#checkboxId1").val();
				$('#console').html(a1);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId2").click(function() {
			if($("#checkboxId2").prop("checked")) {
				var a2 = $("#checkboxId2").val();
				$('#console').html(a2);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId3").click(function() {
			if($("#checkboxId3").prop("checked")) {
				var a3 = $("#checkboxId3").val();
				$('#console').html(a3);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId4").click(function() {
			if($("#checkboxId4").prop("checked")) {
				var a4 = $("#checkboxId4").val();
				$('#console').html(a4);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId5").click(function() {
			if($("#checkboxId5").prop("checked")) {
				var a5 = $("#checkboxId5").val();
				$('#console').html(a5);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId6").click(function() {
			if($("#checkboxId6").prop("checked")) {
				var a6 = $("#checkboxId6").val();
				$('#console').html(a6);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId7").click(function() {
			if($("#checkboxId7").prop("checked")) {
				var a7 = $("#checkboxId7").val();
				$('#console').html(a7);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId8").click(function() {
			if($("#checkboxId8").prop("checked")) {
				var a8 = $("#checkboxId8").val();
				$('#console').html(a8);
			}else {
				$('#console').html("");
			}
		})
		
		$("#checkboxId9").click(function() {
			if($("#checkboxId9").prop("checked")) {
				var a9 = $("#checkboxId9").val();
				$('#console').html(a9);
			}else {
				$('#console').html("");
			}
		})
		
		
		$("#button1").click(function(){
			if($('input:checkbox[name="box"]:checked').length <= 4 && $('input:checkbox[name="box"]:checked').length != 0) {
			alert("완료");
		}else {
			alert("실패");
		}
		}) 
	})
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="checkbox" id="allCheck" />전체
		<input type="button" id="button1" value="확인" /><br/>
		<input type="checkbox" id="checkboxId1" name="box" class="box" value="컴퓨터" />컴퓨터
		<input type="checkbox" id="checkboxId2" name="box" class="box" value="마우스" />마우스
		<input type="checkbox" id="checkboxId3" name="box" class="box"value="키보드" />키보드
		<input type="checkbox" id="checkboxId4" name="box" class="box" value="본체" />본체
		<input type="checkbox" id="checkboxId5" name="box" class="box" value="모니터" />모니터
		<input type="checkbox" id="checkboxId6" name="box" class="box" value="충전기" />충전기
		<input type="checkbox" id="checkboxId7" name="box" class="box" value="배터리" />배터리
		<input type="checkbox" id="checkboxId8" name="box" class="box" value="모델" />모델
		<input type="checkbox" id="checkboxId9" name="box" class="box" value="브랜드" />브랜드
	</form>
	
	<div id="console">
  </div>
</body>
</html>