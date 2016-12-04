<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	<%-- <c:if test="${modify ==1 }">
	<script type="text/javascript">
		alert("수정완료되었습니다..");
		history.go(1);
	</script>
	</c:if>
	
	<c:if test="${modify ==0 }">
	<script type="text/javascript">
		alert("수정실패하였습니다..");
		history.go(-1);
	</script>
	</c:if> --%>
	
	<!-- 컨텐츠 영역 시작 -->
	<div class="mypage_container">
	
		<!-- My page 왼쪽 메뉴 시작 -->
		<jsp:include page="../inc/left_menu.jsp" />
		<!-- My page 왼쪽 메뉴 끝 -->
		
		<div class="mypage_content_wrap">
			<img src="img/mypage.png" class="mypage_img">
		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->