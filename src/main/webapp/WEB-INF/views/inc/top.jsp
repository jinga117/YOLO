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
</head>

<body class="home">
    <div class="b-preloader animated yt-loader">
        <div class="b-preloader__decor"></div>
    </div>
    <header class="b-header clearfix">
        <a href="/yolo" class="logo"> <img src="img/logo.png" alt="YOLO" title="YOLO"></a>
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
        </div>
        <!--.b-header__ctrl-->
        <div class="b-nav-toggle closed"><img src="img/mobile-logo.png" alt="logo" width="130" height="39"><i class="fa fa-chevron-down" aria-hidden="true"></i>
        </div>
        <nav class="b-nav">
            <ul>
                <li class="menu-item-has-children">
                    <a href="list"> <i class="fa fa-map-marker" aria-hidden="true"></i>Attraction</a>
                </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i>Restaurant</a>
                    <ul>
                        <li><a href="list">혼밥</a>
                        </li>
                        <li><a href="list">혼술</a>
                        </li>
                    </ul>
                </li>
                <li> <a href="#"><i class="fa fa-bars" aria-hidden="true"></i>Hot Place</a> </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-mobile" aria-hidden="true"></i>Smart Plan</a>
                    <ul>
                        <li><a href="list">여행 일정짜기</a>
                        </li>
                        <li><a href="list">여행 발자취</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!--//b-nav-->
    </header>
    <!-- //b-header -->