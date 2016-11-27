<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
	<div>
		<h3 align="center">정보 입력 페이지</h3>
		<hr>
		<form method="post">
			<table>
				<tr>
					<td>여행지key값</td>
					<td><input type="text" name="trip_id" size="50"></td>
				</tr>

				<tr>
					<td>카테고리key값</td>
					<td>
						<select name="category_id" style="width: 10em;">
							<option value="c01">명소</option>
							<option value="c02">쇼핑</option>
							<option value="c03">먹거리</option>
						</select>
					</td>
				</tr>

				<tr>
					<td rowspan="5">테마별</td>
					<td id=check colspan="2">
						<input type="checkbox" name="age_id"value="a01">꽃청춘 
						<input type="checkbox" name="age_id"value="a02">꽃중년
					</td>
				</tr>

				<tr>
					<td id=check colspan="2">
						<input type="checkbox" name="food_id"value="f01">식당
						<input type="checkbox" name="food_id"value="f02">카페
					</td>
				</tr>

				<tr>
					<td id=check colspan="2">
						<input type="checkbox"name="season_id" value="s01">봄 
						<input type="checkbox"name="season_id" value="s02">여름 
						<input type="checkbox"name="season_id" value="s03">가을 
						<input type="checkbox"name="season_id" value="s04">겨울
					</td>
				</tr>

				<tr>
					<td id=check colspan="2">
						<input type="checkbox"name="person_id" value="p01">나홀로
					 	<input type="checkbox"name="person_id" value="p02">커플 
					 	<input type="checkbox"name="person_id" value="p03">우정 
						<input type="checkbox"name="person_id" value="p04">가족
					</td>
				</tr>

				<tr><td id=check colspan="2"><input type="checkbox" name="kpop_id" value="k01">kpop</td></tr>

				<tr><td>여행지 별칭</td><td><input type="text" name="trip_nickname" size="50"></td></tr>
				<tr><td>전체 주소</td><td><input type="text" name="trip_address" size="50"></td></tr>
				<tr><td>시</td><td><input type="text" name="trip_add1" size="50"></td></tr>
				<tr><td>구</td><td><input type="text" name="trip_add2" size="50"></td></tr>
				<tr><td>나머지 주소</td><td><input type="text" name="trip_add3" size="50"></td></tr>
				<tr><td>내용</td><td><input type="text" name="trip_content" size="50"></td></tr>
				<tr><td>이용시간</td><td><input type="text" name="trip_time" size="50"></td></tr>
				<tr><td>홈페이지</td><td><input type="text" name="trip_site" size="50"></td></tr>
				<tr><td>전화번호</td><td><input type="text" name="trip_tel" size="50"></td></tr>
				<tr><td>가는방법</td><td><input type="text" name="trip_way" size="50"></td></tr>
				<tr><td>비용</td><td><input type="text" name="trip_pay" size="50"></td></tr>
				<tr><td>위도</td><td><input type="text" name="pos_x" size="50"></td></tr>
				<tr><td>경도</td><td><input type="text" name="pos_y" size="50"></td></tr>

				<tr><td colspan="2" align="center"><input type="submit" value="등록">&nbsp;&nbsp; <input type="reset" value="취소"></td></tr>
			</table>
		</form>
	</div>
</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
	<jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝 -->