<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check==0 }">
<script type="text/javascript">
	alert("비밀번호가 잘못되었습니다.");
	history.go(-1);
</script>
</c:if>

	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->

	<!-- 컨텐츠 영역 시작 -->
	<div class="mypage_container">
	
		<!-- My page 왼쪽 메뉴 시작 -->
		<jsp:include page="../inc/left_menu.jsp" />
		<!-- My page 왼쪽 메뉴 끝 -->
		
		<div class="mypage_content_wrap">
			<div class="mypage-member-form-wrap">
				<form action="user_deletePro" method="post">
						<div class="b-promo__form member-form m--centered">
							<h2 class="b-form-reg-popup__title m--centered">회원 정보 삭제</h2>
							
							<ul>
								<li class="member-subject"><i class="fa fa-user" aria-hidden="true"></i> 아이디</li><li class="member-input"><input type="text" name="user_id" readonly="readonly" value="${vo.user_id}"></li>
								<li class="member-subject"><i class="fa fa-key" aria-hidden="true"></i> 비밀번호</li><li class="member-input"><input type="password" name="password" class="login_password"></li>
							</ul>
							<div class="b-form__row m--centered" ><button id="btn_member" class="btn btn-success m--border-radius-right"  type="submit">삭제</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
	</body>
</html>