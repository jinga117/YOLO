<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
   <div class="calendar">
	<table class="weekdays">
		<tr class="choose">
			<th class="choose_year">
		    	<a href="yoloplan?year=${year-1}&month=${month}"> « Prev Year </a>
			</th>
			<th class="choose_month">
				<a href="yoloplan?year=${year}&month=${month-1}">« Prev Month</a>
			</th>
			<th colspan="3" class="current_year">
				 <span class="calendar_icon"><i class="fa fa-calendar" aria-hidden="true"></i></span> <span class="year_txt">${year}년</span>
				<span class="month_txt"> ${month+1}월 </span>
			</th>
			<th class="choose_month">
				<a href="yoloplan?year=${year}&month=${month+1}"> Next Month »</a>
			</th>
			<th  class="choose_year">
				<a href="yoloplan?year=${year+1}&month=${month}"> Next Year »</a>
			</th>
		</tr>            
         <!-- 달력 부분 -->
         <tr class="weekday">
            <th><span class="sunday">일</span></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th><span class="saturday">토</span></th>
         </tr>
          <c:set var="br" value="0" />

         <c:if test="${startDay <=7 }">
            <c:forEach var="i" begin="1" end="${startDay-1}">
               <td class="day" >&nbsp;</td>
               <c:set var="br" value="${br+1}" />
            </c:forEach>
         </c:if>
	         <c:forEach var="a" begin="1" end="${end}">
	            <c:if test="${(br%7) == 0}">
	               <tr class="week" >
	            </c:if>
	               <td class="day" >
	               <c:if test="${br==6 || br==13 || br==20 || br==27 || br==34}">
	                  <b><font color="#004d66" >${a}</font></b>
	               </c:if> 
	               <c:if test="${br==0 || br==7 || br==14 || br==21 || br==28 || br==35}">
	                  <b><font style="color: #cc3300">${a}</font></b>
	               </c:if> 
	               <c:if test="${br!=0 && br!=7 && br!=14 && br!=21 && br!=28 && br!=35 && br!=6 && br!=13 && br!=20 && br!=27 && br!=34}">
	                  <b><font style="color: black">${a}</font></b>
	               </c:if>
	                  <c:set var="br" value="${br+1}" />
	               </td>
	               
	         </c:forEach>
	         <c:set var="brend" value="${br}" />
            <c:forEach var="i" begin="0" end="7">
               <c:if test="${(brend%7) != 0 }">
                  <c:set var="brend" value="${brend+1}" />
               </c:if>
            </c:forEach>
            <c:forEach var="i" begin="${br}" end="${brend-1}">
               <td class="day" >&nbsp;</td>
            </c:forEach>
	         
      </table>
      </div>
   </div>
   <!-- 컨텐츠 영역 끝 -->

   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->