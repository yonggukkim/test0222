<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script>
	$(document).ready(function() {
		load();
		
		$(document).on('click','#datepicker, #datepicker1', function(){
			alert($(this));
			$(this).datepicker({
		        dateFormat: 'yy/mm/dd'
			});
		});
		// 파일 업로드 유효성 검사 시작
		$("#file").on("change", function() {
			// 필드 채워지면
			alert($(this).val());
			if($(this).val() != "") {
				// 확장자 체크
				var ext = $(this).val().split(".").pop().toLowerCase();
				if($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1) {
					alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
					$(this).val("");
					return;
				}
				
				// 용량 체크
				var fileSize = this.files[0].size;
				var maxSize = 1024 * 1024;
				if(fileSize > maxSize) {
					alert("파일용량 1MB를 초과했습니다.");
					$(this).val("");
					return;
				}
				
				// 가로, 세로 길이
				alert(this.files[0]);
				var file = this.files[0];
				var url = window.URL || window.webkitURL;
				var img = new Image();
				
				img.src = url.createObjectURL(file);
				alert(img.src);
				img.onload = function() {
					alert(img.width);
					alert(img.height);
					var wwd = 200;
					var hhd = 200;
					if(img.width > wwd) {
						alert('첨부한 이미지의 가로사이즈는'+img.width+'입니다.\n\n이미지의가로사이즈는'+wwd+'이하여야합니다.');
						alert($('#file').val());
						$('#file').val("");
						return;
					}
					if(img.height > hhd) {
						alert('첨부한 이미지의 세로사이즈는'+img.height+'입니다.\n\n이미지의세로사이즈는'+hhd+'이하여야합니다.');
						$('#file').val("");
						return;
					}
				}
			}else {
				alert('이미지를 선택해주세요.');
			}
		});
		// 파일 업로드 유효성 검사 끝
		
		$(document).on('click','#search', function() {
			alert("시작버튼");
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/ajax',
				data : $('#frm').serialize(),
				success : function(html) {
					alert(html);
					$('#other').html(html);
				},
				error : function(data) {
					alert(data);
				}
			});
			alert("끝버튼");
		});
		
		$(document).on('click','#ajaxfirstPage', function() {
			alert("ajax시작");
			ajaxPaging(1);
			alert("ajax끝");
		});
		
		$(document).on('click','#ajaxprevBlockPage', function() {
			alert($("#pageNow").val());
			var page = $("#pageNow").val();
			page = parseInt(page) - 4;
			if(page <= $("#firstPage").val()) {
				var page = $("#firstPage").val();
			}
			alert(page);
			alert("ajax시작");
			ajaxPaging(page);
			alert("ajax끝");
		});
		
		$(document).on('click','.pageGroup', function() {
			var page = $(this).val();
			alert("pppp:"+page);
			alert("ajax시작");
			ajaxPaging(page);
			alert("ajax끝");
		});
		
		$(document).on('click','#ajaxnextBlockPage', function() {
			alert($("#pageNow").val()); // 1
			alert($("#maxPage").val()); // 9
			var page = $("#pageNow").val();
			page = parseInt(page) + 4;
			if(page >= $("#maxPage").val()) {
				page = $("#maxPage").val();
			}	
			alert(page); // 14
			alert("ajax시작");
			ajaxPaging(page);
			alert("ajax끝");
		});
		
		$(document).on('click','#ajaxmaxPage', function() {
			var page = $("#maxPage").val();
			alert("ajax시작");
			ajaxPaging(page);
			alert("ajax끝");
		});
		
		$(document).on('click','#write', function() {
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/write',
				success : function(html) {
					alert(html);
					$('#other').html(html);
				},
				error : function(data) {
					alert(data);
				}
			});
		});
		
		$(document).on('click','#writeSubmit', function() {
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/write',
				data : $('#writefrm').serialize(),
				success : function(html) {
					alert(html);
					$('#other').html(html);
				},
				error : function(data) {
					alert(data);
				}
			});
		});
		
		$(document).on('click','#delete', function() {
			var chk = $('#chk').val();
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/delete',
				data : {'chk':chk},
				success : function(html) {
					alert(html);
					$('#other').html(html);
				},
				error : function(data) {
					alert(data);
				}
			});
		});
		
		$(document).on('click','#excel', function() {
			$('#frm').prop("method", "post").prop("action","excel").submit();
		});
		
		$("#delete").click( function() {
			var chkedLen = $("input[name=chk]:checked").length;
			if (chkedLen < 1) {
				alert("항목을 체크하세요");
			} else {
				$("#frm").prop("method", "post").prop("action","delete").submit();
			}
		});
		
		$("#test").click( function() {
			var chkedLen = $("input[name=chk]:checked").length;
			if (chkedLen < 1) {
				alert("항목을 체크하세요");
			} else {
				$("#frm").prop("method", "post").prop("action", "test1").submit();
			}
		});
		
		$("#allCheck").click(function() {
			// 체크박스가 체크라면
			if ($(this).is(":checked")) {
				// 모든 체크박스를 체크하라.
				$("#frm input[type=checkbox]").prop("checked", true);
			} else {
				$("#frm input[type=checkbox]").prop("checked", false);
			}
		});
		
	});

	function load(){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/ajax',
			success : function(html) {
				alert(html);
				$('#other').html(html);
			},
			error : function(data) {
				alert(data);
			}
		});
	};
	
	function ajaxPaging(page){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/ajax',
			data : {'keyword':$('#keyword').val(),
					'searchOption':$('#searchOption').val(),
					'datepicker':$('#datepicker').val(),
					'datepicker1':$('#datepicker1').val(),
					'nowPage':page},
			success : function(html) {
				alert(html);
				$('#other').html(html);
			},
			error : function(data) {
				alert(data);
			}
		});
	};
	
	function fncClick(box) {
		// alert($(box).val());
		var chkedLen = $("input[name=chk]:checked").length;
		var chkBoxLen = $("input[name=chk]").length;
		if (chkedLen == chkBoxLen) {
			$("#allCheck").prop("checked", true);
		} else {
			$("#allCheck").prop("checked", false);
		}
	};
	
	/* $(function() {
		$("#write").click(function() {
			$("#frm").prop("method", "get").prop("action", "write").submit();
		})
	}) */

</script>
<body> 
<form name="fileFrm" enctype="multipart/form-data" action="upload" method="post">
<input type="file" name="file" id="file" multiple="multiple">
<input type=submit value="전송">
<a href="download?filename=그림저장.png">adsa</a>
<!-- <img border="0" name="preview" >style="visibility:hidden;" -->
</form>
<div id="other"></div>
</body>
</html>