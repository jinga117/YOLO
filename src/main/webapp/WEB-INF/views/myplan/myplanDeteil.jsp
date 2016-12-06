<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->
<link rel="stylesheet" href="css/plan.css">
<script type="text/javascript">

</script>
<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
	<div class="cal_a"><a href="yoloplanner" >Go To Planner</a></div>
	<div class="Info_calendar" id="inputTextToSave">
		<div class="trip_Info">
				<div class="cal_title" >${vo.trip_title }
					<div class="p_img"><a href="planUpdate?plan_no=${vo.plan_no }"><img src="img/update.png""></a>&nbsp;<a href="planDelete?plan_no=${vo.plan_no }"><img src="img/delete.png""></a></div>
				</div>
				<div class="days" ><span class="day_day">Day1</span><span class="start_day">${vo.trip_start }</span></div>
				<div class="t_info"><div class="trip_name">${vo.trip_nickname_1 }</div><div class="t_memo">${vo.trip_plan_memo_1 }</div><div class="t_pay">${vo.trip_plan_pay_1 }</div></div> 
				<div class="days" ><span class="day_day">Day2</span><span class="start_day">${tDay }</span></div>
				<div class="t_info"><div class="trip_name">${vo.trip_nickname_2 }</div><div class="t_memo">${vo.trip_plan_memo_2 }</div><div class="t_pay">${vo.trip_plan_pay_2 }</div></div>
				<div class="days"><span class="day_day">Day3</span><span class="start_day">${eDay }</span></div>
				<div class="t_info"><div class="trip_name">${vo.trip_nickname_3 }</div><div class="t_memo">${vo.trip_plan_memo_3 }</div><div class="t_pay">${vo.trip_plan_pay_3 }</div></div>
				<div class="foot">\&nbsp;&nbsp;${hap }</div>
		</div>
	</div>
</div>
<!-- 컨텐츠 영역 끝 -->

   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->