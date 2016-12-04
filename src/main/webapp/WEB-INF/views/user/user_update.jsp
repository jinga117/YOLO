<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<form method="post">
					<div class="member-form m--centered">
						<h2 class="b-form-reg-popup__title m--centered">정보 수정</h2>
						<ul>
							<li class="member-subject"><i class="fa fa-user" aria-hidden="true"></i> 아이디</li><li class="member-input"><input type="text" name="user_id" readonly="readonly" value="${vo.user_id}"></li>
							<li class="member-subject"><i class="fa fa-key" aria-hidden="true"></i> 비밀번호</li><li class="member-input"><input type="text" name="password"  id="pwd" value="${vo.getPassword()}"></li>
							<li class="member-subject"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 이름</li><li class="member-input"><input type="text" name="name"  id="name"  value="${vo.getName() }"></li>
							<li class="member-subject"><i class="fa fa-envelope-o" aria-hidden="true"></i> 이메일</li><li class="member-input"><input type="text" name="email"  id="email"  value="${vo.getEmail()}"></li>
							<li class="member-subject"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 나이</li><li class="member-input"><input type="text" name="age" id="age" value="${vo.getAge()}"></li>
							<li class="member-subject"><i class="fa fa-street-view" aria-hidden="true"></i> 성별</li><li class="member-input m--left">
								<select id="gender_select" name="gender" ><option value="m">Man</option><option value="f">Woman</option></select>
							</li>
						</ul>
						<div class="b-form__row m--centered" ><button id="btn_member" class="btn btn-success m--border-radius-right"  type="submit">수정</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
	
	<%-- <!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 --> --%>
