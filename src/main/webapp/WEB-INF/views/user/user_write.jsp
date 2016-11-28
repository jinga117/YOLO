<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
	<div class="member-form-wrap">
		<form action="userwrite" method="post" name="userwrite" id="userwrite">
		<div class="b-promo__form member-form m--centered">
			<h2 class="b-form-reg-popup__title m--centered">YOLO 회원가입</h2>
			<ul>
				<li class="member-subject"><i class="fa fa-user" aria-hidden="true"></i> 아이디</li><li class="member-input"><input type="text" id="id" name="user_id" placeholder="ID"><input type="button" id="confirm_id" name="confirm_id" class="btn_dup" onclick="openConfirmid(this)" value="중복확인"/></li>
				<li class="member-subject"><i class="fa fa-key" aria-hidden="true"></i> 비밀번호</li><li class="member-input"><input type="password" name="password"  id="pwd" placeholder="Password"></li>
				<li class="member-subject"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 이름</li><li class="member-input"><input type="text" name="name" id="name" placeholder="Name"></li>
				<li class="member-subject"><i class="fa fa-envelope-o" aria-hidden="true"></i> 이메일</li><li class="member-input"><input type="email" name="email" id="email" placeholder="Email"></li>
				<li class="member-subject"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 나이</li><li class="member-input"><input type="text" name="age" id="age" placeholder="Age"></li>
				<li class="member-subject"><i class="fa fa-street-view" aria-hidden="true"></i> 성별</li><li class="member-input m--left">
					<input type="radio" name="gender" value="m" id="gender" checked><span class="gender_txt">Male</span>
					<input type="radio" name="gender" value="f" id="gender"><span class="gender_txt">Female</span>
					<input type="hidden" name="isadmin" value="0">
				</li>
					
			</ul>
			 <div class="b-form__row m--centered"><button id="btn_member" class="btn btn-success m--border-radius-right"  type="submit">회원가입</button></div>
		</div>
		</form>
	</div>
	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->
	
</body>
</html>
<script type="text/javascript">
	// 회원가입 체크
	var userwrite = eval("document.userwrite");
	$("#btn_member").click(function() {
		if($("#id").val()=="") {
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		} else if 
		($("#pwd").val()=="") {
			alert("비밀번호를 입력해 주세요");
			$("#pwd").focus();
			return false;
		}  else if 
		($("#name").val()=="") {
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		} else if
		($("#age").val()=="") {
			alert("나이를 입력해 주세요");
			$("#age").focus();
			return false;
		}
		else if
		($("#gender").val()=="") {
			alert("성별을 선택해 주세요");
			return false;
		}
		document.userwrite.submit();
	});

	
	 function openConfirmid(userwrite) {
		 if ($('#id').val()=='') { 	//아이디를 입력했는지 검사
			alert("아이디를 입력하세요");
			$("#id").focus();
			return false;
		}
		//url과 사용자 입력 id를 조회합니다.
		url = "confirm_Id?user_id=" + $('#id').val();
		winObject = window.open(url, "user_id", "width=600, height=100");
		winObject.document.all.user_id.value = document.all.user_id.value;
	} 
</script>