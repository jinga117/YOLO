<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정</title>
</head>
<body>
	<form action="user_updatePro" method="post">
	
		<table>
			<tr>
				<td>아 이 디 :</td><p>
				<td>비밀번호 :</td><p>
				<td>이	 름:</td><p> 
				<td>이  메 일:</td><p>
				<td>성     별 :</td><p>
				<td>나     이 :</td><p>
			</tr>
			<tr>
					<td><input type="text" name="user_id" readonly="readonly" value="${vo.user_id}"></td><p>
					<td><input type="text" name="password" value="${vo.getPassword()}"></td><p>
					<td><input type="text" name="name" value="${vo.getName() }">
					<td><input type="text" name="email" value="${vo.getEmail()}"></td><p>
					<td> 
			<select name="gender" value="${vo.getGender()}">
			<option>Man</option>
			<option>Woman</option>
		</select></td><p>
					<td><input type="text" name="age" value="${vo.getAge()}"></td><p>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>