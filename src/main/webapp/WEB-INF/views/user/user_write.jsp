<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action="userwrite" method="post" name="userwrite" onsubmit="return checkIt()">
		아이디:<input type="text" name="user_id">
		<input type="button" name="confirm_id" value="중복확인" onclick="openConfirmid(this.form)"><p>
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
	<script type="text/javascript">
	function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
		var userwrite = eval("document.userwrite");
		if (!userwrite.user_id.value) { //아이디를 입력하지 않으면...

			alert("ID필수 사항입니다.");
			userwrite.user_id.focus();
			return false; //사용자가 서비스를 요청한 시점으로 돌아감
		}
		
		if (!userwrite.email.value) { //이름을 입력하지 않으면 수행
			alert("사용자 이메일을 입력하세요");
			return false;
		}

		if (!userwrite.password.value) { //비밀번호를 입력하지 않으면 수행
			alert("비밀번호 입력하세요");
			return false;
		}
		if (!userwrite.age.value) { //비밀번호를 입력하지 않으면 수행
			alert("나이를 입력하세요");
			return false;
		}
	}
	
	function openConfirmid(userwrite) {
		if (!userwrite.user_id.value) { //아이디를 입력했는지 검사
			alert("아이디를 입력하세요");
			return;
		}
		//url과 사용자 입력 id를 조회합니다.

		url = "confirm_Id?user_id=" + userwrite.user_id.value;
		winObject = window.open(url, "user_id", "width=600, height=100");
		winObject.document.all.user_id.value = document.all.user_id.value;
	}
	</script>
	
	
</body>
</html>