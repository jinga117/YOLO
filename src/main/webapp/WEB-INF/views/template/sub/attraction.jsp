<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title>YOLO - You Only Live Once</title>
    <meta name="description" content="">
    <!-- <meta http-equiv="Cache-Control" content="public"> -->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- server -->
<!--     <script>
        String.prototype.replaceAll = function(search, replacement) {
            var target = this;
            return target.split(search).join(replacement);
        };

        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhr.open("GET", 'css/main.css', false);
        xhr.send();
        var lazyStyle = document.createElement('style');
        lazyStyle.innerHTML = xhr.responseText.replaceAll('../', './');
        document.head.appendChild(lazyStyle);
    </script> -->
    <link rel="stylesheet" href="css/main.css">
    <!--[if lt IE 9]>
    <script src="js/vendor/html5-3.6-respond-1.4.2.min.js"></script>
    <![endif]-->
</head>

<body class="home">
<!--[if lt IE 8]>
<p class="browserupgrade"></p>
<![endif]-->
    <div class="b-preloader animated yt-loader">
        <div class="b-preloader__decor"></div>
    </div>
    <header class="b-header clearfix">
        <a href="index.html" class="logo"> <img src="img/logo.png" alt="YOLO" title="YOLO"></a>
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
            <!--div class="b-header__ctrl__item"> <a href="Add-Place.html" class="btn btn--black"><i class="fa fa-plus-square" aria-hidden="true"></i><span>어디를 여행하고 싶으세요?</span></a> </div-->
           
          
        </div>
        <!--.b-header__ctrl-->
        <div class="b-nav-toggle closed"><img src="img/mobile-logo.png" alt="logo" width="130" height="39"><i class="fa fa-chevron-down" aria-hidden="true"></i>
        </div>
        <nav class="b-nav">
            <ul>
                <li class="menu-item-has-children">
                    <a href="attraction.html"> <i class="fa fa-map-marker" aria-hidden="true"></i>Attraction</a>
                    <ul>
                        <li><a href="attraction.html">연령별</a>
                        </li>
                        <li><a href="attraction.html">테마별</a>
                        </li>
						 <li><a href="attraction.html">쇼핑명소</a>
                        </li>
                        <li><a href="attraction.html">K-POP 한류</a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item-has-children"> <a href="attraction.html"><i class="fa fa-star-o" aria-hidden="true"></i>Restaurant</a>
                    <ul>
                        <li><a href="attraction.html">혼밥</a>
                        </li>
                        <li><a href="attraction.html">혼술</a>
                        </li>
                    </ul>
                </li>
                <li> <a href="attraction.html"><i class="fa fa-bars" aria-hidden="true"></i>Hot Place</a> </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-mobile" aria-hidden="true"></i>Smart Plan</a>
                    <ul>
                        <li><a href="attraction.html">여행 일정짜기</a>
                        </li>
                        <li><a href="attraction.html">여행 발자취</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!--//b-nav-->
    </header>
    <!-- .b-header -->
    <div class="b-main-container" id="content">
         <div class="b-pop-places container">
            <h2 class="b-cont-title">Attraction</h2>
            <div class="b-slider owl-carousel owl-carousel-1">
                <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="#"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/centralPark.jpg" alt="분당 중앙공원"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="places.html" class="b-pop-place__name">분당 중앙공원</a>
                            <h5 class="b-pop-place__cat">경기도 성남시</h5>
							<div><a href="places.html" class="b-pop-place-comment">가족과 산책하기 좋은 공원</a></div>
						</div>
                    </div>
                </div>
               <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="#"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/centralPark.jpg" alt="분당 중앙공원"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="attraction.html" class="b-pop-place__name">분당 중앙공원</a>
                            <h5 class="b-pop-place__cat">경기도 성남시</h5>
							<div><a href="places.html" class="b-pop-place-comment">가족과 산책하기 좋은 공원</a></div>
						</div>
                    </div>
                </div>
               <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="#"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/centralPark.jpg" alt="분당 중앙공원"></a>
							<a href="#" class="b-icon-medal"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="attraction.html" class="b-pop-place__name">분당 중앙공원</a>
                            <h5 class="b-pop-place__cat">경기도 성남시</h5>
							<div><a href="places.html" class="b-pop-place-comment">가족과 산책하기 좋은 공원</a></div>
						</div>
                    </div>
                </div>
               <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="#"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/centralPark.jpg" alt="분당 중앙공원">
                            </a> <a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="attraction.html" class="b-pop-place__name">분당 중앙공원</a>
                            <h5 class="b-pop-place__cat">경기도 성남시</h5>
							<div><a href="places.html" class="b-pop-place-comment">가족과 산책하기 좋은 공원</a></div>
						</div>
                    </div>
                </div>
               <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="#"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/centralPark.jpg" alt="분당 중앙공원">
                            </a> <a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="attraction.html" class="b-pop-place__name">분당 중앙공원</a>
                            <h5 class="b-pop-place__cat">경기도 성남시</h5>
							<div><a href="places.html" class="b-pop-place-comment">가족과 산책하기 좋은 공원</a></div>
						</div>
                    </div>
                </div>
                <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="#"><img width="370" height="245" class="b-pop-place__img__img" src="img/photo/centralPark.jpg" alt="분당 중앙공원"></a>
							<a href="#" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="Like"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating">4,8</div> <a href="attraction.html" class="b-pop-place__name">분당 중앙공원</a>
                            <h5 class="b-pop-place__cat">경기도 성남시</h5>
							<div><a href="places.html" class="b-pop-place-comment">가족과 산책하기 좋은 공원</a></div>
						</div>
                    </div>
                </div>
            </div>
            <!-- .b-slider -->
            <div class="row m--centered">
                <div class="col-md-4 col-md-offset-4"><a href="#" class="btn">View all places</a>
                </div>
            </div>
        </div>
    <!-- //main-container -->
      <div class="b-footer">
        <div class="b-footer__info">
            <div class="container clearfix">
                <div class="row">
                    <div class="b-footer__text col-md-3 col-sm-12"> <a href="index.html" class="b-footer__logo">YOLO</a>
                        <p>You Only Live Once<br />
							Enjoy Your Life!
						</p>
                        <div class="b-footer__copyright">© 2016 All Rights Reserved</div>
                    </div>
                    <div class="b-footer__nav__col col-md-2 col-md-offset-1 col-sm-3 col-xs-4">
                        <div class="b-footer__nav__col__title">About us</div>
                        <ul>
                            <li><a href="#">YOLO</a>
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