<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->
   <!-- 좋아요 시작-->
   <script>
      function likeIt(obj) {
         var trip_id =$(obj).attr("value");
         $.ajax({
               url : "like?trip_id="+trip_id,
               type : "GET",
               datatype: "json",
               success : function(responseFromServer) {
                  var data = jQuery.parseJSON(responseFromServer);
                  var obj2 =$(obj).parent().parent().find('#likeCount');
                  $(obj2).text(data.likeCount);
               },
               error : function(jqXHR, textStatus, errorThrown) {
                  alert("오류 발생 \n"+textStatus + " : " + errorThrown);
               }      
            });
      }      
   </script>
   <!-- 좋아요 끝-->	
	<!-- 컨텐츠 영역 시작 -->
    <div class="b-main-container" id="content">
         <div class="b-pop-places container">
            <h2 class="b-cont-title">Restaurant</h2>
              <ul class="b-cont-sub-menu">
            	<li><a href="list_restaurant_search?food_id=f01">Restaurant</a></li>
            	<li><a href="list_restaurant_search?food_id=f02">Bakery & Cafe</a></li>
            </ul>
            
            <div class="b-slider owl-carousel owl-carousel-1">            
            <!--  리스트 시작 -->
            <c:forEach items="${foodList }" var="list">
                 <div class="b-pop-places__item">
                    <div class="b-pop-place">
                        <div class="b-pop-place__img">
                            <a href="detail_view?trip_id=${list.trip_id}"><img width="370" height="245" class="b-pop-place__img__img"  src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></a>
                     <a href="#" class="b-icon-medal"></a>
                     <a href="#" onClick="likeIt(this)" value="${list.trip_id}" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="좋아요"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        </div>
                        <div class="b-pop-place__desc clearfix">
                            <div class="b-pop-place__rating"><span class="b-pop-place__like"><i class="fa fa-heart" aria-hidden="true"></i> <span id="likeCount">${list.trip_like}</span></div> <a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name">${list.trip_nickname}</a>
                            <h5 class="b-pop-place__cat">${list.trip_address}</h5>
                     <div class="b-pop-place-comment">
                        <a href="http://${list.trip_site}" target="_blank"  class="b-pop-place-homepage"><i class="fa fa-home" aria-hidden="true"></i></a>
                        <a href="http://${list.trip_site}" target="_blank" >${list.trip_site}</a>
                     </div>
                     <div class="b-pop-place-comment">
                        <a href="#"  class="b-pop-place-homepage"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
                        ${list.trip_time}
                     </div>
                     </a>
                  </div>
                    </div>
                </div>
                </c:forEach>
                <!--  리스트 끝-->
            </div>
            <!-- .b-slider -->
            <div class="row m--centered">
                <div class="col-md-4 col-md-offset-4"><a href="#" class="btn">View all places</a>
                </div>
            </div>
        </div>
    <!-- //main-container -->
    <!-- 컨텐츠 영역 끝 -->
    
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->

</html>