<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title><style>
	.find_wrap {
		display:block;
		width:100%;
		height:100%;
		margin-top:40px;
		font: bold 18px  "Malgun Gothic";
		color:#000040;
		text-align:center;
	}
	
	.find_wrap .input_name, .input_email {
		padding:5px;
		width:220px;
		height:30px;
		margin-left:5px;
		background:#fff;
		border-radius: 8px;
		border:1px solid #ddd;
	}
	
	.find_wrap .input_name {
		width:150px;
	}
	
	.btn_find {
		display:inline-block;
		text-align:center;
		padding:10px 20px;
		margin:10px 5px 0 0;
		background:#eee;
		border:1px solid #ddd;
	}
	
	.btn_wrap {
		margin:0 10px 0;
		padding:10px;
		text-align:center;
	}
</style>
<body>
	<div class="find_wrap" style="margin: 0 auto;">
		<form action="find_pwdPro" name="findPWD">
		<h3 style="font: bold 17px "Malgun Gothic";">비밀번호 찾기</h3>
		아이디 <input type="text" name="user_id" class="input_name" placeholder="Your ID">
		이메일 <input type="email" name="email" class="input_email" placeholder="Your Email" >
		<div class="btn_wrap">
			<input type="button" onclick="openConfirmid(this.form)" value="확인"  class="btn_find"/>
			<input type="button"  onclick="javascript:window.close()"  class="btn_find" value="취소" />
		</div>
		</form>
	</div>
</body>

<script type="text/javascript">
	function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
		var findID = eval("document.findID");
		if (!findID.user_id.value) { //아이디를 입력하지 않으면...

			alert("아이디를 입력하세요.");
			findID.user_id.focus();
			return false; //사용자가 서비스를 요청한 시점으로 돌아감
		}
		if (!findID.email.value) { //비밀번호를 입력하지 않으면 수행
			alert("이메일을 입력하세요.");
			return false;
	
		}
	}

	function openConfirmid(findID) {
		
		url = "find_pwdCheck?user_id=" + findID.user_id.value + "&email="+findID.email.value;
		winObject = window.open(url, "name&password", "width=600, height=100");
		winObject.document.all.value = document.all.value;
	}
</script>
</html>