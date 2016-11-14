<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

	table{
		 border-collapse: collapse;
	}
	tr, td{
		 border: 1px solid grey;
		 padding: 10px;
		 text-align: center;
	}
</style>
<title>리스트 페이지</title>
</head>
<body>
	리스트 <hr>
	
		<table>
			<tr>	
				<td>t00001</td>
				<td>c00001</td>
				<td>카테고리아이디	테스트</td>
				<td>서울시 어딘가</td>
				<td>이미지주소</td>
				<td>내용</td>
				<td>이용시간</td>
				<td>비용</td>
			</tr>
		<c:forEach items="${list }" var="list">
			<tr>	
				<td>${list.trip_id}</td>
				<td><a href="info?trip_category_id=${list.trip_category_id }">${list.trip_category_id}</a></td>
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