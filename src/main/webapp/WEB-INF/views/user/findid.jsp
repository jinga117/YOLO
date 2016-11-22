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
	이름 : <input type="text" name="name" >
	이메일: <input type="email" name="email"> 
	<input type="button" onclick="openConfirmid(this.form)" value="확인"/>
	</form>
</body>

<script type="text/javascript">
	function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
		var findID = eval("document.findID");
		if (!findID.email.value) { //아이디를 입력하지 않으면...

			alert("이름을 입력하세요.");
			findID.name.focus();
			return false; //사용자가 서비스를 요청한 시점으로 돌아감
		}
		if (!findID.email.value) { //비밀번호를 입력하지 않으면 수행
			alert("비밀번호 입력하세요.");
			return false;
	
		}
	}

	function openConfirmid(findID) {
		
		url = "find_idCheck?name=" + findID.name.value + "&email="+findID.email.value;
		winObject = window.open(url, "name&email", "width=600, height=100");
		winObject.document.all.value = document.all.value;
	}
</script>
</html>