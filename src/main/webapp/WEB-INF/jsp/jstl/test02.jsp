<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOT 5</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class="container">
	
		<h2>HOT 5</h2>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="music" items="${musicRanking }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${music }</td>
				</tr>
				</c:forEach>
				
			</tbody>
		
		</table>
		
		
		<h2>멤버십</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.name }</td>
					<td>${member.phoneNumber }</td>
					
					<c:choose>
						<c:when test="${member.grade eq 'VIP' }">
							<td class="text-danger">${member.grade }</td>	
						</c:when>
						<c:when test="${member.grade eq 'GOLD' }">
							<td class="text-warning">${member.grade }</td>
						</c:when>
						<c:otherwise>
							<td>${member.grade }</td>	
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${member.point >= 5000 }">
							<td class="text-primary">${member.point }P</td>	
						</c:when>
						<c:otherwise>
							<td>${member.point }P</td>
						</c:otherwise>
					</c:choose>
					
					
				</tr>
				</c:forEach>
			</tbody>
			
		</table>
	
	</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>