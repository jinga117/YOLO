<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<style type="text/css">
	.info_t{
		margin: 0 auto;
		 border: 1px solid grey;
	}
	.info_t tr, td{
		 border: 1px solid grey;
		 text-align: center;
	}
	h3{
		margin-top: 20px;
		text-align: center; 
	}
	h5{
		text-align: left;
		margin: -30px 30px 15px 30px ;
	}
	.info_list{
		margin: 0 auto;
		width: 90%
	}
</style>

	<!-- 컨텐츠 영역 시작 -->
<div class="info_list">
	<h3>여행지 리스트</h3> 
	<h5><a href="info_write">Add tripInfo</a></h5><hr>
		<table class="info_t">
			<c:forEach items="${list }" var="list">
				<tr>	
					<td>${list.trip_id}</td>
					<td>${list.category_id}</td>
					<td>${list.trip_nickname}</td>
					<td>${list.trip_address}</td>
					<td>${list.pos_x}</td>
					<td>${list.pos_y}</td>				
					<td><a href="update?trip_id=${list.trip_id}"><img src="img/update.png"></a></td>
					<td><a href="delete?trip_id=${list.trip_id}"><img src="img/delete.png"></a></td>
				</tr>
			</c:forEach>
		</table>
</div>
	<!-- 컨텐츠 영역 끝 -->
