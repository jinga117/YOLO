<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->

	<!-- 컨텐츠 영역 시작 -->
	<div class="mypage_container">
	
		<!-- My page 왼쪽 메뉴 시작 -->
		<jsp:include page="../inc/left_menu.jsp" />
		<!-- My page 왼쪽 메뉴 끝 -->
		
		<div class="mypage_content_wrap">
			<div class="mypage_list_title">내가 쓴 댓글</div>
			<div class="mypage_review_list">
				<c:forEach items="${list }" var="list">
					<div class="review_list" id="review_list">
						<ul>
							<li>
								<span class="review_list_user">${list.user_id }</span> | 
								<span class="review_list_time"><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${list.review_time }"  pattern="yyyy-MM-dd E요일 hh:mm" /></span>
								 <a href ="review_delete?review_no=${list.review_no }" class="btn_delete">X</a>
							</li>
							<li><span class="review_list_content"><a href="detail_view?trip_id=${list.trip_id}#commentArea">${list.review_content }</a></span></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
	</body>
</html>