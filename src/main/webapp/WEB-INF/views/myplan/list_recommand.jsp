<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
   <div class="b-pop-places container">
      <h2 class="b-cont-title">YOLO의 추천 코스</h2>
      
            <!--  리스트 시작 -->
            <c:set var="cnt" value="1"></c:set>
            <c:forEach items="${recommList }" var="list" varStatus="sta">         
            <div>
               <a href="detail_view_recommand?trip_id=${list.trip_id}&re_onum=re${sta.count}">
                       <img width="300px" height="260px" src="img/photo/${list.trip_id}.jpg"></a>
                    <font size="4"><br>${list.trip_nickname}<br>${list.trip_add1} ${list.trip_add2}</font>
            </div>
            <hr>
            </c:forEach>
            <!--  리스트 끝-->
            
   </div>
</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
   <jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝-->