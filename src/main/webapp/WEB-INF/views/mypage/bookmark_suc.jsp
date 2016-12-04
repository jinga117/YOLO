<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
	<div class="mypage_container">
		<!-- My page 왼쪽 메뉴 시작 -->
		<jsp:include page="../inc/left_menu.jsp" />
		<!-- My page 왼쪽 메뉴 끝 -->
	
		<div class="mypage_content_wrap">
			<h2 class="mypage_list_title">북마크</h2>
			<c:forEach items="${bookmarklist }" var="list">
				<div class="bookmark_container">
					<ul class="viewList_list">
						<li class="bookmark_list">
							<div class="viewList_item">
								<div class="b-pop-place">
									<div class="b-pop-place__img">
										<a href="detail_view?trip_id=${list.trip_id}"> <img width="370" height="245" class="b-pop-place__img__img" src="img/photo/${list.trip_id}.jpg"></a>
									</div>
	
									<div class="b-pop-place__desc clearfix">
										<a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name"> 
											<span class="b-pop-place__name_txt">${list.trip_nickname}</span>
										</a>
										<span class="bookmark_del_wrap"><a href ="bookmark_delete?trip_id=${list.trip_id }" class="btn_delete" data-toggle="tooltip" data-placement="left" title="북마크 삭제">X</a></span>
										
										<h5 class="b-pop-place__cat">${list.trip_add1}
											${list.trip_add2}</h5>
										<div class="b-pop-place-comment m--centered">
											<span class="b-pop-place__view"><img src="img/heart_icon.png" class="list_icon" id="heart_icon"></span>
											<span id="likeCount">${list.trip_like}</span>
											<span class="b-pop-place__view"><img src="img/view_icon.png" class="list_icon"> ${list.trip_view}</span> 
											<span class="b-pop-place__view">
												<a href="detail_view?trip_id=${list.trip_id}#commentArea"><img src="img/review_icon.png" class="list_icon"> ${list.trip_review}</a>
											</span>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>