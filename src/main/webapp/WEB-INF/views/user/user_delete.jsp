<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="user_deletePro" method="post">
		<table>
			<tr>
				<td>아 이 디 : </td>
				<td>비밀번호 : </td>
			</tr>
			<tr>
				<td><input type="text" name="id" value="${vo.id }" readonly="readonly">
					<input type="hidden" name="id" value="${vo.id }">
				</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>