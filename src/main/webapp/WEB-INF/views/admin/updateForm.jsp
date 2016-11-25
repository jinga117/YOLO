<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<title>여행지 수정</title>
</head>
<body>
	<form action="updateTrip" method="post">
		<table>
			<tr>
				<td>여행지정보</td>
				<td>카테고리</td>
				<td>연령</td>
				<td>음식</td>
				<td>계절</td>
				<td>동행</td>
				<td>한류</td>
				<td>이름</td>
				<td>전체 주소</td>
				<td>주소 1</td>
				<td>주소 2</td>
				<td>나머지 주소</td>
				<td>내용</td>
				<td>이용시간</td>
				<td>홈페이지</td>
				<td>전화번호</td>
				<td>가는방법</td>
				<td>비용</td>
				<td>위도</td>
				<td>경도</td>
			</tr>
			
			<tr>
				<td><input type="text" name="trip_id" readonly="readonly" value="${tvo.trip_id}"></td>
				<td><input type="text" name="category_id" value="${tvo.category_id}"></td>
				<td><input type="text" name="age_id" value="${tvo.age_id}"></td>
				<td><input type="text" name="food_id" value="${tvo.food_id}"></td>
				<td><input type="text" name="season_id" value="${tvo.season_id}"></td>
				<td><input type="text" name="person_id" value="${tvo.person_id}"></td>
				<td><input type="text" name="kpop_id" value="${tvo.kpop_id}"></td>
				<td><input type="text" name="trip_nickname" value="${tvo.trip_nickname}"></td>
				<td><input type="text" name="trip_address" value="${tvo.trip_address}"></td>
				<td><input type="text" name="trip_add1" value="${tvo.trip_add1}"></td>
				<td><input type="text" name="trip_add2" value="${tvo.trip_add2}"></td>
				<td><input type="text" name="trip_add3" value="${tvo.trip_add3}"></td>
				<td><input type="text" name="trip_content" value="${tvo.trip_content}"></td>
				<td><input type="text" name="trip_time" value="${tvo.trip_time}"></td>
				<td><input type="text" name="trip_site" value="${tvo.trip_site}"></td>
				<td><input type="text" name="trip_tel" value="${tvo.trip_tel}"></td>
				<td><input type="text" name="trip_way" value="${tvo.trip_way}"></td>
				<td><input type="text" name="trip_pay" value="${tvo.trip_pay}"></td>
				<td><input type="text" name="pos_x" value="${tvo.pos_x}"></td>
				<td><input type="text" name="pos_y" value="${tvo.pos_y}"></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>