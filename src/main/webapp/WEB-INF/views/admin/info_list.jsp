<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	<style type="text/css">
	table{
		 border-collapse: collapse;
		 width: 700px;;
	}
	tr, td{
		 border: 1px solid grey;
		 padding: 10px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	h3{
	margin-top: 20px;
	text-align: center; 
	}
	h5{
	text-align: left;
	margin: -30px 30px 15px 0 ;
	}
</style>
	<!-- 컨텐츠 영역 시작 -->

	<h3>여행지 리스트</h3> 
	<h5><a href="info_write">Add tripInfo</a></h5><hr>
		<table>
			<c:forEach items="${list }" var="list">
				<tr>	
					<td><a href="info?trip_id=${list.trip_id }">${list.trip_id}</a></td>
					<td>${list.category_id}</td>
					<td>${list.age_id}</td>
					<td>${list.food_id}</td>
					<td>${list.person_id}</td>
					<td>${list.season_id}</td>
					<td>${list.trip_nickname}</td>
					<td>${list.trip_address}</td>
					<td>${list.trip_add1}</td>
					<td>${list.trip_add2}</td>
					<td>${list.trip_add3}</td>
					<td>${list.trip_image}</td>
					<td>${list.trip_content}</td>
					<td>${list.trip_time}</td>
					<td>${list.trip_site}</td>
					<td>${list.trip_tel}</td>
					<td>${list.trip_way}</td>
					<td>${list.trip_pay}</td>
					<td>${list.trip_like}</td>
					<td>${list.trip_view}</td>
					<td>${list.trip_review}</td>
					<td>${list.pos_x}</td>
					<td>${list.pos_y}</td>				
					<td><input type="button" value="수정" onclick="location.href='update?trip_id=${list.trip_id}'"></td>
					<td><input type="button" value="삭제" onclick="location.href='delete?trip_id=${list.trip_id}'"></td>
				</tr>
			</c:forEach>
		</table>

	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->
	