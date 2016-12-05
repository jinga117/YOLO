<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<li><a href="how_to_use">How to use</a></li>
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

<!--  일정 리스트 시작 -->
	<!-- 여행일정짜기 팝업 시작-->
	<script type="text/javascript">
		var trip_start="", trip_title="";
		var arr_trip_id = new Array();
		var arr_trip_nickname = new Array();
		var arr_trip_plan_pay = new Array();
		var arr_trip_plan_memo = new Array();
		$(document).ready(function() {
			$.ajax({
				url : "getTripPlan",
				type : "POST",
				data: {
					user_id: '${user_id}',
				},
				success : function(responseFromServer) {
					var data = jQuery.parseJSON(responseFromServer);
					trip_start = data.trip_start;
					trip_title = data.trip_title;
					arr_trip_id[1] = data.trip_id_1;
					arr_trip_nickname[1] = data.trip_nickname_1;
					arr_trip_plan_pay[1] = data.trip_plan_pay_1;
					arr_trip_plan_memo[1] = data.trip_plan_memo_1;
					arr_trip_id[2] = data.trip_id_2;
					arr_trip_nickname[2] = data.trip_nickname_2;
					arr_trip_plan_pay[2] = data.trip_plan_pay_2;
					arr_trip_plan_memo[2] = data.trip_plan_memo_2;
					arr_trip_id[3] = data.trip_id_3;
					arr_trip_nickname[3] = data.trip_nickname_3;
					arr_trip_plan_pay[3] = data.trip_plan_pay_3;
					arr_trip_plan_memo[3] = data.trip_plan_memo_3;
					
					for (var i=1;i<=3; i++)
					{
						// 밑에 히든 값에 추가하기
						$('#trip_id_'+i).val(arr_trip_id[i]);
						$('#trip_nickname_'+i).val(arr_trip_nickname[i]);
						$('#form_trip_start').val(trip_start);
						$('#form_trip_title').val(trip_title);
						$('#trip_plan_pay_'+i).val(arr_trip_plan_pay[i]);
						$('#trip_plan_memo_'+i).val(arr_trip_plan_memo[i]);

						// 오른쪽 일정 메뉴에 선택한 여행지 추가하기
						if (arr_trip_id[i]!='')
						{
							var tooltip = '비용: ' + arr_trip_plan_pay[i];
							tooltip+='내용:' + arr_trip_plan_memo[i];

							$('#day'+i).append('<li class="b-plan-menu-day-txt" trip_id="' + arr_trip_id[i] + '" title="' + tooltip + '">' + arr_trip_nickname[i] + '</li> <button id="trip_plan_delete" trip_id="' + arr_trip_id[i] + '" trip_day="' + i + '" onClick="delete_trip_plan(this)">X</button>');
						}
					}

							
					$('.html_popup').popup({
						content: getPopupString(),
						type: 'html'
					});
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("오류 발생 \n"+textStatus + " : " + errorThrown);
				}      
			});
		 });
	
		function appendDay(obj) {
			var trip_id = $('#plan_trip_id').val();
			var trip_nickname = $('#plan_trip_nickname').val();
			var trip_day = $(obj).attr('trip_day');
			
			// 일정짜기에서 Day 당 한 장소만 선택하게 하기
			var countDay = $('#day'+trip_day).find('li').length;
			if (countDay >= 1) {
				alert ("하루에 한 장소만 선택 가능합니다.");
				return false;
			};
			
			//일정짜기에서 같은 장소 중복 선택 못 하게 하기
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
			var trip_plan_pay = $(obj).parent().find('#trip_plan_pay').val();
			var trip_plan_memo = $(obj).parent().find('#trip_plan_memo').val();
			var tooltip = '비용: ' + trip_plan_pay;
			tooltip+='내용:' + trip_plan_memo;

			$('#day'+trip_day).append('<li class="b-plan-menu-day-txt" trip_id="' + trip_id + '" title="' + tooltip + '">' + trip_nickname + '</li> <button id="trip_plan_delete" trip_id="' + trip_id + '" trip_day="' + trip_day + '" onClick="delete_trip_plan(this)">X</button>');

			$('#trip_id_'+trip_day).val(trip_id);
			$('#trip_nickname_'+trip_day).val(trip_nickname);
			$('#trip_plan_pay_'+trip_day).val(trip_plan_pay);
			$('#trip_plan_memo_'+trip_day).val(trip_plan_memo);

			$('#trip_plan_pay').eq(parseInt(trip_day)-1).val(trip_plan_pay);
			//alert('/' + $('#trip_plan_pay*').eq(parseInt(trip_day)-1).val() + '/');
			$('#trip_plan_memo').eq(parseInt(trip_day)-1).val(trip_plan_memo);
	
			saveTripPlan();	// 자료 저장

			$('.popup_close').trigger('click'); 		// Modal 창 닫음
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
			$('#form_trip_start').val($(obj).val());
		}

		function setValueTripTitle(obj) {
			$('#form_trip_title').val($(obj).val());
		}

		// Day 선택하면 선택한 Day div 가 보이게 하기
		function showDiv(obj) {
			var trip_day = $(obj).attr('trip_day');
			var parent = $(obj).closest('div').find('#plan_popup_wrap_'+trip_day);
			$(parent).attr('visibility', '');
			$(parent).attr('z-index', '9999999');
			$(parent).attr('top', 80);
			$(parent).show();
			$('#plan_start_wrap').hide(); // Day 선택하면 출발일 감추기
		}
		
		// 선택한 일정 저장
		function saveTripPlan() {
			var trip_start = 	$('#form_trip_start').val();
			var trip_title = 	$('#form_trip_title').val();
			$.ajax({
				url : "tripPlan",
				type : "POST",
				data: {
					user_id: '${user_id}',
					trip_start: trip_start,
					trip_title: trip_title,
					trip_id_1: $('#trip_id_1').val(),
					trip_nickname_1: $('#trip_nickname_1').val(),
					trip_plan_pay_1: $('#trip_plan_pay_1').val(),
					trip_plan_memo_1: $('#trip_plan_memo_1').val(),
					trip_id_2: $('#trip_id_2').val(),
					trip_nickname_2: $('#trip_nickname_2').val(),
					trip_plan_pay_2: $('#trip_plan_pay_2').val(),
					trip_plan_memo_2: $('#trip_plan_memo_2').val(),
					trip_id_3: $('#trip_id_3').val(),
					trip_nickname_3: $('#trip_nickname_3').val(),
					trip_plan_pay_3: $('#trip_plan_pay_3').val(),
					trip_plan_memo_3: $('#trip_plan_memo_3').val(),
				},
				success : function(responseFromServer) {
					var data = jQuery.parseJSON(responseFromServer);
					// alert(data.result);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("오류 발생 \n"+textStatus + " : " + errorThrown);
				}      
			});
		}

		
		function delete_trip_plan(obj) {
			var trip_day = $(obj).attr('trip_day');
			
			// Planner에서 해당 일정 같이 삭제하기
			$(".day").each(function() {
				var dayTxt = ($(this).text());
				var plannerDay =(parseInt(trip_start.substring(8))+parseInt(trip_day)-1);
				console.log(plannerDay +"," + dayTxt.trim() + ",");
				if( plannerDay ==dayTxt.trim().substring(0,2)) { 	 // 여행일과 YoloPlanner의 날짜(앞 2자리만 가져옴)이 같을 경우 해당 td 내용을 지워줌
					$(this).html("<b>"+plannerDay + "</b><br />");
					$(this).css("background","#f2f2f2");
				}
			})
			
			// 추가됐던 여행일정 지우기
			$(obj).parent().find(".b-plan-menu-day-txt").remove();

			$('#trip_id_'+trip_day).val('');
			$('#trip_nickname_'+trip_day).val('');
			$('#trip_plan_pay_'+trip_day).val('');
			$('#trip_plan_memo_'+trip_day).val('');
			
			$(obj).remove();

			saveTripPlan();		// 다시 저장
			
/* 			setTimeout(function() { // 플래너 0.5초 후 리로드
				location.reload();
			},100);
			 */
		}

		// 추가됐던 여행일정 지우기
		function delete_trip_plan_all(obj) {
			for (var trip_day=1; trip_day<=3; trip_day++)
			{
				$('#day'+trip_day).html('');
				$('#trip_id_'+trip_day).val('');
				$('#trip_nickname_'+trip_day).val('');
				$('#trip_plan_pay_'+trip_day).val('');
				$('#trip_plan_memo_'+trip_day).val('');
				$('#form_trip_title').val('');
				$('#form_trip_start').val('');
			}
			saveTripPlan();		// 다시 저장
			setTimeout(function() {
				location.reload();
			},100);
		}

		function getPopupString() {
				var str = '<div class="b-sm-post__popup">';
				str+='<div class="plan_popup_title">Yolo Plan</div>';
				str+='<div class="plan_popup_txt">출발일을 선택하시고 원하시는 Day를 선택해 주세요</div>';
				str+='<div id="plan_start_wrap"> <i class="fa fa-check" aria-hidden="true"></i> 출발일&nbsp;&nbsp;  <input type="date" id="trip_start" name="trip_start" onChange="setValueDate(this)"/ value="' + trip_start + '"></div>';
				str+='<div id="plan_start_wrap"> <i class="fa fa-check" aria-hidden="true"></i> 제목&nbsp;&nbsp;  <input type="text" id="trip_title" name="trip_title" onChange="setValueTripTitle(this)" value="' + trip_title + '"/></div>';
				str+='<div class="plan_popup_container">';
				str+='<ul>';
				str+='		<li class="plan_day_circle"><a class="plan_day_circle_link" href="#" onClick="showDiv(this)" trip_day="1">Day1</a></li>';
				str+='		<li class="plan_day_circle"><a class="plan_day_circle_link" href="#" onClick="showDiv(this)" trip_day="2">Day2</a></li>';
				str+='		<li class="plan_day_circle"><a class="plan_day_circle_link" href="#" onClick="showDiv(this)" trip_day="3">Day3</a></li>';
				str+='</ul>'; 
				
				for (var i=1;i<=3;i++) 
				{			
					str+='<div id="plan_popup_wrap_' + i + '" class="plan_popup_wrap" style="display:none">';
					str+='		<div id="b_plan_memo_wrap">'
					str+='			<div memo="' + i + '">Day' + i + ' 비용 <input type="number" min="1" max="999999999" class="trip_plan_pay" id="trip_plan_pay"  name="trip_plan_pay" value="'+arr_trip_plan_pay[i]+'" trip_day="' + i + '"/> 원</div>';
					str+='			<div memo="' + i + '"><span class="memo_title">Memo</span> <textarea rows="2" class="trip_plan_memo" placeholder="여행 메모를 입력해주세요" id="trip_plan_memo" name="trip_plan_memo" trip_day="' + i + '">'+arr_trip_plan_memo[i]+'</textarea></div>';
					str+='		</div>'
					str+='		<div class="b-sm-post_popup_day" trip_day="' + i + '" onClick="appendDay(this)">Day' + i + ' 선택 </div>'; 
					str+='</div>'
				}
				str+='</div>';
				return str;
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
						<button class="btn_plan"  id="trip_plan_delete_all" onClick="delete_trip_plan_all()">다시짜기</button>
					</li>
				</ul>
			</div>
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

<!-- 일정 value를 hidden으로 넘겨서 저장함 -->
<input type="hidden" id="form_trip_start">
<input type="hidden" id="form_trip_title">
<c:forEach var = "i" begin = "1" end = "3" step = "1">
<input type="hidden" id="trip_id_${i}">
<input type="hidden" id="trip_nickname_${i}">
<input type="hidden" id="trip_plan_pay_${i}">
<input type="hidden" id="trip_plan_memo_${i}">
</c:forEach>