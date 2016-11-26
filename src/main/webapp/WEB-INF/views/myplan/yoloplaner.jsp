<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<style>

.calendar{
   margin: o auto;
}

.weekdays {
   margin-left: 34%;
   height: 200px;
   width: 30%;
   border: 1px solid;
}
.choose{
   margin-left: 40%;
}
.choose_year{
   float: left;
   margin-right: 20px;
}
.week th{
   text-align: center;
   border: 1px solid;
}
.day {
   border: 1px solid;
   height: 40px;
   vertical-align: top;
}

</style>

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
   <div class="calendar">
      <div class="choose">
         <div class="choose_year">
            <a href="yoloplan?year=${year-1}&month=${month}"><b>◀</b></a><font color="#004d66" size="5"><b>${year}년</b></font><a href="yoloplan?year=${year+1}&month=${month}"><b>▶</b></a>
         </div>
         <div class="choose_month">
            <a href="yoloplan?year=${year}&month=${month-1}"><b>◀</b></a><font color="#004d66" size="5"><b>${month+1}월</b></font><a href="yoloplan?year=${year}&month=${month+1}"><b>▶</b></a>
         </div>
      </div>
      <table class="weekdays" ">
         <!-- 달력 부분 -->
         <tr class="week">
            <th><font style="color: #cc3300">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th><font color="#004d66" >토</th>
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