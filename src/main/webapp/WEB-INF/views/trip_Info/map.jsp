<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1d5e5ad2e3cb3461622dec6c0af6825"></script>

<!-- 
clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리 입니다.
services: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.
drawing: 지도 위에 마커와 그래픽스 객체를 쉽게 그릴 수 있게 그리기 모드를 지원하는 drawing 라이브러리 입니다.
 -->

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=APIKEY&libraries=services,clusterer,drawing"></script>

<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:400px;height:350px;"></div>
	<p id="clickLatlng"></p>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
    
});
</script>
	
	
<!-- 	<p><em>지도를 움직여 주세요!</em></p> 
	<p id="result"></p>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div //지도를 담을 영역의 DOM 레퍼런스
	    mapOption = { //지도를 생성할 때 필요한 기본 옵션
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨(확대, 축소 정도)
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다  //지도 생성 및 객체 리턴


	// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'dragend', function() {        

	    // 지도 중심좌표를 얻어옵니다 
	    var latlng = map.getCenter(); 
    
	    //web에 띄우는 메세지
	    var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('result');  
	    resultDiv.innerHTML = message;
	    
	});
</script> -->
		
<!-- 
	Map 객체의 두 번째 파라메터로 넣는 options 의 속성 중, center 는 지도를 생성하는데 반드시 필요합니다.
	
	center 에 할당할 값은 LatLng 클래스를 사용하여 생성합니다. 
	흔히 위경도 좌표라고 부르는 WGS84 좌표계의 좌표값을 넣어서 만드는데요, 
	생성인자는 위도(latitude), 경도(longitude) 순으로 넣어주세요.
	 -->
	 
	 
	 
</body>
</html>