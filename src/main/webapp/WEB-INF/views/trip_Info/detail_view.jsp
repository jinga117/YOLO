<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<style type="text/css">
	.b-map {position:relative;overflow:hidden;width:100%;height:350px;}
	.radius_border{border:1px solid #43a4a2;border-radius:5px;margin-top:70px;}     
	.custom_typecontrol {position:absolute;top:100px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
	.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
	.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
	.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
	.custom_typecontrol .selected_btn:hover {color:#fff;}   
	.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.custom_zoomcontrol span {display:block;width:36px;height:40px;padding-top:12px;text-align:center;color:#43a4a2;cursor:pointer;}     
	.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
	.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;} 
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
            <div class="b-map__wrapper"><div id="map" style="width:100%;height:780px;"></div></div>
                <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			    <div class="custom_zoomcontrol radius_border"> 
			        <span onclick="zoomIn()"><i class="fa fa-plus" aria-hidden="true"></i></span>  
        			<span onclick="zoomOut()"><i class="fa fa-minus" aria-hidden="true"></i></span>
			    </div>
         	</div>
        <div class="b-map-menu"></div>
        <!-- .b-map-menu -->
        <c:forEach items="${detailList }" var="list">
        <div class="b-slide-menu opened">
            <div class="b-slide-menu__toggle"><i class="fa fa-caret-left" aria-hidden="true"></i><i class="fa fa-caret-right hidden" aria-hidden="true"></i></div>
            <div class="b-slide-menu__content custom-scroll default-skin">
                <h2 class="b-slide-menu__title">${list.trip_nickname}</h2>
                <div class="b-slide-menu__form container-fluid opened">       
                	<%-- <c:if test="${list.trip_video != null}" >
						<!-- 동영상 시작-->
						<div class="b-slide-menu-movie">
							<iframe width="560" height="315" src="${list.trip_video}" frameborder="0" allowfullscreen></iframe>
						</div>
						<!-- // 동영상 끝-->
					</c:if> --%>
					
					<!-- 이미지 시작-->
					<div class="b-slide-menu-movie">
						<img src="img/photo/${list.trip_id}.jpg" class="detail_img">
					</div>
					<!-- // 이미지 끝-->
					
					<h2 class="b-slide-menu__title">Weather</h2>
							
                    <div class="b-slide-menu__form__row__item">
	                    <!-- 날씨 API 시작 -->
						<ul class="weather_content">
							<li>
								<span class="weather_txt">월</span>
								<span class="weather_icon"><i class="fa fa-sun-o" aria-hidden="true"></i></span>
								<span class="weather_txt">13℃</span>
							</li>
							<li>
								<span class="weather_txt">화</span>
								<span class="weather_icon"><i class="fa fa-cloud" aria-hidden="true"></i></span>
								<span class="weather_txt">7℃</span>
							</li>
							<li>
								<span class="weather_txt">수</span>
								<span class="weather_icon"><i class="fa fa-tint" aria-hidden="true"></i></span>
								<span class="weather_txt">4℃</span>
							</li>
							<li>
								<span class="weather_txt">목</span>
								<span class="weather_icon"><i class="fa fa-cloud" aria-hidden="true"></i></span>
								<span class="weather_txt">4℃</span>
							</li>
							<li>
								<span class="weather_txt">금</span>
								<span class="weather_icon"><i class="fa fa-sun-o" aria-hidden="true"></i></span>
								<span class="weather_txt">7℃</span>
							</li>
							<li>
								<span class="weather_txt">토</span>
								<span class="weather_icon"><i class="fa fa-sun-o" aria-hidden="true"></i></span>
								<span class="weather_txt">11℃</span>
							</li>
							<li>
								<span class="weather_txt">일</span>
								<span class="weather_icon"><i class="fa fa-sun-o" aria-hidden="true"></i></span>
								<span class="weather_txt">13℃</span>
							</li>
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
                                <span class="detail_contents-icon"><i class="fa fa-phone" aria-hidden="true"></i></span>
                           	 <span class="detail_contents_txt">${list.trip_tel}</span>
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
                           	 <span class="detail_contents_txt">${list.trip_time}</span>
                            </div>
                            <div class="detail_contents">
                           	 <span class="detail_contents-icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                           	 <span class="detail_contents_txt"><a href="http://${list.trip_site}" target="_blank">${list.trip_site}</a></span>
                            </div>
							<input type="hidden"  id="pos_x" value=" ${list.pos_x}">
							<input type="hidden"  id="pos_y" value=" ${list.pos_y}"> 
							<input type="hidden"  id="trip_nickname" value=" ${list.trip_nickname}"> 
							<input type="hidden"  id="trip_like" value=" ${list.trip_like}">                       
                        </div>
                        
                        <!-- 리뷰 보기 -->
                        <div> 
							<c:forEach items="${reviewList }" var="list">
								<b>user_id : ${list.user_id }</b><br>
								<b>review_content : ${list.review_content }</b><br>
								<b>review_time : ${list.review_time }</b><hr>
							</c:forEach>
						</div>
						<!-- 리뷰 쓰기 -->
						<div> 					
							<form method="post">
								<c:if test="${user == null}">
									<script type="text/javascript">
										$('#content').mousedown(function () { 
											alert("로그인 하신 후 이용 가능합니다.");
											});
									</script>
								</c:if>
								<input type="hidden" name="review_no" value="review_no"><br>
								user_id : <input type="hidden"  name="user_id" value=" ${user}">${user}<br>
								<input type="hidden"  name="trip_id" value=" ${trip_id}">
								review_content : <input type="text"  id="content" name="review_content"  width="20px">
								<input type="submit" value="coment" >
							</form>
							
							</div>
					</div>
                    <!--  상세보기 컨텐츠 끝 -->
		  		</div>
			</div>
		</div>
		</c:forEach>
	  	<!-- 컨텐츠 영역 끝 -->
 
		<!-- 푸터영역 시작 -->
		<div class="footer">
			<jsp:include page="../inc/bottom.jsp" />
		</div>
		<!-- 푸터영역 끝 -->
	</div>	
</body>
</html>

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
	
	// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
	//map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC); 

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
   	
 	/* // 주소-좌표 변환 객체를 생성합니다
   	var geocoder = new daum.maps.services.Geocoder();

   	// 주소로 좌표를 검색합니다
   	geocoder.addr2coord('서울특별시 종로구 사직로 161', function(status, result) {

   	    // 정상적으로 검색이 완료됐으면 
   	     if (status === daum.maps.services.Status.OK) {

   	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

   	        // 결과값으로 받은 위치를 마커로 표시합니다
   	        var marker = new daum.maps.Marker({
   	            map: map,
   	            position: coords
   	        });

   	        // 인포윈도우로 장소에 대한 설명을 표시합니다
   	        var infowindow = new daum.maps.InfoWindow({
   	            content: '<div style="width:150px;text-align:center;padding:6px 0;">경복궁</div>'
   	        });
   	        infowindow.open(map, marker);

   	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   	        map.setCenter(coords);
   	    }
   	});  */   
</script>
<!-- //DAUM MAP -->