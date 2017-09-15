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
							
								var mapProp = {
									//center: 서울
									center : new google.maps.LatLng(coords.lat, coords.lng),
									zoom : 17,
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
		console.log(src);
		console.log(dest);
	}
	function calcRoute(src, dest) {
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
<style type="text/css">
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: arial;
        font-size: 13px;
        overflow: hidden;
    }
    #map_canvas {
        float: right;
        width: 820px;
        height: 406px;
    }
    #listing {
        float: left;
        margin-left: 1px;
        width: 205px;
        height: 326px;
        overflow: auto;
        cursor: pointer;
    }
    #controls {
        padding: 5px;
    }
    .placeIcon {
        width: 16px;
        height: 16px;
        margin: 2px;
    }
    #results {
        border-collapse: collapse;
        width: 184px;
    }
    #locationField {
        margin-left: 1px;
    }
    #autocomplete {
        width: 516px;
        border: 1px solid #ccc;
    }
</style>
<body>

	<div id="direction">		
		<div float="left" >
		<input type="text" name="address" id="address" class="form-control" style="width: 250px;">
		</div>
		
		<div id="googleMap" float="right" style="width: 100%; height: 100%;"></div>
		<div id="directionsPannel" style="width: 20%; height: 100%;"></div>
		
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

