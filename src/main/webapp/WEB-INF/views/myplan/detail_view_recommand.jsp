<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body onload="setCenter()">
   <!--  헤더 영역 시작 -->
   <jsp:include page="../inc/top.jsp" />
   <!--  헤더 영역 끝 -->

   <!-- 컨텐츠 영역 시작 -->
 <div class="b-main-container" id="content">
   <div class="b-pop-places container">
    <h2 class="b-cont-title">
   		<c:forEach items="${recommList }" var="list" varStatus="sta">
    		 ${list.re_content }
   		</c:forEach>
     </h2>
   <div class="b-main-container places-page" id="content">
      <div style="margin: 5%;">
         <div>
         <h4>DAY 1</h4>
         <c:forEach items="${recommList }" var="list" varStatus="sta">
            <c:if test="${list.re_id =='d1' }">
               <img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}">
                   ${list.trip_nickname }
                   ${list.trip_address}<br><br>
                   ${list.trip_content }<br><br>
            </c:if>
         </c:forEach>
         </div>
         <hr>
         
         <div>
         <h4>DAY 2</h4>
         <c:forEach items="${recommList }" var="list" varStatus="sta">
            <c:if test="${list.re_id =='d2' }">
               <img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}">
                   ${list.trip_nickname }
                   ${list.trip_address}<br><br>
                   ${list.trip_content }<br><br>
            </c:if>
         </c:forEach>
         </div>
         <hr>
         
         <div>
         <h4>DAY 3</h4>
         <c:forEach items="${recommList }" var="list" varStatus="sta">
            <c:if test="${list.re_id =='d3' }">
               <img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}">
                   ${list.trip_nickname }
                   ${list.trip_address}<br><br>
                   ${list.trip_content }<br><br>
            </c:if>
         </c:forEach>
         </div>   

      </div>
   </div>  
    </div>
   </div>
   <!-- 컨텐츠 영역 끝 -->

   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->