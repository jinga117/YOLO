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

	//var weatherArr = new Array();            �Ʒ����� ������ �����ϴ� ��� �迭�� �̿��ϼŵ� �˴ϴ�.




	//(Temp variable2), for Today weather Information

	var citytime9, citytemp9, cityhumi9, citymain9, cityid9;

	var citytime12, citytemp12, cityhumi12, citymain12, cityid12;

	var citytime15, citytemp15, cityhumi15, citymain15, cityid15;

	var citytime18, citytemp18, cityhumi18, citymain18, cityid18;

	var citytime21, citytemp21, cityhumi21, citymain21, cityid21;



	//����ð��� �´� ������ ���������� ������ function�Դϴ�.

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

	//JSON�������� �����Ͽ� fbResponse�� ����ְ�, �Ʒ����� ������ �����鿡 �ش� �����͸� ������ �ݴϴ�.



					cityname = fbResponse.name;        //���� �̸�

					citylon = fbResponse.coord.lon;      //������ ��ǥ(�浵,����)

					citylat = fbResponse.coord.lat;

					weatherid = fbResponse.weather[0].id;

					weathermain = fbResponse.weather[0].main;

					citytemp = fbResponse.main.temp;

					cityhumi = fbResponse.main.humidity;

					citytemp_min = fbResponse.main.temp_min;

					citytemp_max = fbResponse.main.temp_max;

					citywind = fbResponse.wind.speed;

					cityclouds = fbResponse.clouds.all;

					

	//�Ʒ����� �α׸� �ֿܼ� �����ν� �����Ͱ� ����� ����Ǿ����� Ȯ���غ��ϴ�.

					console.log("cityname=", cityname);

					console.log("weatherid=", weatherid);

					console.log("weathermain=", weathermain);

					console.log("citytemp=", citytemp);

				} catch (e) {

					console.log(e);

	/* ������, �ѹ��� �� �޾ƿö��� �ֽ��ϴ�. (�Ƹ� �������� �����ε� �ͽ��ϴ�.) �׷��� ���� ���޾� �� ���� ����Ͽ� try-catch������ �̿��Ͽ� catch���� currentInfo()�� �ѹ� �� �����������ν� ������ ���� ������ �ٽ� �ѹ� ��û�� �ؼ� �޾ƿ��� �˴ϴ�. */

					currentInfo();

				}

			});

			res.on('error', function(e) {

				console.log("Got an error: ", e);

			});

		});

	}

	//Active Once. (First) - ������ ������ ��, currentInfo()�� �ҷ��־� �Ʒ����� API�� ó�� call�ϰ� �˴ϴ�.

	currentInfo();

	//After, repeat Active (After), - (period 1Hour, for update) - ���Ŀ�, 1�ð� �������� Interval�� ���Ͽ� ���������� �������ݴϴ�.

	var curi = setInterval(currentInfo, 3600000);





	/*�Ʒ��� todayInfo()�� ���� �ð��� ���� �������� �Ӹ� �ƴ϶� ������ ���������� ��� ���Ͽ� �߰��� �ۼ��غ��ҽ��ϴ�.*/

	// request for today(forecast) -  ���� currentInfo()�� ���� �����̹Ƿ� �ڼ��� ������ �����ϵ��� �ϰڽ��ϴ�.

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