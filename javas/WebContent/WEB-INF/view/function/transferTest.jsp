<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<!-- Naver Developers에서 발급받은 네이버지도 Application Key 입력  -->

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=JQJCPgBIgJSijQ4wqJJi&submodules=geocoder"></script>

	<script type="text/javascript">
		var data;
		var mapOptions = {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 7
		};

		var map = new naver.maps.Map('map', mapOptions);

		var sx = 126.97796919999996;
		var sy = 37.566535;
		var ex = 127.02762099999995;
		var ey = 37.49794199999999;

		function searchPubTransPathAJAX() {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/api/searchPubTransPath?SX=" + sx
					+ "&SY=" + sy + "&EX=" + ex + "&EY=" + ey
					+ "&apiKey=hBz5kOCw9o68sW/FQPzrrA";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log(JSON.parse(xhr.responseText)); // <- xhr.responseText 로 결과를 가져올 수 있음
					data = JSON.parse(xhr.responseText);
					alert(data);
					//노선그래픽 데이터 호출
					callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
					var result = data["result"]["path"];
					var time = result[0].info.totalTime;
					var transit = result[0].info.busTransitCount
							+ result[0].info.subwayTransitCount;
					var walk = result[0].info.totalWalk;
					var j = 0;
					
					$("#time").click(function() {
						for (i = 1; i < result.length; i++) {
							
							if (time > result[i].info.totalTime) {
								j = i;							}
						}
						alert(j);
						alert(result[j].info.totalTime);
						$.ajax({
							url : "/function/transferDataAjax.jv",
							data : {
								"transfer" : JSON.stringify(result[j]),
							}
						}).done(function(rst) {

						});
					});
					
					$("#transit").click(function() {
						cnt = 0;
						var arr = [];
						var num = [];
						for (i = 1; i < result.length; i++) {
							
							if ( transit > (result[i].info.busTransitCount + result[i].info.subwayTransitCount)) {
								
								num[cnt] = i; 
								arr[cnt] = result[i].info.totalTime; 
								cnt += 1;
								
							
							}
						}
						alert(num);
						time = arr[0];
						j = num[0];
						for(i=1;i<arr.length;i++) {
							if(time > arr[i]) {
								j = num[i];
								
							}
						}
						alert(j);
						$.ajax({
							url : "/function/transferDataAjax.jv",
							data : {
								"transfer" : JSON.stringify(result[j]),
							}
						}).done(function(rst) {

						});
					});
				
					$("#walk").click(function() {
						for (i = 1; i < result.length; i++) {
							if (walk > result[i].info.totalWalk ) {
								j = i;			
							}
						}
						alert(j);
						$.ajax({
							url : "/function/transferDataAjax.jv",
							data : {
								"transfer" : JSON.stringify(result[j]),
							}
						}).done(function(rst) {

						});
					});
				}
			}
		}

		//길찾기 API 호출
		searchPubTransPathAJAX();

		function callMapObjApiAJAX(mabObj) {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/api/loadLane?mapObject=0:0@"
					+ mabObj + "&apiKey=hBz5kOCw9o68sW/FQPzrrA";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultJsonData = JSON.parse(xhr.responseText);
					drawNaverMarker(sx, sy); // 출발지 마커 표시
					drawNaverMarker(ex, ey); // 도착지 마커 표시
					drawNaverPolyLine(resultJsonData); // 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if (resultJsonData.result.boundary) {
						var boundary = new naver.maps.LatLngBounds(
								new naver.maps.LatLng(
										resultJsonData.result.boundary.top,
										resultJsonData.result.boundary.left),
								new naver.maps.LatLng(
										resultJsonData.result.boundary.bottom,
										resultJsonData.result.boundary.right));
						map.panToBounds(boundary);
					}
				}
			}
		}

		// 지도위 마커 표시해주는 함수
		function drawNaverMarker(x, y) {
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(y, x),
				map : map
			});
		}

		// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
		function drawNaverPolyLine(data) {
			var lineArray;

			for (var i = 0; i < data.result.lane.length; i++) {
				for (var j = 0; j < data.result.lane[i].section.length; j++) {
					lineArray = null;
					lineArray = new Array();
					for (var k = 0; k < data.result.lane[i].section[j].graphPos.length; k++) {
						lineArray.push(new naver.maps.LatLng(
								data.result.lane[i].section[j].graphPos[k].y,
								data.result.lane[i].section[j].graphPos[k].x));
					}

					//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
					if (data.result.lane[i].type == 1) {
						var polyline = new naver.maps.Polyline({
							map : map,
							path : lineArray,
							strokeWeight : 3,
							strokeColor : '#003499'
						});
					} else if (data.result.lane[i].type == 2) {
						var polyline = new naver.maps.Polyline({
							map : map,
							path : lineArray,
							strokeWeight : 3,
							strokeColor : '#37b42d'
						});
					} else {
						var polyline = new naver.maps.Polyline({
							map : map,
							path : lineArray,
							strokeWeight : 3
						});
					}
				}
			}
		}

		function transferDataAjax() {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "/function/transferDataAjax.jv"
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					console.log(JSON.parse(xhr.responseText));
				}
			}
		}
	</script>
	<button id="time">최단시간</button>
	<button id="transit">최소환승</button>
	<button id="walk">최소보행</button>
</body>

</html>



