<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<label>제목</label>
		<input type="text" class="form-control" id="titleInput">
		<label class="mt-3">주소</label>
		<div class="d-flex">
			<input type="text" class="form-control col-11" id="urlInput">
			<button type="button" class="btn btn-success" id="duplicateBtn">중복확인</button>
		</div>
		<div class="text-danger small d-none" id="duplicateText">중복된 url 입니다</div>
		<div class="text-info small d-none" id="availableText">저장 가능한 url 입니다.</div>
		<button type="button" class="btn btn-success btn-block mt-3" id="addBtn">추가</button>
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		
		$("#duplicateBtn").on("click", function() {
			let url = $("#urlInput").val();
			
			if(url == "") {
				alert("주소를 입력하세요");
				return ;
			}
			
			// 주소가 http:// 로 시작하지 않고 https:// 로 시작하지 않으면 
			if(!url.startsWith("http://") && !url.startsWith("https://")) {
				alert("주소형식을 확인해 주세요");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/ajax/favorite/duplicate-url"
				, data:{"url":url}
				, success:function(data) {
					// 중복 : {"isDuplicate":true}
					// 중복 아님 : {"isDuplicate":false}
					if(data.isDuplicate) {
						$("#duplicateText").removeClass("d-none");
						$("#availableText").addClass("d-none");
					} else {
						$("#availableText").removeClass("d-none");
						$("#duplicateText").addClass("d-none");
					}
					
				}
				, error:function() {
					alert("중복확인 에러!");
				}
			});
			
		});
		
		$("#addBtn").on("click", function() {
			
			let title = $("#titleInput").val();
			let url = $("#urlInput").val();
			
			if(title == "") {
				alert("제목을 입력하세요");
				return ;
			}
			
			if(url == "") {
				alert("주소를 입력하세요");
				return ;
			}
			
			// 주소가 http:// 로 시작하지 않고 https:// 로 시작하지 않으면 
			if(!url.startsWith("http://") && !url.startsWith("https://")) {
				alert("주소형식을 확인해 주세요");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/ajax/favorite/create"
				, data:{"name":title, "url":url}
				, success:function(data) {
					// 성공 : {"result":"success"}
					// 실패 : {"result":"fail"}
					if(data.result == "success") {
						// 리스트페이지로 이동
						location.href = "/ajax/favorite/list";
					} else {
						alert("추가 실패");	
					}
					
				}
				, error:function() {
					alert("추가 에러!!");
				}
			});
			
			
		});
		
		
		
	});

</script>
</body>
</html>