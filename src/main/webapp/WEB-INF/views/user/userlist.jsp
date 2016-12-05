<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
<script type="text/javascript">
$(document).ready(function() {

	   $('#userList_t').each(function() {
	     var $table = $(this);
	     $('th', $table).each(function(column) {
	       var $header = $(this);
	       if ($header.is('.sort')) {
	         $header.addClass('clickable').hover(function() {
	           $header.addClass('hover');
	         }, function() {
	           $header.removeClass('hover');
	         }).click(function() {
				var sortDirection = 1;
	           if ($header.is('.sorted-asc')) {
	             sortDirection = -1;
	           }
	           //정렬시작
	       		//sort()는 상당한 양의 비교를 반복적으로 수행하여 수행 성능을 많이 떨어뜨리기 때문에 Key를 이용해 수행성능 업그레이드 시키기
	           var rows = $table.find('tbody > tr').get();
	           
	           $.each(rows, function(index, row){
	        		var $cell =  $(row).children('td').eq(column);
	        		row.sortKey = $cell.find('.sort-key').text().toUpperCase() + ' ' + $cell.text().toUpperCase();
	        	});
	           
					rows.sort(function(a, b){
						if(a.sortKey < b.sortKey) return -sortDirection;
						if(a.sortKey > b.sortKey) return sortDirection;
						return 0;
					});
					$.each(rows, function(index, row){
						$table.children('tbody').append(row);
						row.sortKey = null;
					});
					
			//반대 방향으로 정렬하기 //반환되는 값을 반대로 바꾸면 됩니다.
			$table.find('th').removeClass('sorted-asc')
	             .removeClass('sorted-desc');
	           if (sortDirection == 1) {
	             $header.addClass('sorted-asc');
	           }
	           else {
	             $header.addClass('sorted-desc');
	           }
	         });
	       }
	     });
	   });
	 });
</script>
<style>
.list_wrap {
	width: 70%;
	margin: 0 auto;
	margin-bottom: 8%;
}

#userList_t {
	margin: 0 auto;
	font-size: 15px;
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

#userList_t th {
	height: 40px;
	background-color: #00376f;
	color: white;
	text-align: center;
}

#font_grey {
	height: 30px;
	color: #808080;
}
#userList_t td{
	border: inactiveborder;
}
.user_col{
	background-color: #f2f2ff;
	font-weight: 700;
	color: #26004d;
}
#userList_t tr{
	border: 1px solid #d0d0d0;
}
#userList_t tr, td {
	border-collapse: collapse;
	text-align: center;
	font-style: 맑은고딕;
}

h5 {
	text-align: right;
	margin: 0 15px 15px 0;
}

.clickable {
	cursor: pointer;
}

.hover {
	text-decoration: underline;
}

.ad-head {
	background-color: #5be0dd;
}
.trip_email{
	width: 35%;
}

</style>
<!-- 컨텐츠 영역 시작 -->
	<div class="b-main-container" id="content">
		<!-- 관리자 -->
	<div style="margin-left: 6%;">
		<ul class="b-cont-sub-menu b-cont-sub-menu-04">
			<li><a href="userlist">회원리스트</a></li>
			<li><a href="info_list">여행지정보</a></li>
			<li><a href="info_write">여행지 추가</a></li>
			<li><a href="review_list">전체댓글보기</a></li>
		</ul>
	</div>
		<div class="list_wrap">
			<h2 align="center">User List </h2><h5>회원수 : ${userCount }</h5>
			
				<table id="userList_t">
					<thead>
						<tr>
							<th class="sort" >사용자<a>▼</a></th>
							<th>password</th>
							<th class="sort">e-mail<a>▼</a></th>
							<th class="sort">성별<a>▼</a></th>
							<th class="sort">나이	<a>▼</a></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list">
							<tr>	
								<td class="user_col">${list.user_id}</td>
								<td id="font_grey">${list.password}</td>
								<td class="trip_email" id="font_grey">${list.email}</td>
								<td id="font_grey">${list.gender}</td>
								<td id="font_grey">${list.age}</td>
								<td><a href="/yolo/admindelete?user_id=${list.user_id}"><img src="img/delete.png""></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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