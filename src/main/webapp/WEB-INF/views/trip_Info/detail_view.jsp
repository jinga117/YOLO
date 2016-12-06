 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.b-map {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 350px;
}

.radius_border {
	border: 1px solid #43a4a2;
	border-radius: 5px;
	margin-top: 70px;
}

.custom_typecontrol {
	position: absolute;
	top: 100px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	padding-top: 12px;
	text-align: center;
	color: #43a4a2;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}
</style>

<body onload="setCenter()">
	<!--  헤더 영역 시작 -->
	<jsp:include page="../inc/top.jsp" />
	<!--  헤더 영역 끝 -->

	<!-- 컨텐츠 영역 시작 -->
	<div class="b-main-container places-page" id="content">
		<div id="hellopreloader">
			<div id="hellopreloader_preload"></div>
		</div>
		<div class="b-map">
			<div class="b-map__wrapper">
				<div id="map" style="width: 100%; height: 780px;"></div>
			</div>
			
			<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			<div class="custom_zoomcontrol radius_border">
				<span onclick="zoomIn()"><i class="fa fa-plus" aria-hidden="true"></i></span>
				<span onclick="zoomOut()"><i class="fa fa-minus" aria-hidden="true"></i></span>
			</div>
		</div>
		<div class="b-map-menu"></div>
		
		<!-- 상세보기 컨텐츠 시작 -->
		<c:forEach items="${detailList }" var="list">
			<div class="b-slide-menu opened">
				<div class="b-slide-menu__toggle">
					<i class="fa fa-caret-left" aria-hidden="true"></i>
					<i class="fa fa-caret-right hidden" aria-hidden="true"></i>
				</div>
				<div class="b-slide-menu__content custom-scroll default-skin">
					<h2 class="b-slide-menu__title">${list.trip_nickname}</h2>
					
					<!--  북마크 추가 시작 -->
					<div class="add_icon_wrap">
						<span class="add_bookmark_icon p-t-15" data-toggle="tooltip" data-placement="left" title="북마크 추가">
							<a href="bookmark_log?trip_id=${list.trip_id }"><i class="fa fa-bookmark-o" aria-hidden="true"></i></a>
						</span>
						<span class="add_plan_icon p-t-15" data-toggle="tooltip" data-placement="left" title="일정추가" onClick="setTripId('${list.trip_id}', '${list.trip_nickname}')">
							<c:if test="${user_id == null }">
								<a href="#" onclick="javascript:alert('로그인 후 이용 가능합니다.');return false;" >
									<i class="fa fa-calendar" aria-hidden="true"></i>
								</a>
							</c:if>
							<c:if test="${user_id != null }">
								<a href="#" class="html_popup">
									<i class="fa fa-calendar" aria-hidden="true"></i>
								</a>
							</c:if>
						</span>
					</div>
					<!--  북마크 추가 끝 -->
					
					<div class="b-slide-menu__form container-fluid opened">
					
						<!-- 이미지 시작-->
						<div class="b-slide-menu-movie">
							<img src="img/photo/${list.trip_id}.jpg" class="detail_img">
						</div>
						<!-- // 이미지 끝-->

						<!-- 날씨 -->
						<h2 class="b-slide-menu__title">Weather</h2>
						<div class="b-slide-menu__form__row__item">
							<!-- 날씨 API 시작 -->
							<ul class="weather_content">
					 		   	<li><span class="weather_txt">${today }</span> <span class="weather_icon"><img src="img/wicon/${icon1 }.png"></span> <span class="weather_txt">${day1 }℃</span></li>
								<li><span class="weather_txt">${today2 }</span> <span class="weather_icon"><img src="img/wicon/${icon2 }.png"></span> <span class="weather_txt">${day2 }℃</span></li>
								<li><span class="weather_txt">${today3 }</span> <span class="weather_icon"><img src="img/wicon/${icon3 }.png"></span> <span class="weather_txt">${day3 }℃</span></li>
								<li><span class="weather_txt">${today4 }</span> <span class="weather_icon"><img src="img/wicon/${icon4 }.png"></span> <span class="weather_txt">${day4}℃</span></li>
								<li><span class="weather_txt">${today5 }</span> <span class="weather_icon"><img src="img/wicon/${icon5 }.png"></span> <span class="weather_txt">${day5}℃</span></li>
								<li><span class="weather_txt">${today6 }</span> <span class="weather_icon"><img src="img/wicon/${icon6 }.png"></span> <span class="weather_txt">${day6}℃</span></li>
								<li><span class="weather_txt">${today7 }</span> <span class="weather_icon"><img src="img/wicon/${icon7 }.png"></span> <span class="weather_txt">${day7 }℃</span></li>
							</ul>
							<!-- 날씨 API 끝 -->
						</div>
						
						<!--  상세보기 컨텐츠 시작 -->
						<div class="b-slide-menu__form__row row">
							<div class="col-md-12">
								<div class="detail_contents">
									<div class="detail_contents_txt m-b-20">${list.trip_content}</div>
								</div>
								<div class="detail_contents">
									<span class="detail_contents-icon"><i
										class="fa fa-phone" aria-hidden="true"></i></span> <span class="detail_contents_txt">${list.trip_tel}</span>
								</div>
								<div class="detail_contents">
									<span class="detail_contents-icon"><i class="fa fa-map-marker" aria-hidden="true"></i></span> 
									<span class="detail_contents_txt">${list.trip_address}</span>
								</div>
								<div class="detail_contents">
									<span class="detail_contents-icon"><i class="fa fa-subway" aria-hidden="true"></i></span> 
									<span class="detail_contents_txt">${list.trip_way}</span>
								</div>
								<div class="detail_contents">
									<span class="detail_contents-icon"><i class="fa fa-clock-o" aria-hidden="true"></i></span> 
									<span class="detail_contents_txt"> ${list.trip_time}</span>
								</div>
								<div class="detail_contents">
									<span class="detail_contents-icon"><i class="fa fa-home" aria-hidden="true"></i></span> 
									<span class="detail_contents_txt"><a href="http://${list.trip_site}" target="_blank">${list.trip_site}</a></span>
								</div>
								<input type="hidden" id="pos_x" value=" ${list.pos_x}">
								<input type="hidden" id="pos_y" value=" ${list.pos_y}">
								<input type="hidden" id="trip_nickname" value=" ${list.trip_nickname}">
								<input type="hidden" id="trip_like" value=" ${list.trip_like}">
								<input type="hidden" id="trip_id" value="${list.trip_id}">
							</div>
						</div>

						<!-- 리뷰 시작-->
						<div class="review_list_wrap">
							<h5 class="review_title">Review</h5>
							
							<!-- ajax 리뷰 쓰기 시작-->
							<div class="review_write_wrap">
								<form method="get">
									<input type="hidden" name="review_no" value="review_no"> 
									<ul>
										<li class="review_write_li_user">
											<span class="review_user_id"><img src="img/user_icon.png" class="user_icon"></span>
											<span class="review_list_user"><span id="user">${user}</span></span>
											<input type="hidden" name="user_id" value="${user}">
											<input type="hidden" name="trip_id" value=" ${trip_id}">
										</li>
										<li class="review_write_cotent_wrap"> 
											<input type="text" id="review_content" name="review_content"  onfocus="<c:if test="${user == null}">$('#comment_btn').focus();alert('로그인 하신 후 이용 가능합니다'); return false;</c:if>"
												<c:if test="${user == null}">readonly placeholder="로그인 하신 후 이용 가능합니다."</c:if> placeholder="한 줄 리뷰를 적어 주세요~!">
											<input type="button" value="comment" id="comment_btn" onClick="writeReview();">
										</li>
									</ul>
								</form>
							</div>
							<!-- ajax 리뷰 쓰기 끝-->
							
							<script type="text/javascript">
								// 리뷰 삭제 ajax
								function deleteReview(obj) {
									$.ajax({
										url : "deleteReview?review_no="+$(obj).attr('review_no'),
										type : "GET",
										datatype: "json",
										success : function(responseFromServer) {
											alert("댓글이 삭제 되었습니다.")
											$(obj).closest('div').remove();
										},
										error : function(jqXHR, textStatus, errorThrown) {
											alert("오류 발생 \n"+textStatus + " : " + errorThrown);
										}      
									});
								}
								
								// 리뷰 쓰기 ajax
								function writeReview(obj) {
									var user_id =$("#user").text();
									var trip_id = $("#trip_id").val();
									var review_content =$("#review_content").val();
									if (user_id=='') {
										alert('로그인 후 이용해 주세요');
										return;
									}
									else if (user_id !==''){
										if ($('#review_content').val()==''){
								   			alert('리뷰를 입력하세요.');
								   			$('#review_content').focus();
								   			return false;
										}
									} 
									
									$.ajax({
										url : "writeReview?trip_id="+trip_id+'&user_id='+user_id+'&review_content='+review_content,
										/* url : "writeReview", */
										type : "GET",
										contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
										datatype: "json",
										//data: {trip_id:trip_id, user_id: user_id, review_content: review_content}
										success : function(responseFromServer) {
											alert("댓글이 등록되었습니다.");
											$("#review_content").val('');
											var data = jQuery.parseJSON(responseFromServer);
											var obj2 =$(this).closest('#review_list');
											var html = "<div class='review_list' id='review_list'>";
											html+=	"<ul>";
											html+=   "	<li>";
											html+=   "      <span class='review_list_user'>" + data.user_id+ "</span>";
											html+=   "		| <span class='review_list_time'><i class='fa fa-clock-o' aria-hidden='true'></i>  "+data.review_time+"</span>";
											html+= 	"	<input type='button' value='X' onclick='deleteReview( this ) ' review_no='" + data.review_no + "'></li>";
											html+= 	"	<li><span class='review_list_content'>"+ data.review_content + "</span></li>";
											html+=	"</ul>";
											html+="</div>";
											if ($('#commentArea').find('#review_list').length==0) { // 댓글이 없는 경우
												var hei = $('#commentArea').prop('scrollHeight');
												$('#commentArea').append(html);
												$("#hilo").animate({ scrollTop: hei}, 500);
												/* $("#commentArea").css("height","auto"); */
											}  else { // 댓글이 있는 경우
												$('#commentArea').find('#review_list').eq(0).before(html);
											}
										},
										error : function(jqXHR, textStatus, errorThrown) {
											alert("오류 발생 \n"+textStatus + " : " + errorThrown);
										}      
									});
								} 
							</script>
							<!-- 리뷰 쓰기 끝 -->
							
							<div id="commentArea">
								<c:forEach items="${reviewList }" var="list">
									<div class="review_list" id="review_list">
										<ul>
											<li>
												<span class="review_list_user">${list.user_id }</span> | <span class="review_list_time"><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${list.review_time }"  pattern="yyyy-MM-dd E요일 hh:mm" /></span>
												<c:if test="${fn:trim(list.user_id) == fn:trim(user)}">
	                                    			<input type='button' value='X' onclick="deleteReview( this )" review_no= "${ list.review_no }">
	                                 			</c:if>
	                                 			<c:if test="${isadmin == 1}">
	                                    			<input type='button' value='X' onclick="deleteReview( this )" review_no= "${ list.review_no }">
												</c:if>
											</li>
											<li><span class="review_list_content">${list.review_content }</span></li>
										</ul>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!--  상세보기 컨텐츠 끝 -->
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 컨텐츠 영역 끝 -->

	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->

<!-- DAUM MAP -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1d5e5ad2e3cb3461622dec6c0af6825"></script>
<script type="text/javascript"> 
	var pos_x = $("#pos_x").val();
	var pos_y = $("#pos_y").val();
	var trip_nickname = $("#trip_nickname").val();
	var trip_like = $("#trip_like").val();
	
	var pos_x_center = parseFloat($("#pos_x").val()) - 0.000250;
	var pos_y_center = parseFloat($("#pos_y").val()) - 0.002500;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div

    mapOption = { 
        center: new daum.maps.LatLng(pos_x, pos_y), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	function setCenter() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng(pos_x_center, pos_y_center);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	var imageSrc = 'img/map/map_marker_icon.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(50, 63), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(25, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new daum.maps.LatLng(pos_x, pos_y); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	 
	// 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
       content: '<div style="width:150px;text-align:center;padding:10px;background:#43a4a2;color:#fff;box-shadow:2px 2px 6px rgba(0,0,0,.2);"><b>'+trip_nickname+'</b> <br /><i class="fa fa-heart-o" aria-hidden="true"></i>'+ trip_like+'</div>'     
    });
    
	infowindow.open(map, marker);
  
 	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
   	function zoomIn() {
   	    map.setLevel(map.getLevel() - 1);
   	}

   	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
   	function zoomOut() {
   	    map.setLevel(map.getLevel() + 1);
   	}
   	
</script>