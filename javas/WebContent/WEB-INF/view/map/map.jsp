<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLmh6ZJBgbqRo7N5muFms65pBzt4j4uJg&sensor=true">
	
</script>
<script type="text/javascript">
$(function() {        
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 정기적으로 얻기
        var map;
		var coords;
		var address;
		
        var id = navigator.geolocation.watchPosition(function(pos) {
       		coords = {
    				"lat" : pos.coords.latitude,
    				"lng" : pos.coords.longitude,
    				"address" : pos.coords.address,
    		};
       		
       		
     
        	var geocoder = new google.maps.Geocoder();

        	
        	var latlng = new google.maps.LatLng(coords.lat, coords.lng);

        	

        	geocoder.geocode({'latLng' : latlng}, function(results, status) {

        		if (status == google.maps.GeocoderStatus.OK) {
        	       	
        			if (results[1]) {

        				address = results[3].formatted_address;
        				
        				$('#latitude').html(coords.lat);     // 위도 
        	            $('#longitude').html(coords.lng); // 경도
        				$('#address').html(address); // 주소
        				list(coords.lat, coords.lng, address);            
    				}

    	    	} else {

        			alert("Geocoder failed due to: " + status);

           		}

        	});              
           	
            
 
            
            
            
            
        	map = new google.maps.Map(document.getElementById("map_canvas"), {
        			"center" : coords,
        			"zoom" : 17
        	});

            var marker = new google.maps.Marker({
            	position : coords,
            	map : map
            });
            
            var marker_2 = new google.maps.Marker({
    			map : map,
    			position : {
    				"lat" : 37.498,
    				"lng" : 127.06,
    			},
    			
    		});
        });
        
        
        $('#btnStop').click(function() {
            navigator.geolocation.clearWatch(id);
        });     
        

    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
    
});
</script>
</head>
<body>
	<div align="center">
		<div id="map_canvas" style="width: 460px; height: 380px;"></div>
		<ul>
			<li>위도:<span id="latitude" name="lat"></span></li>
			<li>경도:<span id="longitude" name="lng"></span></li>
			<li>주소:<span id="address" name="add"></span></li>
		</ul>
		<!-- 
<input id="btnStop" type="button" value="감시를 끝낸다" />
 -->
</body>
</html>
<script>

var list = function(lat, lng, address) {
	$.ajax({
		url : "/map/mapAjax.jv",
		data : {
			"lat" : lat,
			"lng" : lng,
			"address" : address,
		}
	}).done(function() {
		
	});	

	
}
list();
</script>




