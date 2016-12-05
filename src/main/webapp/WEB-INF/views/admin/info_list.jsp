<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
	<link rel="stylesheet" href="css/admin.css">
	
    <script type="text/javascript">
        $(document).ready(function() {
        	
        	var alternateRowColors = function($table) {
        		$('tbody tr:odd', $table).removeClass('even').addClass('odd');
        		$('tbody tr:even', $table).removeClass('odd').addClass('even');
        	};
        		   
            $('#sortTable').each(function() {
                var $table = $(this);
                alternateRowColors($table);
                // 테이블 헤더 정렬
					    $('th', $table).each(function(column) {
                    // 헤더의 CSS 클래스가 sort-alpha로 설정되어있다면, ABC순으로 정렬
					       var $header = $(this);
                        // 클릭시 정렬 실행
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
                            var rows = $table.find('tbody > tr').get(); // 현재 선택된 헤더관련 행 가져오기
                          //sort()는 상당한 양의 비교를 반복적으로 수행하여 수행 성능을 많이 떨어뜨리기 때문에 Key를 이용해 수행성능 업그레이드 시키기
             	           
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
             				 alternateRowColors($table);
             			});
                    }
                }); // end table sort
            }); // end each()
        });   // end ready()
    </script>

	<!-- 컨텐츠 영역 시작 -->
<div class="info_list">
		<!-- 관리자 -->
	<div style="margin-left: 6%;">
		<ul class="b-cont-sub-menu b-cont-sub-menu-04">
			<li><a href="userlist">회원리스트</a></li>
			<li><a href="info_list">여행지정보</a></li>
			<li><a href="info_write">여행지 추가</a></li>
			<li><a href="review_list">전체댓글보기</a></li>
		</ul>
	</div>
	<h3>여행지 리스트</h3> 
	<table class="info_t" id="sortTable">
		<thead>
			<tr class="trip_info_title"><th class="sort">trip_id<a>▼</a></th><th  class="sort">카테고리 <a>▼</a></th><th class="sort">여행지 <a>▼</a></th><th>주소</th><th>위도</th><th>경도</th><th colspan="2"></th></tr>
		</thead>
		<tbody>	
			<c:forEach items="${list }" var="list">
				<tr class="trip_info_in">	
					<td class="trip_key">${list.trip_id}</td>
					<td class="trip_key">${list.category_id}</td>
					<td class="trip_nickname_info">${list.trip_nickname}</td>
					<td class="trip_address_info">${list.trip_address}</td>
					<td class="trip_key">${list.pos_x}</td>
					<td class="trip_key">${list.pos_y}</td>				
					<td class="trip_img_"><a href="update?trip_id=${list.trip_id}"><img src="img/update.png"></a></td>
					<td class="trip_img_"><a href="delete?trip_id=${list.trip_id}"><img src="img/delete.png"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
	