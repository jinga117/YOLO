<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<li><a href="https://www.instagram.com/yolo/">Hot to use</a></li>
					</ul>
				</div>

				<div class="b-footer__nav__col col-md-3 col-sm-5 col-xs-8">
					<div class="b-footer__nav__col__title">Categories</div>
					<ul>
						<li><a href="list_attraction">Attraction</a></li>
						<li><a href="list_restaurant">Restaurants</a></li>
						<li><a href="list_shopping?category_id=c03">Shopping</a></li>
						<li><a href="trip_schedule">YOLO Plan</a></li>
					</ul>
				</div>
			</div>
			<!-- //row -->
		</div>
		<!-- //container -->
	</div>
</div>
<!--//b-footer-->

<!--  일정 리스트 시작 -->
 <div class="b-plan-menu">
 	<div class="b-plan-menu-wrap">
		<ul>
			<li class="b-plan-menu-day" id="day1">
				Day1
			</li>
			<li class="b-plan-menu-day"  id="day2">
				Day2
			</li>
			<li class="b-plan-menu-day" id="day3">
				Day3
			</li>
			<li class="b-plan-menu-day" ><button class="btn_dup">일정저장</button></li>
		</ul>
	</div>
</div>
<!--  일정 리스트 끝 -->
</body>
</html>

<!-- 여행일정짜기 팝업 시작-->
<script type="text/javascript">
	$(document).ready(function() {
		var str = '<div class="b-sm-post__popup">';
		str+='<div class="plan_popup_title">Yolo Plan</div>';
		str+='<div>출발일 : <input type="date" name="plan_start_day" /></div>';
		for (var i=1;i<=3;i++) 
		{
			str+='<div class="b-sm-post_popup_day" day="' + i + '" onClick="appendDay(this)">Day' + i + '</div>';
		}
	 	$('.html_popup').popup({
	      	content: str,
	      type: 'html'
	  	});
	});

	function appendDay(obj) {

		var trip_id = $('#plan_trip_id').val();
		var trip_nickname = $('#plan_trip_nickname').val();
		var trip_day = $(obj).attr('day');
		
		/* $('#day'+trip_day).append('<li>day' + day + '</li>'); */
		$('#day'+trip_day).append('<li class="b-plan-menu-day-txt">' + trip_nickname + '</li>');
		$('.popup_close').trigger('click');

		/* $.ajax({
			url : "tripPlan?trip_day="+trip_day+"&trip_id="+trip_id+'&trip_nickname='+trip_nickname,
			type : "GET",
			datatype: "json",
			success : function(responseFromServer) {
				var data = jQuery.parseJSON(responseFromServer);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류 발생 \n"+textStatus + " : " + errorThrown);
			}      
		}); */
	}

	function setTripId(trip_id, trip_nickname) {
		$('#plan_trip_id').val(trip_id);
		$('#plan_trip_nickname').val(trip_nickname);
	}
</script>
<input type="hidden" id="plan_trip_id">
<input type="hidden" id="plan_trip_nickname">
 <!--//여행일정짜기 팝업 끝-->

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