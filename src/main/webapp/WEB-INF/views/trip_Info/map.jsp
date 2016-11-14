<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1d5e5ad2e3cb3461622dec6c0af6825"></script>

<!-- 
clusterer: ��Ŀ�� Ŭ�����͸� �� �� �ִ� Ŭ�����ͷ� ���̺귯�� �Դϴ�.
services: ��� �˻� �� �ּ�-��ǥ ��ȯ �� �� �� �ִ� services ���̺귯�� �Դϴ�.
drawing: ���� ���� ��Ŀ�� �׷��Ƚ� ��ü�� ���� �׸� �� �ְ� �׸��� ��带 �����ϴ� drawing ���̺귯�� �Դϴ�.
 -->

<!-- services�� clusterer, drawing ���̺귯�� �ҷ����� -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=APIKEY&libraries=services,clusterer,drawing"></script>

<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:400px;height:350px;"></div>
	<p id="clickLatlng"></p>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
	
	// ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
	var marker = new daum.maps.Marker({ 
	    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
	    position: map.getCenter() 
	}); 
	// ������ ��Ŀ�� ǥ���մϴ�
	marker.setMap(map);
	
	// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
	// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
	    var latlng = mouseEvent.latLng; 
	    
	    // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
	    marker.setPosition(latlng);
	    
	    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
	    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
    
});
</script>
	
	
<!-- 	<p><em>������ ������ �ּ���!</em></p> 
	<p id="result"></p>

<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div //������ ���� ������ DOM ���۷���
	    mapOption = { //������ ������ �� �ʿ��� �⺻ �ɼ�
	        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����(Ȯ��, ��� ����)
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�  //���� ���� �� ��ü ����


	// ���콺 �巡�׷� ���� �̵��� �Ϸ�Ǿ��� �� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
	daum.maps.event.addListener(map, 'dragend', function() {        

	    // ���� �߽���ǥ�� ���ɴϴ� 
	    var latlng = map.getCenter(); 
    
	    //web�� ���� �޼���
	    var message = '����� ���� �߽���ǥ�� ' + latlng.getLat() + ' �̰�, ';
	    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
	    
	    var resultDiv = document.getElementById('result');  
	    resultDiv.innerHTML = message;
	    
	});
</script> -->
		
<!-- 
	Map ��ü�� �� ��° �Ķ���ͷ� �ִ� options �� �Ӽ� ��, center �� ������ �����ϴµ� �ݵ�� �ʿ��մϴ�.
	
	center �� �Ҵ��� ���� LatLng Ŭ������ ����Ͽ� �����մϴ�. 
	���� ���浵 ��ǥ��� �θ��� WGS84 ��ǥ���� ��ǥ���� �־ ����µ���, 
	�������ڴ� ����(latitude), �浵(longitude) ������ �־��ּ���.
	 -->
	 
	 
	 
</body>
</html>