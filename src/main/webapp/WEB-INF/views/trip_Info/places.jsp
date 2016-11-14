<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
	<div class="b-main-container places-page" id="content">
        <div id="hellopreloader">
            <div id="hellopreloader_preload"></div>
        </div>
       <!-- login-->
	 <div class="hidden b-jquery-popup">
                <div class="b-form-reg-popup">
                    <h2 class="b-form-reg-popup__title m--centered">YOLO Login</h2>
					 <div class="b-form__row">
                        <input type="text" placeholder="Your ID"> </div>
                    <div class="b-form__row">
                        <input type="text" placeholder="Your Name"> </div>
                    <div class="b-form__row">
                        <input type="text" placeholder="Email Address"> </div>
                    <div class="b-form__row">
                        <input type="text" placeholder="Phone Number"> </div>
                    <div class="b-form__row">
                        <select data-placeholder="관심 지역을 선택해 주세요" class="chosen-select-2" tabindex="2">
							<option value="all">관심 지역을 선택해 주세요</option>
                           <option value="seoul">서울</option>
						   <option value="kyeonggi">경기</option>
                        </select>
                    </div>
                    <div class="b-form__row m--centered"> <a href="#" class="btn">가입하기</a> </div>
                </div>
            </div>
        </div>
	<!--// login-->
        <div class="b-map-menu">
            <ul class="b-map-menu__list">
                <li class="b-map-menu__list__bars active"><a href="#" class="noajax"><i class="fmr fmr-icon-2810"></i>봄</a>
                </li>
                <li class="b-map-menu__list__food"><a href="#" class="noajax"><i class="fmr fmr-icon-467"></i>여름</a>
                </li>
                <li class="b-map-menu__list__restaurants"><a href="#" class="noajax"><i class="fmr fmr-icon-466"></i>가을</a>
                </li>
                <li class="b-map-menu__list__night-life"><a href="#" class="noajax"><i class="fmr fmr-icon-1100"></i>겨울</a>
                </li>
            </ul>
        </div>
        <!-- .b-map-menu -->
        <div class="b-slide-menu opened">
            <div class="b-slide-menu__toggle"><i class="fa fa-caret-left" aria-hidden="true"></i><i class="fa fa-caret-right hidden" aria-hidden="true"></i>
            </div>
            <div class="b-slide-menu__content custom-scroll default-skin">
                <h2 class="b-slide-menu__title">중앙공원</h2>
                <div class="b-slide-menu__form container-fluid opened">
					<!-- 동영상-->
					<div class="b-slide-menu-movie">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/_DyVYatKcRY" frameborder="0" allowfullscreen></iframe>
					</div>
					<!-- // 동영상 -->
                    <div class="b-slide-menu__form__row row">
                        <div class="col-md-3"><span class="b-slide-menu__form__row__title">Weather</span>

                        </div>
                        <div class="col-md-9">
                            <div class="b-slide-menu__form__row__item">
                                
                            </div>
                        </div>
                    </div>
                    <!--div class="b-slide-menu__form__row row">
                        <div class="col-md-3"><span class="b-slide-menu__form__row__title">Price range:</span>
                        </div>
                        <div class="col-md-9">
                            <div class="b-slide-menu__form__row__item">
                                <input type="text" class="example_class" name="example_name" value="" /> </div>
                        </div>
                    </div>
                    <div class="b-slide-menu__form__row row">
                        <div class="col-md-3"><span class="b-slide-menu__form__row__title">Location:</span>
                        </div>
                        <div class="col-md-6">
                            <div class="b-slide-menu__form__row__item">
                                <input type="text" placeholder="Enter location"> </div>
                        </div>
                        <div class="col-md-3">
                            <div class="b-checkbox">
                                <input id="box1" type="checkbox">
                                <label for="box1">Near me</label>
                            </div>
                        </div>
                    </div-->
                    <div class="b-slide-menu__form__row row">
                        <div class="col-md-3"><span class="b-slide-menu__form__row__title">환율정보 : </span>
                        </div>
                        <div class="col-md-9">
                            <div class="b-slide-menu__form__row__item">
                                <input type="text" placeholder="">
                                <button type="submit" title="Search" class="b-gadget__search__button"><i class="fa fa-usd" aria-hidden="true"></i>
                                </button>
								<!--input type="text" placeholder="">
                                <button type="submit" title="Search" class="b-gadget__search__button"><i class="fa fa-krw" aria-hidden="true"></i>
                                </button-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="b-slide-menu__row clearfix">
                    <div class="btn btn--white press--left b-hide-filters">Hide filters</div>
                    <div class="b-slide-menu__pages-num press--right">1-10 of 24</div>
                </div>
                <div class="b-place-list b-place-list--grid clearfix">
                    <div class="b-grid-sizer"></div>
                    <div class="b-grid-item b-grid-item--masonryPl">
                        <div class="b-pop-place">
                            <div class="b-pop-place__img">
                                <a class="b-pop-place__img__img" href="#"><img src="img/photo/centralPark.jpg" alt="분당 중앙공원">
                                </a>
                                <a href="#" class="b-icon-medal"></a> <a href="#" class="b-icon-like" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                <div class="b-pop-place__links">
                                    <div class="press--left"> <a href="#" class="b-pop-place__links__item"><i class="fa fa-music" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-book" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-camera" aria-hidden="true"></i></a> </div>
                                </div>
                            </div>
                            <div class="b-pop-place__desc clearfix">
                                <div class="b-pop-place__rating">4,8</div> <a href="Single-Place.jsp" class="b-pop-place__name">분당 중앙공원</a>
                                <h5 class="b-pop-place__cat">Attraction / 산책하기 좋은</h5>
                            </div>
                        </div>
                    </div>
                     <div class="b-grid-item b-grid-item--masonryPl">
                        <div class="b-pop-place">
                            <div class="b-pop-place__img">
                                <a class="b-pop-place__img__img" href="#"><img src="img/photo/centralPark.jpg" alt="분당 중앙공원">
                                </a>
                                <a href="#" class="b-icon-medal"></a> <a href="#" class="b-icon-like" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                <div class="b-pop-place__links">
                                    <div class="press--left"> <a href="#" class="b-pop-place__links__item"><i class="fa fa-music" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-book" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-camera" aria-hidden="true"></i></a> </div>
                                </div>
                            </div>
                            <div class="b-pop-place__desc clearfix">
                                <div class="b-pop-place__rating">4,8</div> <a href="Single-Place.jsp" class="b-pop-place__name">분당 중앙공원</a>
                                <h5 class="b-pop-place__cat">Attraction / 산책하기 좋은</h5>
                            </div>
                        </div>
                    </div>
                    <div class="b-grid-item b-grid-item--masonryPl">
                        <div class="b-pop-place">
                            <div class="b-pop-place__img">
                                <a class="b-pop-place__img__img" href="#"><img src="img/photo/centralPark.jpg" alt="분당 중앙공원">
                                </a>
                                <a href="#" class="b-icon-medal"></a> <a href="#" class="b-icon-like" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                <div class="b-pop-place__links">
                                    <div class="press--left"> <a href="#" class="b-pop-place__links__item"><i class="fa fa-music" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-book" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-camera" aria-hidden="true"></i></a> </div>
                                </div>
                            </div>
                            <div class="b-pop-place__desc clearfix">
                                <div class="b-pop-place__rating">4,8</div> <a href="Single-Place.jsp" class="b-pop-place__name">분당 중앙공원</a>
                                <h5 class="b-pop-place__cat">Attraction / 산책하기 좋은</h5>
                            </div>
                        </div>
                    </div>
                     <div class="b-grid-item b-grid-item--masonryPl">
                        <div class="b-pop-place">
                            <div class="b-pop-place__img">
                                <a class="b-pop-place__img__img" href="#"><img src="img/photo/centralPark.jpg" alt="분당 중앙공원">
                                </a>
                                <a href="#" class="b-icon-medal"></a> <a href="#" class="b-icon-like" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                <div class="b-pop-place__links">
                                    <div class="press--left"> <a href="#" class="b-pop-place__links__item"><i class="fa fa-music" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-book" aria-hidden="true"></i></a> <a href="#" class="b-pop-place__links__item"><i class="fa fa-camera" aria-hidden="true"></i></a> </div>
                                </div>
                            </div>
                            <div class="b-pop-place__desc clearfix">
                                <div class="b-pop-place__rating">4,8</div> <a href="Single-Place.jsp" class="b-pop-place__name">분당 중앙공원</a>
                                <h5 class="b-pop-place__cat">Attraction / 산책하기 좋은</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .b-place-list -->
                <ul class="b-place-list__pager">
                    <li class="prev"><a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
                    </li>
                    <li class="active"><a href="#">1</a>
                    </li>
                    <li><a href="#">2</a>
                    </li>
                    <li><a href="#">3</a>
                    </li>
                    <li class="next"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
                    </li>
                </ul>
            </div>
            <!-- .b-slide-menu__content -->
        </div>
        <!-- .b-slide-menu -->
        <div class="b-map">
            <div class="b-map__wrapper">
                <!--div id='gmap_canvas' class="b-gmap-canvas"></div-->
				<div id="map" class="b-gmap-canvas" style="width:100%;height:100%;"></div>
            </div>
        </div>

        <!-- .b-place-list -->
        <ul class="b-place-list__pager">
            <li class="prev"><a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
            </li>
            <li class="active"><a href="#">1</a>
            </li>
            <li><a href="#">2</a>
            </li>
            <li><a href="#">3</a>
            </li>
            <li class="next"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
            </li>
        </ul>
    </div>
  <!-- 컨텐츠 영역 끝 -->
    
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->
</html>
	<!-- DAUM MAP -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1d5e5ad2e3cb3461622dec6c0af6825"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

	</script>
	<!-- //DAUM MAP -->
