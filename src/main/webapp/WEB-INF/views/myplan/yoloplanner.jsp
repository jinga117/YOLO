<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<style>
#titleForm{
	background-color: #ffc314; 
	border-radius: 5px;
	line-height: 150%;
	text-align: center;
	font-weight: 600;
}
#titleForm:hover{
	background-color: #ffa500; 
}
#titleForm a{
	color: white;
}
.day{
	height: 100px;
}

</style>
<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
   <div class="calendar">
	<table class="weekdays">
		<tr class="choose">
			<th class="choose_year">
		    	<a href="yoloplanner?year=${year-1}&month=${month}"> « Prev Year </a>
			</th>
			<th class="choose_month">
				<a href="yoloplanner?year=${year}&month=${month-1}">« Prev Month</a>
			</th>
			<th colspan="3" class="current_year"><a href="yoloplanner?year=${currentYear}&month=${currentMonth}">
				 <span class="calendar_icon"><i class="fa fa-calendar" aria-hidden="true"></i></span> <span class="year_txt">${year}년</span>
				<span class="month_txt"> ${month}월 </span></a>
			</th>
			<th class="choose_month">
				<a href="yoloplanner?year=${year}&month=${month+1}"> Next Month »</a>
			</th>
			<th  class="choose_year">
				<a href="yoloplanner?year=${year+1}&month=${month}"> Next Year »</a>
			</th>
		</tr>            
         <!-- 달력 부분 -->
	     <tr class="weekday">
	        <th><span class="sunday">일</span></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th><span class="saturday">토</span></th>
	     </tr>
       <tbody>
         <tr>
         	<!-- 시작 공백부분 -->
      	   <c:set var="i" value="0"></c:set>
			<c:forEach begin="1" end="${startDay-1}" var="temp">
				<td class="day">&nbsp;</td>
				<c:set var="i" value="${temp}"></c:set>
			</c:forEach>
			<!-- 일자찍기 -->
			<c:forEach begin="1" end="${end}" var="temp2" varStatus="idx">
				<td class="day">
					<c:if test="${i%6 != 0 && i%7 != 0 }">
						<b>${temp2}</b>
						<c:if test="${temp2 == day}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }" >${tripInfo }</a></p></c:if>
						<c:if test="${temp2 == tDay}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo2 }</a></p></c:if>
						<c:if test="${temp2 == eDay}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo3 }</a></p></c:if>
					</c:if>
	               <c:if test="${i%6==0 && i%7 != 0}">
	                  <b><font class="saturday">${temp2}  </font></b><br>
						<c:if test="${temp2 == day}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo }</a></p></c:if>
						<c:if test="${temp2 == tDay}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo2 }</a></p></c:if>
						<c:if test="${temp2 == eDay}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo3 }</a></p></c:if>
	               </c:if>
	                <c:if test="${i%6==0 && i%7==0}">
	                  <b><font class="sunday">${temp2}</font></b><br>
						<c:if test="${temp2 == day}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo }</a></p></c:if>
						<c:if test="${temp2 == tDay}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo2 }</a></p></c:if>
						<c:if test="${temp2 == eDay}"><p id="titleForm"><a href="myplanDeteil?plan_no=${plan_no }">${tripInfo3 }</a></p></c:if>
	               </c:if>  
				</td>
				<c:set var="i" value="${i+1}"/>
				
				<c:choose>
					<c:when test="${i==7}">
						<c:if test="${temp2<= end}">
						<tr>
						</c:if>
						<c:set var="i" value="0"></c:set>
					</c:when>
				</c:choose>
			</c:forEach>  
			<!-- 마지막공백부분 -->
			<c:forEach begin="0" end="7">
				<c:if test="${(i%7) != 0 }">
				 	<c:set var="i" value="${i+1}" />
				 	<td class="day" >&nbsp;</td>
				 </c:if>
			</c:forEach>
		</tr>
		</tbody>
      </table>
   </div>
   </div>
   <!-- 컨텐츠 영역 끝 -->

   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->