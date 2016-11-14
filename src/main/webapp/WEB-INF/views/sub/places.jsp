<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title>YOLO - You Only Live Once</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/main.css">
    <!--[if lt IE 9]>
    <script src="js/vendor/html5-3.6-respond-1.4.2.min.js"></script>
    <![endif]-->
	
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
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
 <div class="b-preloader animated yt-loader">
        <div class="b-preloader__decor"></div>
    </div>
    <header class="b-header clearfix">
        <a href="index.jsp" class="logo"> <img src="img/logo.png" alt="YOLO" title="YOLO"></a>
        <a class="weather" href="#"> <img width="35" height="35" src="img/rain-xxl.png" alt="Weather"> <span>+ 24° C</span> </a>
		  <div class="b-header__ctrl">
			 <div class="b-header__ctrl__item"></div>
			<div class="b-header__ctrl__item">
                <a href="#" class="ab-item login jquery_popup"> <i class="fa fa-unlock-alt" aria-hidden="true"></i><span>Log In</span>
                </a>
            </div>
		  <div class="b-header__ctrl__item">
                <form class="searchbox">
                    <input type="search" placeholder="Search......" name="search" class="searchbox-input" onkeyup="buttonUp()">
                    <button type="submit" class="searchbox-submit"><i class="fa fa-search" aria-hidden="true"></i>
                    </button> <span class="searchbox-icon"><i class="fa fa-search" aria-hidden="true"></i></span> </form>
            </div>
            <!--div class="b-header__ctrl__item"> <a href="Add-Place.jsp" class="btn btn--black"><i class="fa fa-plus-square" aria-hidden="true"></i><span>어디를 여행하고 싶으세요?</span></a> </div-->
           
          
        </div>
        <!--.b-header__ctrl-->
        <div class="b-nav-toggle closed"><img src="img/mobile-logo.png" alt="logo" width="130" height="39"><i class="fa fa-chevron-down" aria-hidden="true"></i>
        </div>
        <nav class="b-nav">
            <ul>
                <li class="menu-item-has-children">
                    <a href="places.jsp"> <i class="fa fa-map-marker" aria-hidden="true"></i>Attraction</a>
                    <ul>
                        <li><a href="#">연령별</a>
                        </li>
                        <li><a href="#">테마별</a>
                        </li>
						 <li><a href="#">쇼핑명소</a>
                        </li>
                        <li><a href="#">K-POP 한류</a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i>Restaurant</a>
                    <ul>
                        <li><a href="#">혼밥</a>
                        </li>
                        <li><a href="#">혼술</a>
                        </li>
                    </ul>
                </li>
                <li> <a href="#"><i class="fa fa-bars" aria-hidden="true"></i>Hot Place</a> </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-mobile" aria-hidden="true"></i>Smart Plan</a>
                    <ul>
                        <li><a href="#">여행 일정짜기</a>
                        </li>
                        <li><a href="#">여행 발자취</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!--//b-nav-->
    </header>
    <!-- //b-header -->


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
    <!-- //b-main-container -->
    <div class="b-footer">
        <div class="b-footer__info">
            <div class="container clearfix">
                <div class="row">
                    <div class="b-footer__text col-md-3 col-sm-12"> <a href="index.jsp" class="b-footer__logo">YOLO</a>
                        <p>You Only Live Once<br />
							Enjoy Your Life!
						</p>
                        <div class="b-footer__copyright">© 2016 All Rights Reserved</div>
                    </div>
                    <div class="b-footer__nav__col col-md-2 col-md-offset-1 col-sm-3 col-xs-4">
                        <div class="b-footer__nav__col__title">About us</div>
                        <ul>
                            <li><a href="#">About us</a>
                            </li>
                            <li><a href="#">Contact us</a>
                            </li>
                            <li><a href="#">Hot to use</a>
                            </li>
                        </ul>
                    </div>
                    <div class="b-footer__nav__col col-md-3 col-sm-5 col-xs-8">
                        <div class="b-footer__nav__col__title">Categories</div>
                        <ul>
                            <li><a href="#">Attraction</a></li>
                            <li><a href="#">Restaurants</a></li>
                            <li><a href="#">Hot Place</a></li>
							<li><a href="#">YOLO Plan</a></li>
                        </ul>
                    </div>
                </div>
                <!-- //row -->
            </div>
            <!-- //container -->
        </div>
        <!--//b-footer__info-->
    </div>
    <!--//b-footer-->
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
					<option value=""></option>
				   <option value="seoul">서울</option>
				   <option value="Gyeonggi">경기</option>
				</select>
			</div>
			<div class="b-form__row m--centered"> <a href="#" class="btn">가입하기</a> </div>
		</div>
	</div>
</div>
	<!--// login-->
	<script src="js/jquery.min.js"></script>
    <script src="js/dropzone.js"></script>
    <script src="js/chosen.jquery.min.js"></script>
    <script src="js/ion.rangeSlider.min.js"></script>
    <script src="js/jquery.popup.min.js"></script>
    <script src="js/jssor.slider.mini.js"></script>
    <script src="js/lightcase.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/masonry.pkgd.min.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/tabs.js"></script>
    <script src="js/tooltip.js"></script>
    <script src="js/compiled_lib.js"></script>
    <script src="js/custum.js"></script>
    <script src="js/jquery.custom-scrollbar.js"></script>
    <script src="js/main.js"></script>

</body>

</html>