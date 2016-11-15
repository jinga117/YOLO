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
	<fieldset style="width: 500px">
		<legend>
			연령별 리스트
		</legend>
		<a href="young">꽃청춘</a>
		<a href="old">꽃중년</a>		
	</fieldset>
	
	<br><br><br>
		<table>
		<c:forEach items="${ageList }" var="ageList">
			<tr>	
				<td>${ageList.trip_id}</td>
				<td>${ageList.category_id }</td>
				<td>${ageList.age_id }</td>
				<td>${ageList.season_id }</td>
				<td>${ageList.person_id }</td>
				<td>${ageList.kpop_id }</td>
				<td>${ageList.trip_nickname}</td>
				<td>${ageList.trip_address}</td>
				<td>${ageList.trip_add1}</td>
				<td>${ageList.trip_add2}</td>
				<td>${ageList.trip_add3}</td>
				<td>${ageList.trip_image}</td>
				<td>${ageList.trip_content}</td>
				<td>${ageList.trip_time}</td>
				<td>${ageList.trip_site}</td>
				<td>${ageList.trip_tel}</td>
				<td>${ageList.trip_way}</td>
				<td>${ageList.trip_pay}</td>
				<td>${ageList.trip_like}</td>
				<td>${ageList.trip_view}</td>
				<td>${ageList.trip_video}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="write">글쓰기</a>
</body>
</html>