<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 리스트</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>즐겨찾기 리스트</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="favorite" items="${favoriteList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${favorite.name }</td>
					<td>${favorite.url }</td>
					<td><button type="button" data-favorite-id="${favorite.id }" class="btn btn-danger btn-sm delete-btn">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		
		</table>
	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(".delete-btn").on("click", function() {
			
			// 버튼 태그에 삭제 대상 id 속성이 부여된 상태 data-favorite-id
			// 이벤트가 발생한 그 버튼 태그의 data-favorite-id 속성 값을 가져온다. 
			// 삭제 대상의 id를 얻어 올 수 있다. 
			let favoriteId = $(this).data("favorite-id");
			
			
			$.ajax({
				type:"get"
				, url:"/ajax/favorite/delete"
				, data:{"id":favoriteId}
				, success:function(data) {
					// 성공 : {"result":"success"}
					// 실패 : {"result":"fail"}
					if(data.result == "success") {
						// 새로고침
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
				, error:function() {
					alert("삭제 에러");
				}
			});
			
		}); 
	});

</script>
</body>
</html>