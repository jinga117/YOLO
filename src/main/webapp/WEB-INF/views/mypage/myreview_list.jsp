<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>내가 쓴 댓글 리스트</title>
</head>
<body>  
	<c:forEach items="${list }" var="list">
		<a href ="review_delete?review_no=${list.review_no }">X</a>
		<b>user_id : ${list.user_id }</b><br>
		<b>review_content : ${list.review_content }</b><br>
		<b>review_time : ${list.review_time }</b><hr>
		
	</c:forEach>
</body>
</html>