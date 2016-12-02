<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="UTF-8">
    <title>YOLO - You Only Live Once</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/main1.css">

    <script src="https://code.jquery.com/jquery.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body class="home">
    <div class="b-preloader animated yt-loader">
        <div class="b-preloader__decor"></div>
    </div>
    
    <header class="b-header clearfix">
        <a href="/yolo" class="logo"> <img src="img/logo.png" alt="YOLO" title="YOLO"></a>
        <div class="b-header__ctrl">
			<div class="b-header__ctrl__item" ></div>
			<div class="b-header__ctrl__item">
			
				<!-- 로그인 안 했을 때 -->
				<c:if test="${user_id == null }">
					<a href="loginPro" class="login jquery_popup"><i class="fa fa-unlock-alt" aria-hidden="true"></i><span>Log In</span></a>
					<a href="userWrite_view" class="member"><i class="fa fa-user-plus" aria-hidden="true"></i><span>회원가입</span></a>
				</c:if>
				
				<!-- 로그인 했을 때 -->
				<c:if test="${user_id != null }">
					 <a href="logout" class="login"><i class="fa fa-unlock-alt" aria-hidden="true"></i><span>Log Out</span></a>
					 <a href="my_page" class="member"><i class="fa fa-user" aria-hidden="true"></i><span>My Page</span></a>
				</c:if>
        	</div>
        	
        	<div class="b-header__ctrl__item">
                <form action="searchAll_list" class="searchbox">
					<input type="search" placeholder="어디를 여행하고 싶으세요?" name="trip_nickname" class="searchbox-input" onkeyup="buttonUp()">
                    <button type="submit" class="searchbox-submit"><i class="fa fa-search" aria-hidden="true"></i></button> 
                    <span class="searchbox-icon"><i class="fa fa-search" aria-hidden="true"></i></span>
                </form>
            </div>
        </div>
        
        <!--.b-header__ctrl-->
        <div class="b-nav-toggle closed"><img src="img/mobile-logo.png" alt="logo" width="130" height="39"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
        <nav class="b-nav">
            <ul>
                <li class="menu-item-has-children">
                    <a href="list_attraction?category_id=c01"><i class="fa fa-suitcase" aria-hidden="true"></i>Travel</a>
                    <ul>
                        <li><a href="list_age">연령별</a></li>
                        <li><a href="list_theme">테마별</a></li>
                        <li><a href="list_person">동행별</a></li>
                    </ul>
                </li>
                
                <li class="menu-item-has-children"> <a href="list_restaurant"><i class="fa fa-cutlery" aria-hidden="true"></i>Restaurant</a>
                    <ul>
                        <li><a href="list_restaurant_search?food_id=f01">restaurant</a></li>
                        <li><a href="list_restaurant_search?food_id=f02">Bakery & Cafe</a></li>
                    </ul>
                </li>
                
                <li>
                	<a href="list_shopping?category_id=c03"><i class="fa fa-gift" aria-hidden="true"></i>Shopping</a>
                </li>
                
                <li class="menu-item-has-children"><a href="yoloplaner"><i class="fa fa-calendar" aria-hidden="true"></i>Yolo Plan</a>
                	<ul>
                		<li><a href="yoloplaner">Yolo Planer</a></li>
                		<li><a href="list_recommand?re_num=re">추천 일정</a></li>
                	</ul>
                </li>
                
                <!-- 관리자 일 때 -->
                <c:if test="${isadmin==1 }">
                	<li class="menu-item-has-children"><a href="#"><i class="fa fa-key" aria-hidden="true"></i>Admin</a>
                    	<ul>
                        	<li><a href="userlist">회원 리스트</a></li>
                        	<li><a href="info_list">여행지 리스트</a></li>
                        	<li><a href="info_write">여행지 추가</a></li>
                        	<li><a href="review_list">댓글 리스트</a></li>
                    	</ul>
                	</li>
                </c:if>
            </ul>
        </nav>
        <!--//b-nav-->
    </header>
    <!-- //b-header -->
    
    <!-- login-->
	<input type="hidden" id="realId">
	<input type="hidden" id="realPassword">
	<div class="hidden b-jquery-popup">
		<input type="hidden" name="isadmin" value="${isadmin }">
           <div class="b-form-reg-popup">
               <h2 class="b-form-reg-popup__title m--centered">YOLO Login</h2>
	            <div class="b-form__row">
	                 <input type="text" id="user_id" name="user_id" placeholder="Your ID" value="" onChange="changeUserId(this)" onKeyup="loginProKeyUp(event)">
	            </div>
	            <div class="b-form__row">
	                 <input type="password"  id="password" name="password" placeholder="Your Password" class="login_password"  required="required" value="" onChange="changePassword(this)" onKeyup="loginProKeyUp(event)">
	            </div>
	            <h6><a href="findid">아이디찾기</a>/<a href="findpwd">비밀번호찾기</a></h6>
	            <div class="b-form__row m--centered">
	                 <button class="btn btn-success m--border-radius-right" id="loginbtn" onClick="loginPro();">로그인</button>
	            </div>
	        </div>
     </div>
   <!--// login-->