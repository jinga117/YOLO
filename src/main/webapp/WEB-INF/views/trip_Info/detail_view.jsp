<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
         </div>
        <div class="b-map-menu"></div>
        <!-- .b-map-menu -->
        <c:forEach items="${detailList }" var="list">
        <div class="b-slide-menu opened">
            <div class="b-slide-menu__toggle"><i class="fa fa-caret-left" aria-hidden="true"></i><i class="fa fa-caret-right hidden" aria-hidden="true"></i>
            </div>
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
                        </div>
					</div>
                    <!--  상세보기 컨텐츠 끝 -->
               </c:forEach>
	     </div>
    </div>
  	<!-- 컨텐츠 영역 끝 -->
   
	<!-- 푸터영역 시작 -->
	<div class="footer">
		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<!-- 푸터영역 끝 -->
	</body>
</html>

<!-- DAUM MAP -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1d5e5ad2e3cb3461622dec6c0af6825"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.579855, 126.977052), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	function setCenter() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng(37.579549, 126.972696);
	    
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
	    markerPosition = new daum.maps.LatLng(37.579855, 126.977052); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	 // 주소-좌표 변환 객체를 생성합니다
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
   	});
</script>
<!-- //DAUM MAP -->