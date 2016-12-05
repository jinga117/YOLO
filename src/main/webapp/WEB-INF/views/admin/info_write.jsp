<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
		<!-- 관리자 -->
	<div style="margin-left: 6%;">
		<ul class="b-cont-sub-menu b-cont-sub-menu-04">
			<li><a href="userlist">회원리스트</a></li>
			<li><a href="info_list">여행지정보</a></li>
			<li><a href="info_write">여행지 추가</a></li>
			<li><a href="review_list">전체댓글보기</a></li>
		</ul>
	</div>
<link rel="stylesheet" href="css/admin.css">
	<!-- 컨텐츠 영역 시작 -->
	<div class="info_write">
		<h3>정보 입력 페이지</h3>
		<h5 class="_h5"><a href="info_list_a">Back List</a></h5>
		<hr>
		<form method="post">
			<table class="write_info_add">
				<tr>
					<td class="_info">여행지key값</td><td><input type="text" name="trip_id" size="50" ></td>
					<td class="_info">카테고리</td>
					<td>
						<div class="select_cate">
							<select name="category_id" id="cate_update">
								<option value="c01">명소</option>
								<option value="c02">쇼핑</option>
								<option value="c03">먹거리</option>
							</select>
						</div>
					</td>
				</tr>

				<tr class="check_Tr">
					<td rowspan="5" class="_info">테마별</td>
					<td id="check_"  colspan="3">
						<input type="checkbox" name="age_id"value="a01">꽃청춘 
						<input type="checkbox" name="age_id"value="a02">꽃중년
					</td>
				</tr>
				<tr class="check_Tr">
					<td id="check_" colspan="3">
						<input type="checkbox" name="food_id"value="f01">식당
						<input type="checkbox" name="food_id"value="f02">카페
					</td>
				</tr>
				<tr class="check_Tr">
					<td id="check_" colspan="3">
						<input type="checkbox"name="season_id" value="s01">봄 
						<input type="checkbox"name="season_id" value="s02">여름 
						<input type="checkbox"name="season_id" value="s03">가을 
						<input type="checkbox"name="season_id" value="s04">겨울
					</td>
				</tr>
				<tr class="check_Tr">
					<td id="check_" colspan="3">
						<input type="checkbox"name="person_id" value="p01">나홀로
					 	<input type="checkbox"name="person_id" value="p02">커플 
					 	<input type="checkbox"name="person_id" value="p03">우정 
						<input type="checkbox"name="person_id" value="p04">가족
					</td>
				</tr>
				<tr class="check_Tr"><td id="check_" colspan="3"><input type="checkbox" name="kpop_id" value="k01">kpop</td></tr>
				
				<tr><td class="_info" >여행지 별칭</td><td colspan="3"><input type="text" name="trip_nickname" size="50"></td></tr>
				<tr><td class="_info">전체 주소</td><td colspan="3"><input type="text" name="trip_address" size="50"></td></tr>
				<tr><td class="_info">시</td><td><input type="text" name="trip_add1" ></td><td class="_info">구</td><td><input type="text" name="trip_add2"></td></tr>
				<tr><td class="_info">나머지 주소</td><td colspan="3"><input type="text" name="trip_add3" size="50"></td></tr>
				<tr><td class="_info">내용</td><td colspan="3"><input type="text" name="trip_content" size="50"></td></tr>
				<tr><td class="_info">이용시간</td><td colspan="3"><input type="text" name="trip_time" size="50"></td></tr>
				<tr><td class="_info">홈페이지</td><td colspan="3"><input type="text" name="trip_site" size="50"></td></tr>
				<tr><td class="_info">가는방법</td><td colspan="3"><input type="text" name="trip_way" size="50"></td></tr>
				<tr><td class="_info">전화번호</td><td><input type="text" name="trip_tel" size="50"></td><td class="_info">비용</td><td><input type="text" name="trip_pay" size="50"></td></tr>
				<tr><td class="_info">위도</td><td><input type="text" name="pos_x" size="50"></td><td class="_info">경도</td><td><input type="text" name="pos_y" size="50"></td></tr>
				<tr id="btn_update"><td colspan="4" class="btn_update_td"><input type="submit" value="등 록" class="write_btn_size">&nbsp;&nbsp; <input type="reset" value="취 소" class="write_btn_size"></td></tr>
			</table>
		</form>
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
		