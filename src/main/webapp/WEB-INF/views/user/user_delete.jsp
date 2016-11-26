<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 삭제</title>
</head>
<body>
	<form action="user_deletePro" method="post">
		<table>
			<tr>
				<td>아 이 디 : </td>
				<td>비밀번호 : </td>
			</tr>
			<tr>
				<td><input type="text" name="user_id" value="${vo.user_id }" readonly="readonly"></td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>