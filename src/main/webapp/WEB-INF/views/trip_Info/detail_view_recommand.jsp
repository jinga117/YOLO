<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
      <div style="margin-left: 100px">
               
               <div>
               <h4>DAY 1</h4>
               <c:forEach items="${recommList }" var="list" varStatus="sta">
                  <c:if test="${list.re_id =='d1' }">
                     <img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}">
                         ${list.trip_nickname }
                         ${list.trip_address}<br>
                        ${list.trip_content } <br>
                  </c:if>
               </c:forEach>
               </div>
               
               <div>
               <h4>DAY 2</h4>
               <c:forEach items="${recommList }" var="list" varStatus="sta">
                  <c:if test="${list.re_id =='d2' }">
                     <img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}">
                         ${list.trip_nickname }
                         ${list.trip_address}<br>
                        ${list.trip_content } <br>
                  </c:if>
               </c:forEach>
               </div>
               <div>
               <h4>DAY 3</h4>
               <c:forEach items="${recommList }" var="list" varStatus="sta">
                  <c:if test="${list.re_id =='d3' }">
                     <img width="70" height="70" src="img/photo/${list.trip_id}.jpg" alt="${list.trip_nickname}">
                         ${list.trip_nickname }
                         ${list.trip_address}<br>
                        ${list.trip_content } <br>
                  </c:if>
               </c:forEach>
               </div>   

      </div>
   </div>
   <!-- 컨텐츠 영역 끝 -->

   <!-- 푸터영역 시작 -->
   <div class="footer">
      <jsp:include page="../inc/bottom.jsp" />
   </div>
   <!-- 푸터영역 끝 -->

   <!-- DAUM MAP -->
   <!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1d5e5ad2e3cb3461622dec6c0af6825"></script>
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
      } -->

   <!-- //DAUM MAP -->
   <!-- </script> -->

   <!-- 날씨 api 넣어주세요ㅠㅠㅠㅠㅠㅠㅠㅠㅠ -->
   <!-- <script type="text/javascript" src='http://api.openweathermap.org/data/2.5/weather?q=Seoul&mode=json&units=metric&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451'></script>
<script type="text/javascript">

var http = require('http');
var express = require('express');
var app = express();
var server = http.createServer(app);
app.use(express.static(__dirname + "/index"));

app.get('/', function(req, res, err) {

   res.send(200, "Success");

});

//(Temp variable), for Weather Information
var cityname, citylon, citylat, cityweather, weatherid, weathermain, citytemp, cityhumi, citytemp_min, citytemp_max, citywind, cityclouds;
//var weatherArr = new Array();            아래에서 변수에 저장하는 대신 배열을 이용하셔도 됩니다.

//(Temp variable2), for Today weather Information

var citytime9, citytemp9, cityhumi9, citymain9, cityid9;
var citytime12, citytemp12, cityhumi12, citymain12, cityid12;
var citytime15, citytemp15, cityhumi15, citymain15, cityid15;
var citytime18, citytemp18, cityhumi18, citymain18, cityid18;
var citytime21, citytemp21, cityhumi21, citymain21, cityid21;

 //현재시간에 맞는 서울의 날씨정보를 얻어오는 function입니다.

function currentInfo() {   
   var urlCurr = 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&mode=json&units=metric&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451';
   http.get(urlCurr, function(res) {
      var body = '';
      res.on('data', function(chunk) {
         body += chunk.toString();
      });

      res.on('end', function() {
         try {
            var fbResponse = JSON.parse(body);    
            
            //JSON형식으로 추출하여 fbResponse에 담아주고, 아래에서 각각의 변수들에 해당 데이터를 저장해 줍니다.
            cityname = fbResponse.name;        //도시 이름
            citylon = fbResponse.coord.lon;      //도시의 좌표(경도)
            citylat = fbResponse.coord.lat;      //도시의 좌표(위도)
            weatherid = fbResponse.weather[0].id;
            weathermain = fbResponse.weather[0].main;
            citytemp = fbResponse.main.temp;
            cityhumi = fbResponse.main.humidity;
            citytemp_min = fbResponse.main.temp_min;
            citytemp_max = fbResponse.main.temp_max;
            citywind = fbResponse.wind.speed;
            cityclouds = fbResponse.clouds.all;

            //아래에서 로그를 콘솔에 찍어봄으로써 데이터가 제대로 추출되었는지 확인해봅니다.
            console.log("cityname=", cityname);
            console.log("weatherid=", weatherid);
            console.log("weathermain=", weathermain);
            console.log("citytemp=", citytemp);

         } catch (e) {
            console.log(e);
         /* 가끔씩, 한번에 못 받아올때가 있습니다. (아마 서버쪽의 오류인듯 싶습니다.) 
            그래서 만약 못받아 올 때를 대비하여 try-catch구문을 이용하여 catch에서 currentInfo()를 한번 더 선언해줌으로써 오류가 났을 때에는 다시 한번 요청을 해서 받아오게 됩니다. */
            currentInfo();
         }
      });

      res.on('error', function(e) {
         console.log("Got an error: ", e);
      });
   });
}

//Active Once. (First) - 서버를 실행할 때, currentInfo()를 불러주어 아래에서 API를 처음 call하게 됩니다.
currentInfo();

//After, repeat Active (After), - (period 1Hour, for update) - 이후에, 1시간 간격으로 Interval을 통하여 지속적으로 실행해줍니다.
var curi = setInterval(currentInfo, 3600000);

/*아래의 todayInfo()는 현재 시간에 따른 날씨정보 뿐만 아니라 오늘의 날씨정보를 얻기 위하여 추가로 작성해보았습니다.*/

// request for today(forecast) -  위의 currentInfo()와 같은 내용이므로 자세한 설명은 생략하도록 하겠습니다.

function todayInfo() {

   var urltoday = 'http://api.openweathermap.org/data/2.5/forecast?q=Seoul&mode=json&units=metric&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451';

   http.get(urltoday, function(res) {
      var body2 = '';
      res.on('data', function(chunk2) {
         body2 += chunk2.toString();
      });

      res.on('end', function() {
         try {
            var fbResponse2 = JSON.parse(body2);

            citytemp9 = fbResponse2.list[0].main.temp;
            cityhumi9 = fbResponse2.list[0].main.humidity;
            cityid9 = fbResponse2.list[0].weather[0].id;
            citymain9 = fbResponse2.list[0].weather[0].main;
            
            citytemp12 = fbResponse2.list[1].main.temp;
            cityhumi12 = fbResponse2.list[1].main.humidity;
            cityid12 = fbResponse2.list[1].weather[0].id;
            citymain12 = fbResponse2.list[1].weather[0].main;

            citytemp15 = fbResponse2.list[2].main.temp;
            cityhumi15 = fbResponse2.list[2].main.humidity;
            cityid15 = fbResponse2.list[2].weather[0].id;
            citymain15 = fbResponse2.list[2].weather[0].main;

            citytemp18 = fbResponse2.list[3].main.temp;
            cityhumi18 = fbResponse2.list[3].main.humidity;
            cityid18 = fbResponse2.list[3].weather[0].id;
            citymain18 = fbResponse2.list[3].weather[0].main;

            citytemp21 = fbResponse2.list[4].main.temp;
            cityhumi21 = fbResponse2.list[4].main.humidity;
            cityid21 = fbResponse2.list[4].weather[0].id;
            citymain21 = fbResponse2.list[4].weather[0].main;

            console.log("citymain in 9(Morning)=", citymain9);
            console.log("citymain in 21(Evening)=", citymain9);

         } catch (e) {
            console.log(e);
            todayInfo();
         }
      });

      res.on('error', function(e) {
         console.log("Got an error: ", e);
      });
   });   
}

todayInfo();

var todayI = setInterval(todayInfo, 86400000); //86400sec = 1 day,(period 1day, for update)

server.listen(8888, function(req, res) {
   console.log("server running on 8888.");
});
</script> -->