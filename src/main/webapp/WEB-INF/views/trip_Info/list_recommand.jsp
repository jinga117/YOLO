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
      <div id="hidediv">
         <div class="b-slider owl-carousel owl-carousel-1">
            <!--  리스트 시작 -->
            <c:set var="cnt" value="1"></c:set>
            <c:forEach items="${recommList }" var="list" varStatus="sta">         
               <div class="b-pop-places__item">
                  <div class="b-pop-place">
                     <div class="b-pop-place__img">
                     
                        <a href="detail_view_recommand?trip_id=${list.trip_id}&re_onum=${list.re_onum}"><img
                           width="370" height="245" class="b-pop-place__img__img"
                           src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></a>
                        <a href="#" class="b-icon-medal"></a>
                        <button onClick="likeIt(this)" value="${list.trip_id}"
                           class="b-icon-like" data-toggle="tooltip" data-placement="left"
                           title="좋아요">
                           <i class="fa fa-heart" aria-hidden="true"></i>
                        </button>
                     </div>

                     <div class="b-pop-place__desc clearfix">
                        <a href="detail_view_recommand?trip_id=${list.trip_id}&re_onum=${list.re_onum}" class="b-pop-place__name">${list.trip_nickname}</a>
                        <h5 class="b-pop-place__cat">${list.trip_add1} ${list.trip_add2}</h5>
                        <!-- 일정추가 시작 -->
                        <div class="list_add_icon_wrap">
                           <div class="list_add_icon" data-toggle="tooltip" data-placement="top" title="일정추가"><i class="fa fa-calendar" aria-hidden="true"></i></div>
                        </div>
                        <!-- 일정추가 끝 -->

                        <div class="b-pop-place-comment m--centered">
                           <span class="b-pop-place__view"><img src="img/heart_icon.png" class="list_icon" id="heart_icon" trip_id="${list.trip_id}"></span><span id="likeCount">${list.trip_like}</span>
                           <span class="b-pop-place__view"><img src="img/view_icon.png" class="list_icon"></span> ${list.trip_view} 
                           <span class="b-pop-place__view"><img src="img/review_icon.png" class="list_icon"></span> ${list.trip_review}
                        </div>
                     </div>
                  </div>
               </div>
               
            </c:forEach>
            <!--  리스트 끝-->
         </div>
         </div>
         </div>
</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
   <jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝-->