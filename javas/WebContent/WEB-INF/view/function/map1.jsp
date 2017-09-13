<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLmh6ZJBgbqRo7N5muFms65pBzt4j4uJg&sensor=true">	
</script>
<script type="text/javascript">
var src;
var dest;
var marker;
var map;
var coords;
var address;
$(function() {
	// Geolocation API에 액세스할 수 있는지를 확인
	if (navigator.geolocation) {
		//위치 정보를 정기적으로 얻기

		var id = navigator.geolocation
				.watchPosition(function(pos) {
					coords = {
						"lat" : pos.coords.latitude,
						"lng" : pos.coords.longitude,
					};
					var geocoder = new google.maps.Geocoder();

					var latlng = new google.maps.LatLng(coords.lat,
							coords.lng);
					geocoder.geocode({
						'latLng' : latlng
					}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							if (results[1]) {
								address = results[3].formatted_address;
							}
						} else {
							alert("Geocoder failed due to: " + status);
						}
						src = new google.maps.LatLng(coords.lat,
								coords.lng) 
					});
				});
		$('#btnStop').click(function() {
			navigator.geolocation.clearWatch(id);
		});

	} else {
		alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	}

});

$(function() {
		$('#ss').click(function() {
			$.ajax({
				url : "https://maps.googleapis.com/maps/api/directions/json",
				data : {
					"origin" : "잠실롯데백화점",
					"destination" : "잠실역",
					"mode" : "walk",
					"key" : "AIzaSyDLmh6ZJBgbqRo7N5muFms65pBzt4j4uJg",
				}
				
			}).done(function(rst){
				console.log(rst);
				var data = rst;
				$.ajax({
					url : "/function/transferAjax.jv",
					data : {
						"transfer" : JSON.stringify(data),
					}	
				}).done(function(rst2){
					
				});
				
			});
		});
	});
</script>
</head>
<body>
<div>
	<button id="ss" class="btn btn-lg btn-primary btn-block"
				type="button">버튼</button>
</div>
</body>
</html>