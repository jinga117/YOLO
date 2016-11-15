<%@page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<style type="text/css">
	#check{
		text-align: left;
	}
</style>
<title>회원 가입</title>
</head>
	<body>
		<h3 align="center">정보입력 페이지</h3>
		<hr>
			<form method="post">
				<table style="margin: 0 auto;">
					<tr><td>여행지key값</td>
					<td><input type="text" name="trip_id" size="50" ></td></tr>
					<tr><td>카테고리key값</td>
					<td>
						<select name="category_id" style="width: 10em; ">
						  <option value="c01">명소</option>
						  <option value="c02">쇼핑</option>
						  <option value="c03">음식점</option>
						</select>
					</td></tr>
					<tr><td rowspan="4"> 테마별 </td><td id=check  colspan="2">
						<input type="checkbox"   name="age_id" value="a01">꽃청춘
						<input type="checkbox"   name="age_id" value="a02">꽃중년
					</tr>
					<tr><td id=check colspan="2">
						<input type="checkbox" name="season_id" value="s01">봄
						<input type="checkbox" name="season_id" value="s02">여름
						<input type="checkbox" name="season_id" value="s03">가을
						<input type="checkbox" name="season_id" value="s04">겨울
					</tr>
					<tr><td id=check colspan="2" >
						<input type="checkbox" name="person_id" value="p01">나홀로
						<input type="checkbox" name="person_id" value="p02">커플
						<input type="checkbox" name="person_id" value="p03">우정
						<input type="checkbox" name="person_id" value="p04">가족
					</tr>
					<tr><td id=check colspan="2">
						<input type="checkbox" name="kpop_id" value="k01">kpop
					</tr>
					<tr><td>여행지 별칭</td><td><input type="text" name="trip_nickname" size="50" ></td></tr>
					<tr><td>주소</td><td><input type="text" name="trip_address" size="50" ></td></tr>
					<tr><td>시</td><td><input type="text" name="trip_add1" size="50" ></td></tr>
					<tr><td>구</td><td><input type="text" name="trip_add2" size="50" ></td></tr>
					<tr><td>상세주소</td><td><input type="text" name="trip_add3" size="50" ></td></tr>
					<tr><td>이미지</td><td><input type="text" name="trip_image" ></td></tr>
					<tr><td>내용</td><td><input type="text" name="trip_content" size="50" ></td></tr>
					<tr><td>이용시간</td><td><input type="text" name="trip_time" size="50" ></td></tr>
					<tr><td>홈페이지</td><td><input type="text" name="trip_site" size="50" ></td></tr>
					<tr><td>전화번호</td><td><input type="text" name="trip_tel" size="50" ></td></tr>
					<tr><td>가는방법</td><td><input type="text" name="trip_way" size="50" ></td></tr>
					<tr><td>비용</td><td><input type="text" name="trip_pay" size="50" ></td></tr>
					<tr><td>좋아요</td><td><input type="text" name="trip_like" size="50" ></td></tr>
					<tr><td>조회수</td><td><input type="text" name="trip_view" size="50" ></td></tr>
					<tr><td>동영상</td><td><input type="text" name="trip_video" size="50" ></td></tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="등록"> &nbsp;&nbsp; <input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		<hr>	
	</body>
</html>