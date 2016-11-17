<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
    <div class="b-main-container" id="content">
         <div class="b-pop-places container">
            <h2 class="b-cont-title">Travel</h2>
              <ul class="b-cont-sub-menu">
            	<li><a href="list_age?age_id=a01">꽃청춘</a></li>
            	<li><a href="list_age?age_id=a02">꽃중년</a></li>
            </ul>
            
            <div class="b-slider owl-carousel owl-carousel-1">            
            <!--  리스트 시작 -->
            <c:forEach items="${ageList }" var="list">
                <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="places"><img width="370" height="245" class="b-pop-place__img__img"  src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="places" class="b-pop-place__name">${list.trip_nickname}</a>
                            <h5 class="b-pop-place__cat">${list.trip_address}</h5>
							<div class="b-pop-place-comment">
								<a href="http://${list.trip_site}" target="_blank"  class="b-pop-place-homepage"><i class="fa fa-home" aria-hidden="true"></i></a>
								<a href="http://${list.trip_site}" target="_blank" >${list.trip_site}</a>
							</div>
							<div class="b-pop-place-comment">
								<a href="#"  class="b-pop-place-homepage"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
								${list.trip_time}
							</div>
							</a>
						</div>
                    </div>
                </div>
                </c:forEach>
                <!--  리스트 끝-->
            </div>
            <ul class="b-cont-sub-menu">
            	<li><a href="list_theme_search?season_id=s01" >봄</a></li>
            	<li><a href="list_theme_search?season_id=s02" >여름</a></li>
            	<li><a href="list_theme_search?season_id=s03" >가을</a></li>
            	<li><a href="list_theme_search?season_id=s04" >겨울</a></li>
            </ul>
            
            <div class="b-slider owl-carousel owl-carousel-1">            
            <!--  리스트 시작 -->
            <c:forEach items="${seasonList }" var="season">
                <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="places"><img width="370" height="245" class="b-pop-place__img__img"  src="img/photo/${season.trip_id}.jpg" alt="${season.trip_nickname}"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="places" class="b-pop-place__name">${season.trip_nickname}</a>
                            <h5 class="b-pop-place__cat">${season.trip_address}</h5>
							<div class="b-pop-place-comment">
								<a href="http://${season.trip_site}" target="_blank"  class="b-pop-place-homepage"><i class="fa fa-home" aria-hidden="true"></i></a>
								<a href="http://${season.trip_site}" target="_blank" >${season.trip_site}</a>
							</div>
							<div class="b-pop-place-comment">
								<a href="#"  class="b-pop-place-homepage"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
								${season.trip_time}
							</div>
							</a>
						</div>
                    </div>
                </div>
                </c:forEach>
                <!--  리스트 끝-->
            </div>
			<ul class="b-cont-sub-menu">
            	<li><a href="list_kpop_search?kpop_id=k01" >K-POP</a></li>
            </ul>
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
            </div>
            <ul class="b-cont-sub-menu">
            	<li><a href="list_person_search?person_id=p01" >나홀로여행</a></li>
            	<li><a href="list_person_search?person_id=p02" >커플</a></li>
            	<li><a href="list_person_search?person_id=p03" >우정</a></li>
            	<li><a href="list_person_search?person_id=p04" >가족</a></li>
            </ul>
            
            <div class="b-slider owl-carousel owl-carousel-1">            
            <!--  리스트 시작 -->
            <c:forEach items="${personList }" var="person">
                <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="places"><img width="370" height="245" class="b-pop-place__img__img"  src="img/photo/${person.trip_id}.jpg" alt="${person.trip_nickname}"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="places" class="b-pop-place__name">${person.trip_nickname}</a>
                            <h5 class="b-pop-place__cat">${person.trip_address}</h5>
							<div class="b-pop-place-comment">
								<a href="http://${person.trip_site}" target="_blank"  class="b-pop-place-homepage"><i class="fa fa-home" aria-hidden="true"></i></a>
								<a href="http://${person.trip_site}" target="_blank" >${person.trip_site}</a>
							</div>
							<div class="b-pop-place-comment">
								<a href="#"  class="b-pop-place-homepage"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
								${person.trip_time}
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