<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  헤더 영역 시작 -->
<jsp:include page="../inc/top.jsp" />
<!--  헤더 영역 끝 -->

<!-- 좋아요 시작-->
	<script type="text/javascript">
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

<!-- 더보기 시작 -->
	<script>
		$(document).ready(function () {
		    size_li = $('#viewList_list li').size();
		    x=8;
		    $('#viewList_list li:lt('+x+')').slideDown();
		    
		    $("#loadMore").click(function() {
		        x= (x+4 <= size_li) ? x+4 : size_li;
		        $('#viewList_list li:lt('+x+')').slideDown();
		    });
		    
		    $("#showLess").click(function() {
		        x=(x-4<0) ? 4 : x-4;
		        $('#viewList_list li').not(':lt('+x+')').slideUp();
		    });
		});
	</script>
<!-- 더보기 끝 -->

<!-- 컨텐츠 영역 시작 -->
<div class="b-main-container" id="content">
	<div class="b-pop-places container">
		<h2 class="b-cont-title">travel</h2>
		<div id="hidediv">
			<div class="b-slider owl-carousel owl-carousel-1">
				<!--  리스트 시작 -->
				<c:forEach items="${cateTop }" var="list">
					<div class="b-pop-places__item">
						<div class="b-pop-place">
							<div class="b-pop-place__img">
								<a href="detail_view?trip_id=${list.trip_id}"> <img width="370" height="245" class="b-pop-place__img__img" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></a>
								<button onClick="likeIt(this)" value="${list.trip_id}" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="좋아요">
									<i class="fa fa-heart" aria-hidden="true"></i>
								</button>
							</div>

							<div class="b-pop-place__desc clearfix">
								<div class="b-pop-place__rating">
									<span class="b-pop-place__like"><i class="fa fa-heart" aria-hidden="true"></i></span> <span id="likeCount">${list.trip_like}</span>
								</div>
								<a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name">${list.trip_nickname}</a>
								<h5 class="b-pop-place__cat">${list.trip_add1} ${list.trip_add2}</h5>

								<div class="b-pop-place-comment">
									<a href="http://${list.trip_site}" target="_blank" class="b-pop-place-homepage" data-toggle="tooltip" data-placement="top" title="홈페이지 바로가기"><i class="fa fa-home" aria-hidden="true"></i></a> 
									<span class="b-pop-place__view"><img src="img/heart_icon.png" class="list_icon"></span><span id="likeCount">${list.trip_like}</span>
									<span class="b-pop-place__view"><img src="img/view_icon.png" class="list_icon"></span> ${list.trip_view}
									<span class="b-pop-place__view"><img src="img/review_icon.png" class="list_icon"></span> ${list.trip_view}
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--  리스트 끝-->
			</div>
			<!-- *********************************************************전체보기 시작************************************************************************ -->
			<div class="row m--centered">
				<div class="col-md-4 col-md-offset-4">
					<a class="btn" id="view">View all places</a>
				</div>
			</div>
		</div>
		<div id="viewList">
			<ul class="viewList_list" id="viewList_list">
				<!--  View all List 시작 -->
				<c:forEach items="${cateList }" var="list">
					<li>
						<div class="viewList_item">
							<div class="b-pop-place">
								<div class="b-pop-place__img">
									<a href="detail_view?trip_id=${list.trip_id}"> <img width="370" height="245" class="b-pop-place__img__img" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}"></a>
									<button onClick="likeIt(this)" value="${list.trip_id}" class="b-icon-like" data-toggle="tooltip" data-placement="left" title="좋아요">
										<i class="fa fa-heart" aria-hidden="true"></i>
									</button>
								</div>

								<div class="b-pop-place__desc clearfix">
									<a href="detail_view?trip_id=${list.trip_id}" class="b-pop-place__name">
										<span class="b-pop-place__name_txt">${list.trip_nickname}</span>
									</a>
									<h5 class="b-pop-place__cat">${list.trip_add1} ${list.trip_add2}</h5>

									<div class="b-pop-place-comment m--centered">
										<span class="b-pop-place__view"><img src="img/heart_icon.png" class="list_icon"></span><span id="likeCount">${list.trip_like}</span> 
										<span class="b-pop-place__view"><img src="img/view_icon.png" class="list_icon"> ${list.trip_view}</span>
										<span class="b-pop-place__view"><img src="img/review_icon.png" class="list_icon"> ${list.trip_view}</span>
									</div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!--  View all List 끝-->
			
			<!--  Load More 시작 -->
			<div class="row m--centered">
				<div class="col-md-4 col-md-offset-4">
					<a class="btn" id="loadMore">Load more</a>&nbsp; <a class="btn"
						id="showLess">Show less</a>
				</div>
			</div>
			<!--  Load More 끝 -->
		</div>
	</div>
<!-- *********************************************************전체보기 끝************************************************************************ -->
<!-- //View List Container 끝-->
<!-- //main-container -->
</div>
<!-- 컨텐츠 영역 끝 -->

<!-- 푸터영역 시작 -->
<div class="footer">
	<jsp:include page="../inc/bottom.jsp" />
</div>
<!-- 푸터영역 끝 -->