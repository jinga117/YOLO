<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>  
	<c:forEach items="${list }" var="list">
		<b>user_id : ${list.user_id }</b><br>
		<b>review_content : ${list.review_content }</b><br>
		<b>review_time : ${list.review_time }</b><hr>
	</c:forEach>
</body>
</html>