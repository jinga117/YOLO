<%@page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>회원 가입</title></head>
	<body align="center">
		<h3>정보입력 페이지</h3>
		<hr>
			<form action="writePro" >
				<table>
					<tr><td>여행지key값</td>
					<td><input type="text" name="trip_id" size="50" ></td></tr>
					<tr><td>카테고리key값</td>
					<td>
						<select name="category_id">
						  <option value="c01">명소</option>
						  <option value="c02">쇼핑</option>
						  <option value="c03">음식점</option>
						</select>
					</td></tr>
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
							<input type="submit" value="등록"><input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		<hr>	
	</body>
</html>