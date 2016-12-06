<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/recom.css">
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
      <div style="margin: 3%;">
         <div class="day_info">
	         <div class="today1">DAY 1</div>
		         <div class="recom_title">
		         	<c:forEach items="${recommList }" var="list" end="0" varStatus="sta">
			            <c:if test="${list.re_id =='d1' }" >${list.trip_add1 }</c:if>
			        </c:forEach>
			     </div>
		         <c:forEach items="${recommList }" var="list" varStatus="sta">
			            <c:if test="${list.re_id =='d1' }">
			                  <div class="recom_info">
			               			<div class="recom_img" ><img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></div>
			                  		<div class="recom_name">${list.trip_nickname }</div>
			               		    <div class="recom_add">${list.trip_address}</div><br><br>
			               		    <div class="recom_content"> ${list.trip_content }</div>
			                    </div>
			            </c:if>
		         </c:forEach>
<!--DAY 1 end -->
         	<br>
         	<div class="today1">DAY 2</div>
		         <div class="recom_title">
		         	<c:forEach items="${recommList }" var="list" end="0" varStatus="sta">
			            <c:if test="${list.re_id =='d2' }" >${list.trip_add1 }</c:if>
			        </c:forEach>
			     </div>
		         <c:forEach items="${recommList }" var="list" varStatus="sta">
			            <c:if test="${list.re_id =='d2' }">
			                  <div class="recom_info">
			               			<div class="recom_img" ><img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></div>
			                  		<div class="recom_name">${list.trip_nickname }</div>
			               		    <div class="recom_add">${list.trip_address}</div><br><br>
			               		    <div class="recom_content"> ${list.trip_content }</div>
			                    </div>
			            </c:if>
		         </c:forEach>
         	</div>
         	<!--DAY2 end -->
			<br>
         	<div class="today1">DAY 3</div>
		         <div class="recom_title">
		         	<c:forEach items="${recommList }" var="list" end="0" varStatus="sta">
			            <c:if test="${list.re_id =='d3' }" >${list.trip_add1 }</c:if>
			        </c:forEach>
			     </div>
		         <c:forEach items="${recommList }" var="list" varStatus="sta">
			            <c:if test="${list.re_id =='d3' }">
			                  <div class="recom_info">
			               			<div class="recom_img" ><img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></div>
			                  		<div class="recom_name">${list.trip_nickname }</div>
			               		    <div class="recom_add">${list.trip_address}</div><br><br>
			               		    <div class="recom_content"> ${list.trip_content }</div>
			                    </div>
			            </c:if>
		         </c:forEach>
			</div>
			<!--DAY3 end -->
      </div>
   </div>
 </div>  
      </body>
 
   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->