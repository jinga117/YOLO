<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행정보</title>
</head>
<body>
	<h2>여행 정보</h2>
<c:forEach items="${vo }" var="vo" >
		NO.${vo.trip_id }
		<input type="hidden" name="trip_id"  value ="${vo.trip_id }"><p>
		<input type="hidden" name="trip_category_id"  value ="${vo.trip_category_id }">
		여행지 : <input type="hidden" name="trip_nickname" >${vo.trip_nickname }  <p>
		주소 : <input type="hidden" name="trip_address">${vo.trip_address }  <p>
		이미지<img src="${vo.trip_image }" width="100px" height ="100px"><p>
		내용 : <input type="hidden" name="trip_content" >${vo.trip_content }<p>
		이용시간 : <input type="hidden" name="trip_time" >${vo.trip_time }<p>
		비용 : <input type="hidden" name="trip_pay" >${vo.trip_pay }<p>
		<input type="button"  onclick="location.href='delete?trip_id=${vo.trip_id}'" value="삭제하기"><br><hr>
	</c:forEach>
</body>
</html>