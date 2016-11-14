<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!--  헤더 영역 시작 -->
	<jsp:include page="inc/top.jsp" />
	<!--  헤더 영역 끝 -->
    <div class="b-main-container" id="content">
        <div class="b-promo lazy" data-src="img/main_visual_img.jpg">
            <div class="b-placeholder"></div>
            <div class="b-stars">
                <div class="stars"></div>
            </div>
            <div class="overlay"></div>
            <div class="b-promo__search container">
                <h1 class="b-promo__title">Where do you want to go?</h1>
                <form method="post" action="list">
                    <div class="b-promo__form">
                        <div class="b-promo__form__col1">
                            <select data-placeholder="연령대를 선택하세요" class="chosen-select" tabindex="2">
								<option value=""></option>
                                <option value="2030">20~30대</option>
                                <option value="3040">30~40대</option>
								<option value="4050">40~50대</option>
								<option value="5060">50대 이후</option>
                            </select>
						</div>
                        <div class="b-promo__form__col1">
                            <select data-placeholder="도시를 선택하세요" class="chosen-select" tabindex="2">
                                <option value=""></option>
                                <option value="seoul">서울</option>
                                <option value="Gyeonggi">경기도</option>
                            </select>
                        </div>
						<div class="b-promo__form__col1">
                            <input type="text" class="b-promo__form__input"  placeholder="장소 선택 ex) 경복궁"  name="search"> </div>
                        <div class="b-promo__form__col2">
                            <button class="btn btn-success m--border-radius-right" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <!--div class="scroll_block"> <img width="23" height="36" alt="Use your scrollwheel :)" class="animated infinite bounce" src="img/scroll.png"> </div-->
        </div>
     
    </div>
    <!-- //b-main-container -->
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->