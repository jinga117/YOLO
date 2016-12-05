<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
   <div class="b-pop-places container">
      <h2 class="b-cont-title">YOLO의 추천 코스</h2>
			<ul class="viewList_list " id="viewList_list">
				<!--  View all List 시작 -->
				<c:forEach items="${recommList }" var="list" varStatus="sta">
					<li>
						<div class="viewList_item">
							<div class="b-pop-place">
								<div class="b-pop-place__img"  >
									<a href="detail_view_recommand?trip_id=${list.trip_id}&re_onum=re${sta.count}"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/${list.trip_id}.jpg">
									</a>
								</div>
									<div class="b-pop-place__desc clearfix">
									<div style="margin-top: -10px;"><font style="font: bold 17px 맑은 고딕; ">${list.re_content}</div>
										<a href="detail_view_recommand?trip_id=${list.trip_id}&re_onum=re${sta.count}" class="b-pop-place__name">
											<span class="b-pop-place__name_txt">${list.trip_nickname}</span>
										</a>
										<h5 class="b-pop-place__cat">${list.trip_add1} ${list.trip_add2}</h5>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			<!--  View all List 끝-->
	   </div>
	</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
   <jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝-->