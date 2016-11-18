<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action="userwrite" method="post">
		아이디:<input type="text" name="user_id"><p>
		비밀번호:<input type="password" name="password"><p>
		이메일:<input type="email" name="email"><p>
		성별:
		<select name="gender">
			<option>Man</option>
			<option>Woman</option>
		</select><p>
		나이:<input type="text" name="age"><p>
		<input type="submit" value="확인">
	</form>
</body>
</html>