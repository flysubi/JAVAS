<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLmh6ZJBgbqRo7N5muFms65pBzt4j4uJg&sensor=true">	
</script>
<script type="text/javascript">
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var src;
	var dest;
	var marker;
	var map;
	var coords;
	var address;
	function initialize() {

		directionsDisplay = new google.maps.DirectionsRenderer();

		var mapProp = {
			//center: 서울
			center : new google.maps.LatLng(37.566535, 126.9779692),
			zoom : 8,
			panControl : true,
			zoomControl : true,
			mapTypeControl : true,
			scaleControl : true,
			streetViewControl : true,
			overviewMapControl : true,
			rotateControl : true,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
		};

		map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
		directionsDisplay.setMap(map);
		directionsDisplay.setPanel(document.getElementById("directionsPannel"));
		
		marker = new google.maps.Marker();
		//src = new google.maps.LatLng(37.5117887, 126.8395951) // 신정도일하이빌

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

	}

	google.maps.event.addDomListener(window, 'load', initialize);

	function moveLocation(dest, title) {

		map.panTo(dest);
		unsetMarker(marker);
		setMarker(dest, title);
	}

	function setMarker(dest, titlename) {
		marker = new google.maps.Marker({
			position : dest,
			map : map,
			title : titlename,
		});
		marker.setMap(map)
	}
	function unsetMarker(marker) {
		marker.setMap(null)
	}
	function procMapControl(response) {
		dest = new google.maps.LatLng(
				response.results[0].geometry.location.lat,
				response.results[0].geometry.location.lng);
		marker = new google.maps.Marker({
			position : dest,
			map : map,
			title : response.results[0].formatted_address,
		});
		moveLocation(dest);
		//var boundsk new google.maps.LatLngBounds();
		//map.fitBounds(bounds);
		switch (response.results[0].address_components.length) {
		case 1:
			map.setZoom(9);
			break;
		case 2:
			map.setZoom(9);
			break;
		case 3:
			map.setZoom(10);
			break;
		case 4:
			map.setZoom(12);
			break;
		case 5:
			map.setZoom(14);
			break;
		case 6:
			map.setZoom(16);
			break;
		default:
			map.setZoom(8);
			break;

		}
		calcRoute(src, dest);
		directionsDisplay.setMap(map);
	}
	function calcRoute(src, dest) {
		alert(src);
		alert(dest);
		var selectedMode = document.getElementById("mode").value;
		var request = {
			origin : src,
			destination : dest,
			// Note that Javascript allows us to access the constant
			// using square brackets and a string value as its
			// "property."
			travelMode : google.maps.TravelMode[selectedMode]
		};
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
			}
		});
	}
</script>
</head>

<body>
	<div class="container">

		<div class="jumbotron">
			<form class="form-nheo">
				<label for="Address" class="sr-only">도찾지</label> <input type="name"
					name="address" id="address" class="form-control" placeholder="도착지"
					required autofocus>

				<button id="btnnheo" class="btn btn-lg btn-primary btn-block"
					type="button">길찾기</button>
			</form>
		</div>
		<div>
			<strong>Travel Type </strong> <select id="mode"
				onchange="calcRoute();">
				<option value="DRIVING">Driving</option>
				<option value="WALKING">Walking</option>
				<option value="BICYCLING">Bicycling</option>
				<option value="TRANSIT">Transit</option>
			</select>
		</div>

		<div id="googleMap" style="width: 100%; height: 380px;"></div>
		<div id="directionsPannel" style="width: 30%; height: 100%;"></div>
		<input type="text" name="" size="40" value="입력값 오른쪽 정렬" style="text-align: right;">
	</div>
</body>

<script>
	$(function() {
		$('#btnnheo').click(function() {
			$.ajax({
				url : 'https://maps.googleapis.com/maps/api/geocode/json',
				data : $('.form-nheo').serialize(),
				type : 'GET',
				success : function(response) {
					console.log(response);
					procMapControl(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	});
</script>
</html>

