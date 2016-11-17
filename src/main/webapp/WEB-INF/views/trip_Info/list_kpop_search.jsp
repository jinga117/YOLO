<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->

	<!-- 컨텐츠 영역 시작 -->
    <div class="b-main-container" id="content">
         <div class="b-pop-places container">
            <h2 class="b-cont-title" >KPOP</h2>
            
            <div class="b-slider owl-carousel owl-carousel-1">            
            <!--  리스트 시작 -->
			<c:forEach items="${kpopList }" var="kpop">
                <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="places"><img width="370" height="245" class="b-pop-place__img__img"  src="img/photo/${kpop.trip_id}.jpg" alt="${kpop.trip_nickname}"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="places" class="b-pop-place__name">${kpop.trip_nickname}</a>
                            <h5 class="b-pop-place__cat">${kpop.trip_address}</h5>
							<div class="b-pop-place-comment">
								<a href="http://${kpop.trip_site}" target="_blank"  class="b-pop-place-homepage"><i class="fa fa-home" aria-hidden="true"></i></a>
								<a href="http://${kpop.trip_site}" target="_blank" >${kpop.trip_site}</a>
							</div>
							<div class="b-pop-place-comment">
								<a href="#"  class="b-pop-place-homepage"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
								${kpop.trip_time}
							</div>
							</a>
						</div>
                    </div>
                </div>
                </c:forEach>
                <!--  리스트 끝-->
            </div>
            <!-- .b-slider -->
            <div class="row m--centered">
                <div class="col-md-4 col-md-offset-4"><a href="#" class="btn">View all places</a>
                </div>
            </div>
        </div>
    <!-- //main-container -->
    <!-- 컨텐츠 영역 끝 -->
    
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->

</html>