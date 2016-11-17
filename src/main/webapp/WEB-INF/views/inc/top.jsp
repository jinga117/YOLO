<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <c:if test="${user_id == null }">
                <a href="loginPro" class="ab-item login jquery_popup"> <i class="fa fa-unlock-alt" aria-hidden="true"></i><span>Log In</span></a>
            </c:if>
         <c:if test="${user_id != null }">
            <a href="logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i><span>Log Out</span></a> 
         </c:if>
            </div>
        <div class="b-header__ctrl__item">
                <form class="searchbox">
                    <input type="search" placeholder="어디를 여행하고 싶으세요?" name="search" class="searchbox-input" onkeyup="buttonUp()">
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
                    <a href="list_attraction"> <i class="fa fa-map-marker" aria-hidden="true"></i>Travel</a>
                    <ul>
                        <li><a href="list_age_all">연령별</a></li>
                        <li><a href="list_theme">테마별</a></li>
                        <li><a href="list_attraction">인원별</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i>Restaurant</a>
                    <ul>
                        <li><a href="list_attraction">식당</a>
                        </li>
                        <li><a href="list_attraction">카페</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa fa-bars" aria-hidden="true"></i>Shopping</a>
                   <ul>
                        <li><a href="list_attraction">쇼핑</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-mobile" aria-hidden="true"></i>Smart Plan</a>
                    <ul>
                        <li><a href="list_attraction">여행 일정짜기</a>
                        </li>
                        <li><a href="list_attraction">여행 발자취</a>
                        </li>
                    </ul>
                </li>
                <c:if test="${isadmin==1 }">
                <li class="menu-item-has-children"> <a href="#"><i class="fa fa-mobile" aria-hidden="true"></i>관리자페이지</a>
                    <ul>
                        <li><a href="userlist">회원리스트</a>
                        </li>
                    </ul>
                </li>
                </c:if>
            </ul>
        </nav>
        <!--//b-nav-->
    </header>
    <!-- //b-header -->
    
    <!-- login-->
    <div class="hidden b-jquery-popup">
       <form action="loginPro" method="post">
       <input type="hidden" name="isadmin" value="${isadmin }">
             <div class="b-form-reg-popup">
                 <h2 class="b-form-reg-popup__title m--centered">YOLO Login</h2>
             <div class="b-form__row">
                     <input type="text" id="user_id" name="user_id" placeholder="Your ID"> </div>
                 <div class="b-form__row">
                     <input type="password"  id="password" name="password" placeholder="Your Password" class="login_password"> </div>
                 <div class="b-form__row m--centered">
                     <button class="btn btn-success m--border-radius-right" type="submit">로그인</button>
                 </div>
             </div>
         </form>
     </div>
   <!--// login-->