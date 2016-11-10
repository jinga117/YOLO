<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
</head>
<body align="center">
<h3>회원 가입 페이지</h3>
<hr>
<form action="writePro"  method="POST">
	<table>
		<tr><td>여행지key값</td><td><input type="text" name="trip_id" size="50" ></td></tr>
		<tr><td>카테고리key값</td><td><input type="text" name="trip_category_id" size="50" ></td></tr>
		<tr><td>여행지 별칭</td><td><input type="text" name="trip_nickname" size="50" ></td></tr>
		<tr><td>주소</td><td><input type="text" name="trip_address" size="50" ></td></tr>
		<tr><td>이미지경로</td><td><input type="text" name="trip_image" size="50" ></td></tr>
		<tr><td>내용</td><td><input type="text" name="trip_content" size="50" ></td></tr>
		<tr><td>이용시간</td><td><input type="text" name="trip_time" size="50" ></td></tr>
		<tr><td>비용</td><td><input type="text" name="trip_pay" size="50" ></td></tr>
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