<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->
<link rel="stylesheet" href="css/plan.css">
<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
<form action="planUpdatePro"  method="post">
	<div class="Info_calendar">
		<div class="trip_Info">
			<input type="hidden" name="plan_no"  value="${vo.plan_no }">
			<div class="cal_title" ><input type="text"  class="input_title" value=" ${vo.trip_title }" name="trip_title"></div>
			
			<div class="days" ><span class="day_day">Day1</span>
				<input type="text"  class="input_start" value="${vo.trip_start }" name="trip_start" placeholder="yyyy-MM-dd 형식으로 입력해주세요">
			</div>
			<div class="t_info">
				<div class="trip_name">${vo.trip_nickname_1 }</div>
				<div class="t_memo"><input type="text" class="input_memo" name="trip_plan_memo_1" value="${vo.trip_plan_memo_1}"></div>
				<div class="t_pay"><input type="text" class="input_memo" name="trip_plan_pay_1" value="${vo.trip_plan_pay_1}"></div>
			</div> 
			
			<div class="days" ><span class="day_day">Day2</span><span class="start_day">${tDay }</span></div>
			<div class="t_info">
				<div class="trip_name">${vo.trip_nickname_2 }</div>
				<div class="t_memo"><input type="text" class="input_memo" name="trip_plan_memo_2" value="${vo.trip_plan_memo_2}"></div>
				<div class="t_pay"><input type="text" class="input_memo" name="trip_plan_pay_2" value="${vo.trip_plan_pay_2}"></div>
			</div>
			
			<div class="days"><span class="day_day">Day3</span><span class="start_day">${eDay }</span></div>
			<div class="t_info">
				<div class="trip_name">${vo.trip_nickname_3 }</div>
				<div class="t_memo"><input type="text" class="input_memo" name="trip_plan_memo_3" value="${vo.trip_plan_memo_3}"></div>
				<div class="t_pay"><input type="text" class="input_memo" name="trip_plan_pay_3" value="${vo.trip_plan_pay_3}"></div>
			</div>
			<div class="sub_update"><button type="submit" value="수정">수 정</button></div>
		</div>
	</div>
	</form>
</div>
<!-- 컨텐츠 영역 끝 -->

   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->