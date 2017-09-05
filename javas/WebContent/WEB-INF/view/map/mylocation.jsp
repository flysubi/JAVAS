<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div align="center">
	<div id="map" style="width: 460px; height: 380px;"></div>
</div>

<script>
	console.log(navigator.geolocation); 	
	
	function initMap() {
		var map;
		var coords;
		navigator.geolocation.getCurrentPosition(function(e) {
			coords = {
				"lat" : e.coords.latitude,
				"lng" : e.coords.longitude
			};
			window.alert(coords.lat+"/"+coords.lng);
			map = new google.maps.Map(document.getElementById("map"), {
				"center" : coords,
				"zoom" : 17
			});
		});
	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLmh6ZJBgbqRo7N5muFms65pBzt4j4uJg&callback=initMap"
	async defer></script>




