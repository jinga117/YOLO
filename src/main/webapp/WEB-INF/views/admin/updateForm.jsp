<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
<style>
table {
	margin: 0 auto;
	width: 90%;
	text-align: center;
}
.info_update{
	margin: 0 auto;
	width: 80%;
	margin-bottom: 5%;
}
h3{
	margin-top: 20px;
	text-align: center; 
}
h5{
	text-align: right;
	margin: -30px 30px 15px 0 ;
}
#btn_update{
	height: 50px;
}
</style>
<div class="info_update">
	<h3>여행지 정보 수정</h3>
		<h5><a href="info_list">Back List</a></h5>
		<hr>
	<form method="post">
		<table>
			<tr>
				<td>trip_NO. </td><td><input type="text" name="trip_id" readonly="readonly" value="${tvo.trip_id}"></td><td>이름 </td><td><input type="text" name="trip_nickname" value="${tvo.trip_nickname}"></td><td>category_id </td><td><input type="text" name="category_id" value="${tvo.category_id}"></td></tr>
				<tr><td>age_id </td><td><input type="text" name="age_id" value="${tvo.age_id}"></td><td>food_id </td><td><input type="text" name="food_id" value="${tvo.food_id}"></td><td>season_id</td><td><input type="text" name="season_id" value="${tvo.season_id}"></td></tr>
				<tr><td>person_id </td><td><input type="text" name="person_id" value="${tvo.person_id}"></td><td>kpop_id</td><td><input type="text" name="kpop_id" value="${tvo.kpop_id}"></td></tr>
				<tr><td>전체 주소 </td><td colspan="5"><input type="text" name="trip_address" value="${tvo.trip_address}"></td></tr>
				<tr><td>주소 1 </td><td><input type="text" name="trip_add1" value="${tvo.trip_add1}"></td><td>주소 2 </td><td><input type="text" name="trip_add2" value="${tvo.trip_add2}"></td><td>나머지 주소 </td><td><input type="text" name="trip_add3" value="${tvo.trip_add3}"></td></tr>
				<tr><td>내용 </td><td colspan="5"><input type="text" name="trip_content" value="${tvo.trip_content}"></td></tr>
				<tr><td>이용시간 </td><td colspan="5"><input type="text" name="trip_time" value="${tvo.trip_time}"></td></tr>
				<tr><td>홈페이지 </td><td colspan="5"><input type="text" name="trip_site" value="${tvo.trip_site}"></td></tr>
				<tr><td>전화번호 </td><td><input type="text" name="trip_tel" value="${tvo.trip_tel}"></td><td>비용 </td>	<td><input type="text" name="trip_pay" value="${tvo.trip_pay}"></td></tr>
				<tr><td>가는방법 </td><td colspan="5"><input type="text" name="trip_way" value="${tvo.trip_way}"></td></tr>
				<tr><td>위도 </td><td><input type="text" name="pos_x" value="${tvo.pos_x}"></td><td>경도 </td><td><input type="text" name="pos_y" value="${tvo.pos_y}"></td>
			</tr>
			<tr id="btn_update">
				<td colspan="7" ><input type="submit" value="수정">&nbsp;&nbsp; <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</div>
	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->
	