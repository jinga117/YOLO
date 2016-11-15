<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
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
</style>
<title>리스트 페이지</title>
</head>
<body>
	리스트 <hr>
		<table>
		<c:forEach items="${list }" var="list">
			<tr>	
				<td><a href="info?trip_id=${list.trip_id }">${list.trip_id}</td>
				<td>${list.category_id}</a></td>
				<td>${list.age_id}</td>
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
				<td>${list.trip_video}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="write">글쓰기</a>
</body>
</html>