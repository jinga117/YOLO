<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="user_updatePro" method="post">
		<table>
			<tr>
				<td>아 이 디 :</td>
				<td>비밀번호 :</td>
				<td>이 메 일 :</td>
				<td>성     별 :</td>
				<td>나     이 :</td>
				<td>등     급 :</td>
				<td>지     역 :</td>
			</tr>
			<tr>
					<td><input type="text" name="user_id" readonly="readonly" value="${vo.getUser_id()}"></td>
					<td><input type="text" name="password" value="${vo.getPassword()}"></td>
					<td><input type="text" name="email" value="${vo.getEmail()}"></td>
					<td><input type="text" name="gender" value="${vo.getGender()}"></td>
					<td><input type="text" name="age" value="${vo.getAge()}"></td>
					<td><input type="text" name="isadmin" value="${vo.getIsadmin()}"></td>
					<td><input type="text" name="area" value="${vo.getArea()}"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>