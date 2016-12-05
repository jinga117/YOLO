<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
<link rel="stylesheet" href="css/admin.css">

<div class="info_update">
		<!-- 관리자 -->
	<div style="margin-left: 6%;">
		<ul class="b-cont-sub-menu b-cont-sub-menu-04">
			<li><a href="userlist">회원리스트</a></li>
			<li><a href="info_list">여행지정보</a></li>
			<li><a href="info_write">여행지 추가</a></li>
			<li><a href="review_list">전체댓글보기</a></li>
		</ul>
	</div>
	<div class="update_info_">
	<h3>여행지 정보 수정</h3>
		<h5 class="_h5"><a href="info_list">Back List</a></h5>
		<hr>
		<form method="post">
			<table class="update_info_t">
				<tr>
					<td class="_info">trip_NO. </td><td><input type="text" name="trip_id" readonly="readonly" value="${tvo.trip_id}"></td><td class="_info">이름 </td><td><input type="text" name="trip_nickname" value="${tvo.trip_nickname}"></td><td class="_info">category_id </td><td><input type="text" name="category_id" value="${tvo.category_id}"></td></tr>
					<tr><td class="_info">age_id </td><td><input type="text" name="age_id" value="${tvo.age_id}"></td><td class="_info">food_id </td><td><input type="text" name="food_id" value="${tvo.food_id}"></td><td class="_info">season_id</td><td><input type="text" name="season_id" value="${tvo.season_id}"></td></tr>
					<tr><td class="_info">person_id </td><td><input type="text" name="person_id" value="${tvo.person_id}"></td><td class="_info">kpop_id</td><td><input type="text" name="kpop_id" value="${tvo.kpop_id}"></td></tr>
					<tr><td class="_info">전체 주소 </td><td colspan="5"><input type="text" name="trip_address" value="${tvo.trip_address}"></td></tr>
					<tr><td class="_info">주소 1 </td><td><input type="text" name="trip_add1" value="${tvo.trip_add1}"></td><td class="_info">주소 2 </td><td><input type="text" name="trip_add2" value="${tvo.trip_add2}"></td><td class="_info">나머지 주소 </td><td><input type="text" name="trip_add3" value="${tvo.trip_add3}"></td></tr>
					<tr><td class="_info">내용 </td><td colspan="5"><input type="text" name="trip_content"  id="trip_content_height" value="${tvo.trip_content}"></td></tr>
					<tr><td class="_info">이용시간 </td><td colspan="5"><input type="text" name="trip_time" value="${tvo.trip_time}"></td></tr>
					<tr><td class="_info">홈페이지 </td><td colspan="5"><input type="text" name="trip_site" value="${tvo.trip_site}"></td></tr>
					<tr><td class="_info">전화번호 </td><td><input type="text" name="trip_tel" value="${tvo.trip_tel}"></td><td class="_info">비용 </td>	<td><input type="text" name="trip_pay" value="${tvo.trip_pay}"></td></tr>
					<tr><td class="_info">가는방법 </td><td colspan="5"><input type="text" name="trip_way" value="${tvo.trip_way}"></td></tr>
					<tr><td class="_info">위도 </td><td><input type="text" name="pos_x" value="${tvo.pos_x}"></td><td class="_info">경도 </td><td><input type="text" name="pos_y" value="${tvo.pos_y}"></td>
				</tr>
				<tr id="btn_update">
					<td colspan="7" ><input class="update_btn_size" type="submit" value="수 정">&nbsp;&nbsp; <input type="reset" value="취 소" class="update_btn_size"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
	<!-- 컨텐츠 영역 끝 -->
	
<!-- 푸터영역 시작 -->
<div class="b-footer">
	<div class="b-footer__info">
		<div class="container clearfix">
			<div class="row">
				<div class="b-footer__text col-md-3 col-sm-12">
					<a href="/yolo" class="b-footer__logo">YOLO</a>
					<p>
						You Only Live Once<br /> Enjoy Your Life!
					</p>
					<div class="b-footer__copyright">© 2016 All Rights Reserved</div>
					<div class="b-soc"> 
                    	<a href="https://www.facebook.com/YOLO.Reisen/" target="_new" class="soc-item"><i class="fa fa-facebook" aria-hidden="true"></i></a> 
                    	<a href="https://twitter.com/YouOnlyLiveOnce" target="_new" class="soc-item"><i class="fa fa-twitter" aria-hidden="true"></i></a> 
                    	<a href="https://www.instagram.com/yolo/" target="_new" class="soc-item"><i class="fa fa-instagram" aria-hidden="true"></i></a> 
                    </div>
				</div>

				<div
					class="b-footer__nav__col col-md-2 col-md-offset-1 col-sm-3 col-xs-4">
					<div class="b-footer__nav__col__title">About us</div>
					<ul>
						<li><a href="#">YOLO</a></li>
						<li><a href="#">Contact us</a></li>
						<li><a href="Contact_view">Hot to use</a></li>
					</ul>
				</div>

				<div class="b-footer__nav__col col-md-3 col-sm-5 col-xs-8">
					<div class="b-footer__nav__col__title">Categories</div>
					<ul>
						<li><a href="list_attraction?category_id=c01">Travel</a></li>
						<li><a href="list_restaurant">Restaurants</a></li>
						<li><a href="list_shopping?category_id=c02">Shopping</a></li>
						<li><a href="yoloplanner">YOLO Plan</a></li>
					</ul>
				</div>
			</div>
			<!-- //row -->
		</div>
		<!-- //container -->
	</div>
</div>
<!--//b-footer-->

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
<script src="js/list.js"></script>
<!-- 푸터영역 끝 -->
		