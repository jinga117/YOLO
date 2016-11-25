<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src='http://api.openweathermap.org/data/2.5/weather?q=Seoul&mode=json&units=metric&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451'></script>

<script type="text/javascript" src='http://api.openweathermap.org/data/2.5/forecast?q=Seoul&mode=json&units=metric&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451'></script>

<title>Insert title here</title>
</head>
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

					citylon = fbResponse.coord.lon;      //도시의 좌표(경도,위도)

					citylat = fbResponse.coord.lat;

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

	/* 가끔씩, 한번에 못 받아올때가 있습니다. (아마 서버쪽의 오류인듯 싶습니다.) 그래서 만약 못받아 올 때를 대비하여 try-catch구문을 이용하여 catch에서 currentInfo()를 한번 더 선언해줌으로써 오류가 났을 때에는 다시 한번 요청을 해서 받아오게 됩니다. */

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
	</script>
<body>
</body>
</html>