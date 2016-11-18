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
			<c:forEach items="${list }" var="list">
				<tr>	
					<td>${list.user_id}</td>
					<td>${list.password}</td>
					<td>${list.email}</td>
					<td>${list.gender}</td>
					<td>${list.age}</td>
					<td>${list.isadmin}</td>
					<td>${list.area}</td>
					<td><input type="button" value="수정" onclick="location.href='/yolo/user_update?user_id=${list.user_id}'"></td>
					<td><input type="button" value="삭제" onclick="location.href='/yolo/user_delete?user_id=${list.user_id}'"></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>