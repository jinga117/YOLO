<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>북마크 성공</title>
</head>
<body>
<%-- 
        <c:forEach items="${bookmarklist }" var="list">
        ${list.trip_id}<p>
        ${list.category_id}<p>
        ${list.age_id}<p>
        ${list.food_id}<p>
        ${list.season_id}<p>
        ${ list.person_id}<p>
        ${ list.kpop_id}<p>
        ${ list.trip_nickname}<p>
        ${ list.trip_address}<p>
        ${ list.trip_image}<p>
        ${ list.trip_content}<p>
        ${ list.trip_time}<p>
        ${ list.trip_site}<p>
        ${ list.trip_tel}<p>
        ${ list.trip_way}<p>
        ${ list.trip_pay}<p>
        ${ list.trip_add1}<p>
        ${ list.trip_add2}<p>
        ${ list.trip_add3}<p>
        ${ list.trip_like}<p>
        ${ list.trip_view}<p>
        ${ list.trip_video}<p>
        ${ list.pos_x}<p>
        ${ list.pos_y}<p>
       </c:forEach> --%>
       
	<c:forEach items="${bookmarklist }" var="list">
		<li>
			<div class="viewList_item">
				<div class="b-pop-place">
					<div class="b-pop-place__img">
						<a href="detail_view?trip_id=${list.trip_id}">
							<img width="370" height="245" class="b-pop-place__img__img"  src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></a>
                         <a href="#" class="b-icon-medal"></a>
                         <a href="#" onClick="likeIt(this)" value="${list.trip_id}" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="좋아요"><i class="fa fa-heart" aria-hidden="true"></i></a>
					</div>
                      
					<div class="b-pop-place__desc clearfix">
                         <div class="b-pop-place__rating">
                         	<span class="b-pop-place__like"><i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span id="likeCount">${list.trip_like}</span>
                         </div>
                         <a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name">${list.trip_nickname}</a>
                         <h5 class="b-pop-place__cat">${list.trip_address}</h5>
                          <a href ="bookmark_delete?trip_id=${list.trip_id }">X</a>
                  	<div class="b-pop-place-comment">
						<a href="http://${list.trip_site}" target="_blank"  class="b-pop-place-homepage">
							<i class="fa fa-home" aria-hidden="true"></i></a>
                    	<a href="http://${list.trip_site}" target="_blank" >${list.trip_site}</a>
					</div>
                         
					<div class="b-pop-place-comment">
						<a href="#"  class="b-pop-place-homepage"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
                            ${list.trip_time}
                    </div>
				</div>
			</div>
		</div>
		</li>
	</c:forEach>

</body>
</html>