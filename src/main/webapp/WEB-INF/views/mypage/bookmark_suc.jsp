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
        <c:forEach items="${bookmarklist }" var="list">
        ${list.trip_id}<p>
        ${list.category_id}<p>
        ${list.age_id}<p>
        ${list.food_id}<p>
        ${list.season_id}<p>
       ${ list.person_id}<p>
        ${ list.kpop_id}<p>
        ${ list.trip_nickname}<p>
        ${ list.trip_address}<p>
        ${ list.trip_image}<p>
        ${ list.trip_content}<p>
        ${ list.trip_time}<p>
        ${ list.trip_site}<p>
        ${ list.trip_tel}<p>
        ${ list.trip_way}<p>
        ${ list.trip_pay}<p>
        ${ list.trip_add1}<p>
        ${ list.trip_add2}<p>
        ${ list.trip_add3}<p>
        ${ list.trip_like}<p>
        ${ list.trip_view}<p>
        ${ list.pos_x}<p>
        ${ list.pos_y}<p>
       
        
         </c:forEach>
       


</body>
</html>