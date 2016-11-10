<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<title>리스트 페이지</title>
</head>
<body>
	리스트 <hr>
		<table>
		<c:forEach items="${list }" var="list">
			<tr>	
				<td>${list.trip_id}</td>
				<td>${list.trip_category_id}</td>
				<td>${list.trip_nickname}</td>
				<td>${list.trip_address}</td>
				<td>${list.trip_image}</td>
				<td>${list.trip_content}</td>
				<td>${list.trip_time}</td>
				<td>${list.trip_pay}</td>
			</tr>
		</c:forEach>
		</table>
</body>
</html>