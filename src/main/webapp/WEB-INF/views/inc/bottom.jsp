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
						<li><a href="list_shopping?category_id=c02">Shopping</a></li>
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
	<!-- 여행일정짜기 팝업 시작-->
	<script type="text/javascript">
		$(document).ready(function() {
			var str = '<div class="b-sm-post__popup">';
			str+='<div class="plan_popup_title">Yolo Plan</div>';
			str+='<div class="plan_popup_txt">출발일을 선택하시고 원하시는 Day를 선택해 주세요</div>';
			str+='<div> <i class="fa fa-check" aria-hidden="true"></i> 출발일&nbsp;&nbsp;  <input type="date" id="trip_start" name="trip_start" onChange="setValueDate(this)"/></div>';
			str+='<div class="plan_popup_container">';
	 		str+='<ul>';
			str+='		<li class="plan_day_circle"><a class="plan_day_circle_link" href="#" onclick="">Day1</a></li>';
			str+='		<li class="plan_day_circle"><a class="plan_day_circle_link" href="#">Day2</a></li>';
			str+='		<li class="plan_day_circle"><a class="plan_day_circle_link" href="#">Day3</a></li>';
			str+='</ul>'; 
			
			for (var i=1;i<=3;i++) 
			{
		 		var title = getCookie('schedule_'+i);
		 		var index = title.indexOf('비용:');
		 		var index2 = title.indexOf('내용:');
		 		var index3 = title.indexOf('"', index2+1);
		 		var pay = title.substring(index+4, index2);
		 		var content = title.substring(index2+3, index3);
		 //		alert(index+'/'+index2+'/'+pay+'/'+content);
				
				str+='<div id="plan_popup_wrap" class="plan_popup_wrap_' + i + '" >';
				str+='		<div id="b_plan_memo_wrap">'
				/* str+='		<div memo="' + i + '">Day' + i + ' 비용 <input type="number" min="1" max="999999999" class="trip_plan_pay" id="modal_trip_plan_pay_' + i +'" name="modal_trip_plan_pay_' + i +'" value="'+pay+'" trip_day="' + i + '" onChange="setValuePay(this)"/> 원';
				str+='			<div memo="' + i + '"><span class="memo_title">Memo</span> <textarea rows="2" class="trip_plan_memo" placeholder="여행 메모를 입력해주세요" id="modal_trip_plan_memo_' + i +'" name="modal_trip_plan_memo_' + i +'" trip_day="' + i + '" onChange="setValueMemo(this)">'+content+'</textarea>'; */
				str+='			<div memo="' + i + '">Day' + i + ' 비용 <input type="number" min="1" max="999999999" class="trip_plan_pay" id="modal_trip_plan_pay_' + i +'" name="modal_trip_plan_pay_' + i +'" trip_day="' + i + '" onChange="setValuePay(this)"/> 원</div>';
				str+='			<div memo="' + i + '"><span class="memo_title">Memo</span> <textarea rows="2" class="trip_plan_memo" placeholder="여행 메모를 적어 주세요" id="modal_trip_plan_memo_' + i +'" name="modal_trip_plan_memo_' + i +'" trip_day="' + i + '" onChange="setValueMemo(this)"></textarea></div>';
				str+='		</div>'
			 	str+='		<div class="b-sm-post_popup_day" day="' + i + '" onClick="appendDay(this)">Day' + i + ' 선택 </div>';
				str+='</div>'
				$('#day'+i).html(getCookie('schedule_'+i));
			}
			str+='</div>'
			
			// 추가됐던 여행일정 지우기
			$('#trip_plan_delete*').click(function() {
				$(this).parent().find(".b-plan-menu-day-txt").remove();

				var trip_day = $(this).attr('trip_day');
				$('#trip_plan_pay_'+trip_day).val('');
				$('#trip_plan_memo_'+trip_day).empty();
				$(this).remove();
	
				for (var i=1;i<=3;i++) {
					setCookie('schedule_'+i, $('#day'+i).html(), 1);
				}
			});
			
			// 여행일정 모두 지우기
			$('#trip_plan_delete_all').click(function() {
				$(this).parent().parent().find(".b-plan-menu-day-txt").remove();
				$("#trip_plan_delete").remove();
			});
			
			// Day 선택하기
			$('.plan_day_circle_link').click(function() {
				/* $('#plan_popup_wrap').css('visibility','visible'); */
				$('.plan_popup_wrap').show();
			});
			
		 	$('.html_popup').popup({
		      	content: str,
				type: 'html'
		  	});
		 });
	
		function appendDay(obj) {
			var trip_id = $('#plan_trip_id').val();
			var trip_nickname = $('#plan_trip_nickname').val();
			var trip_day = $(obj).attr('day');
	
			// 하루에 한개만 선택
			var countDay = $('#day'+trip_day).find('li').length;
			if (countDay >= 1) {
				alert ("하루에 한 장소만 선택 가능합니다.");
				return false;
			};
	
			var existsFlag = false;
			$('.b-plan-menu-day-txt*').each(function () {
				var trip_id_this = $(this).attr('trip_id');
				if (trip_id_this==trip_id) {
					alert ('같은 장소는 선택하실 수 없습니다.');
					existsFlag = true;
					return true;
				}
			});
			
			if (existsFlag) return;
			
			// 오른쪽 일정 메뉴에 선택한 여행지 추가하기
			var tooltip = '비용: ' + $('#trip_plan_pay_'+trip_day).val();
			tooltip+='내용:' + $('#trip_plan_memo_'+trip_day).val();
			$('#day'+trip_day).append('<li class="b-plan-menu-day-txt" trip_id="' + trip_id + '" title="' + tooltip + '">' + trip_nickname + '</li> <button id="trip_plan_delete" trip_id="' + trip_id + '" trip_day="' + trip_day + '">X</button>');
			$('#trip_id_'+trip_day).val(trip_id);
			$('#trip_nickname_'+trip_day).val(trip_nickname);
			$('.popup_close').trigger('click'); 		// Modal 창 닫음
			
					
			// 추가됐던 여행일정 지우기
			$('#trip_plan_delete').click(function() {
				$(this).parent().find(".b-plan-menu-day-txt").remove();
				var trip_day = $(this).attr('trip_day');
				$('#trip_plan_pay_'+trip_day).val('');
				$('#trip_plan_memo_'+trip_day).empty();
	
				$(this).remove();
				for (var i=1;i<=3;i++) {
					setCookie('schedule_'+i, $('#day'+i).html(), 1);
				}
			});
			
			for (var i=1;i<=3;i++) {
				setCookie('schedule_'+i, $('#day'+i).html(), 1);
			}
		}
		
		// trip_start 날짜 가져오기
		$('#trip_start').val(new Date().toDateInputValue());
		
		//trip_id, trip_nickname 값 가져오기
		function setTripId(trip_id, trip_nickname) {
			$('#plan_trip_id').val(trip_id);
			$('#plan_trip_nickname').val(trip_nickname);
		}
		
		function setValuePay(obj) {
			var trip_day = $(obj).attr('trip_day');
			$('#trip_plan_pay_' + trip_day).val($(obj).val());
		}
		
		function setValueMemo(obj) {
			var trip_day = $(obj).attr('trip_day');
			$('#trip_plan_memo_' + trip_day).val($(obj).val());
		}
		
		function setValueDate(obj) {
			$('#trip_start').val($(obj).val());
		}
		
		function saveSchedule() {
			var formData = $("#formTripPlan").serialize();
			/* alert(formData);
			return false;  */
			$.ajax({
				url : "tripPlan",
				type : "POST",
				data: formData,
				success : function(responseFromServer) {
					alert(responseFromServer);
					var data = jQuery.parseJSON(responseFromServer);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("오류 발생 \n"+textStatus + " : " + errorThrown);
				}      
			});
		}
	</script>
	<input type="hidden" id="plan_trip_id">
	<input type="hidden" id="plan_trip_nickname">
	 <div id="b-plan-menu-wrap">
		 	<div class="b-plan-menu">
				<ul>
					<li class="day_title">Day1</li>
					<li class="b-plan-menu-day" id="day1"></li>
					<li class="day_title">Day2</li>
					<li class="b-plan-menu-day"  id="day2"></li>
					<li class="day_title">Day3</li>
					<li class="b-plan-menu-day" id="day3"></li>
					<li class="m--centered">
						<button class="btn_plan"  onClick="saveSchedule()">일정저장</button>
						<button class="btn_plan"  id="trip_plan_delete_all">다시짜기</button>
					</li>
				</ul>
			</div>
			
	 	<form action="tripPlan" method="post" id="formTripPlan">
			<input type="hidden" name="user_id" value="${user_id}">
			<input type='hidden' name='trip_start' id='trip_start' value="">
			<input type="hidden" name="trip_id_1" id="trip_id_1" value="">
			<input type="hidden" name="trip_id_2" id="trip_id_2" value="">
			<input type="hidden" name="trip_id_3" id="trip_id_3" value="">
			<input type="hidden" name="trip_nickname_1"  id="trip_nickname_1" value="">
			<input type="hidden" name="trip_nickname_2"  id="trip_nickname_2" value="">
			<input type="hidden" name="trip_nickname_3"  id="trip_nickname_3" value="">
			<input type="hidden" name="trip_plan_pay_1" id="trip_plan_pay_1"  value="0">
			<input type="hidden" name="trip_plan_pay_2"  id="trip_plan_pay_2" value="0">
			<input type="hidden" name="trip_plan_pay_3"  id="trip_plan_pay_3" value="0">
			<input type="hidden" name="trip_plan_memo_1"  id="trip_plan_memo_1"  value="">
			<input type="hidden" name="trip_plan_memo_2"  id="trip_plan_memo_2"  value="">
			<input type="hidden" name="trip_plan_memo_3"  id="trip_plan_memo_3"  value="">
		</form>
	</div>
	<!--  일정 리스트 끝 -->
</body>
</html>
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