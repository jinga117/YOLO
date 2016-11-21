<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="find_idPro" name="findID">
	이메일 : <input type="email" name="email" >
	비밀번호 : <input type="password" name="password"> 
	<input type="button" onclick="openConfirmid(this.form)" value="확인"/>
	</form>
</body>

<script type="text/javascript">
	function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
		var findID = eval("document.findID");
		if (!findID.email.value) { //아이디를 입력하지 않으면...

			alert("이메일을 입력하세요.");
			findID.email.focus();
			return false; //사용자가 서비스를 요청한 시점으로 돌아감
		}
		if (!findID.password.value) { //비밀번호를 입력하지 않으면 수행
			alert("비밀번호 입력하세요.");
			return false;
	
		}
	}

	function openConfirmid(findID) {
		
		url = "find_idCheck?email=" + findID.email.value + "&password="+findID.password.value;
		winObject = window.open(url, "email&password", "width=600, height=100");
		winObject.document.all.value = document.all.value;
	}
</script>
</html>