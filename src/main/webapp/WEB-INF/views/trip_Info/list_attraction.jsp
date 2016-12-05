<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
	<div class="b-pop-places container">
		<h2 class="b-cont-title">travel</h2>
		<div id="hidediv">
			<div class="b-slider owl-carousel owl-carousel-1">
				<!--  리스트 시작 -->
				<c:forEach items="${cateTop }" var="list">
					<div class="b-pop-places__item">
						<div class="b-pop-place">
							<div class="b-pop-place__img">
								<a href="detail_view?trip_id=${list.trip_id}"> <img width="370" height="245" class="b-pop-place__img__img" src="img/photo/${list.trip_id}.jpg"></a>
								<a href="#" class="b-icon-medal"></a>
								<button onClick="likeIt(this)" value="${list.trip_id}" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="좋아요">
									<i class="fa fa-heart" aria-hidden="true"></i>
								</button>
							</div>

							<div class="b-pop-place__desc clearfix">
								<a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name">${list.trip_nickname}</a>
								<h5 class="b-pop-place__cat">${list.trip_add1} ${list.trip_add2}</h5>
								<!-- 일정추가 시작 -->
								<div class="list_add_icon_wrap">
									<div class="list_add_icon" data-toggle="tooltip" data-placement="top" title="일정추가" onClick="setTripId('${list.trip_id}', '${list.trip_nickname}')">
										<c:if test="${user_id == null }">
											<a href="#" onclick="javascript:alert('로그인 후 이용 가능합니다.');return false;" >
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</a>
										</c:if>
										<c:if test="${user_id != null }">
											<a href="#" class="html_popup" >
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</a>
										</c:if>
									</div>
								</div>
								<!-- 일정추가 끝 -->
								<div class="b-pop-place-comment m--centered">
									<span class="b-pop-place__view" data-toggle="tooltip" data-placement="top" title="좋아요"><img src="img/heart_icon.png" class="list_icon" id="heart_icon"  trip_id="${list.trip_id}"></span><span id="likeCount">${list.trip_like}</span>
									<span class="b-pop-place__view" data-toggle="tooltip" data-placement="top" title="조회수"><img src="img/view_icon.png" class="list_icon"> ${list.trip_view}</span> 
									<a href="detail_view?trip_id=${list.trip_id}#commentArea"><span class="b-pop-place__view" data-toggle="tooltip" data-placement="top" title="댓글"><img src="img/review_icon.png" class="list_icon"> ${list.trip_review}</span></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--  리스트 끝-->
			</div>
			<!-- *********************************************************전체보기 시작************************************************************************ -->
			<div class="row m--centered">
				<div class="col-md-4 col-md-offset-4">
					<a class="btn" id="view">View all places</a>
				</div>
			</div>
		</div>
		<div id="viewList">
			<ul class="viewList_list" id="viewList_list">
				<!--  View all List 시작 -->
				<c:forEach items="${cateList }" var="list">
					<li>
						<div class="viewList_item">
							<div class="b-pop-place">
								<div class="b-pop-place__img">
									<a href="detail_view?trip_id=${list.trip_id}"> <img width="370" height="245" class="b-pop-place__img__img" src="img/photo/${list.trip_id}.jpg"></a>
									<button onClick="likeIt(this)" value="${list.trip_id}" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="좋아요">
										<i class="fa fa-heart" aria-hidden="true"></i>
									</button>
								</div>

								<div class="b-pop-place__desc clearfix">
									<a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name">
										<span class="b-pop-place__name_txt">${list.trip_nickname}</span>
									</a>
									<h5 class="b-pop-place__cat">${list.trip_add1} ${list.trip_add2}</h5>
									<!-- 일정추가 시작 -->
									<div class="list_add_icon_wrap">
										<div class="add_plan_icon" data-toggle="tooltip" data-placement="top" title="일정추가" onClick="setTripId('${list.trip_id}', '${list.trip_nickname}')">
											<c:if test="${user_id == null }">
												<a href="#" onclick="javascript:alert('로그인 후 이용 가능합니다.');return false;" >
													<i class="fa fa-calendar" aria-hidden="true"></i>
												</a>
											</c:if>
											<c:if test="${user_id != null }">
												<a href="#" class="html_popup">
													<i class="fa fa-calendar" aria-hidden="true"></i>
												</a>
											</c:if>
										</div>
									</div>
									<!-- 일정추가 끝 -->
									<div class="b-pop-place-comment m--centered">
										<span class="b-pop-place__view" data-toggle="tooltip" data-placement="top" title="좋아요"><img src="img/heart_icon.png" class="list_icon" id="heart_icon"  trip_id="${list.trip_id}"></span><span id="likeCount">${list.trip_like}</span> 
										<span class="b-pop-place__view" data-toggle="tooltip" data-placement="top" title="조회수"><img src="img/view_icon.png" class="list_icon"> ${list.trip_view}</span>
										<a href="detail_view?trip_id=${list.trip_id}#commentArea"><span class="b-pop-place__view" data-toggle="tooltip" data-placement="top" title="댓글"><img src="img/review_icon.png" class="list_icon"> ${list.trip_review}</span></a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!--  View all List 끝-->
			
			<!--  Load More 시작 -->
			<div class="row m--centered">
				<div class="col-md-4 col-md-offset-4">
					<a class="btn" id="loadMore">더보기</a>&nbsp; <a class="btn" id="showLess"> &nbsp; 접기 &nbsp; </a>
				</div>
			</div>
			<!--  Load More 끝 -->
		</div>
	</div>
<!-- *********************************************************전체보기 끝************************************************************************ -->
<!-- //View List Container 끝-->
<!-- //main-container -->
</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
	<jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝 -->