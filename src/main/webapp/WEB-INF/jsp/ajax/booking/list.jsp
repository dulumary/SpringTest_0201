<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>통나무 펜션</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
       

        <link rel="stylesheet" href="/ajax/css/style.css" type="text/css">
    </head>

    <body>
        <div id="wrap" >
            <header class="mt-4">
                <div class="text-center display-4">통나무 팬션</div>
                <nav class="mt-4">
                    <ul class="nav nav-fill">
                        <li class="nav-item"><a class="nav-link" href="/ajax/booking/main">팬션소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">객실보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ajax/booking/input">예약하기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ajax/booking/list">예약목록</a></li>
                    </ul>
                </nav>
            </header>

            <section>
            	<div class="my-5">
	                <h3 class="text-center">예약 목록 보기</h3>
	                <table class="table text-center">
	                	<thead>
	                		<tr>
	                			<th>이름</th>
	                			<th>예약날짜</th>
	                			<th>숙박일수</th>
	                			<th>숙박인원</th>
	                			<th>전화번호</th>
	                			<th>예약상태</th>
	                			<th></th>
	                		</tr>
	                	</thead>
	                	
	                	<tbody>
	                		<c:forEach var="booking" items="${bookingList }">
	                		<tr>
	                			<td>${booking.name }</td>
	                			<td><fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 d일" /></td>
	                			<td>${booking.headcount }</td>
	                			<td>${booking.day }</td>
	                			<td>${booking.phoneNumber }</td>
	                			<c:choose>
	                				<c:when test="${booking.state eq '대기중' }">
	                					<td class="text-info">${booking.state }</td>
	                				</c:when>
	                				<c:when test="${booking.state eq '확정' }">
	                					<td class="text-success">${booking.state }</td>
	                				</c:when>
	                				<c:when test="${booking.state eq '취소'}">
	                					<td class="text-danger">${booking.state }</td>
	                				</c:when>
	                				<c:otherwise>
	                					<td>${booking.state }</td>
	                				</c:otherwise>
	                			</c:choose>
	                			<td><button type="button" class="btn btn-danger btn-sm delete-btn" data-booking-id="${booking.id }">삭제</button></td>
	                			
	                		</tr>
	                		</c:forEach>
	                	
	                	</tbody>
	                
	                </table>
                </div>
            </section>
           

            <footer class="mt-3 ml-4">
                <address>
                    제주특별자치도 제주시 애월읍  <br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목 <br>
                    Copyright 2025 tongnamu All right reserved
                </address>

            </footer>


        </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function() {
 
        	$(".delete-btn").on("click", function() {
        		
        		// 이벤트가 발생한 버튼의 data-booking-id 값을 얻어 온다. 
        	 	let id = $(this).data("booking-id");
        		
        		$.ajax({
        			type:"get"
        			, url:"/ajax/booking/delete"
        			, data:{"id":id}
        			, success:function(data) {
        				// 성공 : {"result":"success"}
        				// 실패 : {"result":"fail"}
        				if(data.result == "success") {
        					location.reload();
        				} else {
        					alert("삭제 실패");
        				}
        			}
        			, error:function() {
        				alert("삭제 에러!");
        			}
        		});
        		
        		
        	});
        	
        } );
    </script> 
    </body>
</html>