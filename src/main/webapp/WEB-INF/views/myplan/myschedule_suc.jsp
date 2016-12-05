<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<c:forEach items="${list }" var="list">         
	${list.user_id }<br>
 ${ list.trip_start} <br>
  ${ list.trip_title} <br>
    ${list.plan_no}<br>
		<c:if test="${list.trip_id_1 !=''}">
			<img src="img/photo/${ list.trip_id_1}.jpg">
			<br>
		</c:if>
  
  ${ list.trip_nickname_1}<br>
   ${list.trip_plan_memo_1 }<br>
    ${list.trip_plan_pay_1 }<br>
		<c:if test="${list.trip_id_2 !=''}">
			<img width="70" height="70" src="img/photo/${list.trip_id_2 }.jpg">
			<br>
		</c:if>
  ${ list.trip_nickname_2} <br>${ list.trip_plan_memo_2}<br>${ list.trip_plan_pay_2}
     <c:if test="${list.trip_id_3 !=''}">
   <img width="70" height="70" src="img/photo/${list.trip_id_3}.jpg">
	</c:if>
		<br>
   ${list.trip_nickname_3}<br>${list.trip_plan_memo_3 }<br>${list.trip_plan_pay_3 }<br><br><br>
</c:forEach>

</body>