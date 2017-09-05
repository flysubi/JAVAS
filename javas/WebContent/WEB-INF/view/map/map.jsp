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
		
        var id = navigator.geolocation.watchPosition(function(pos) {
       		coords = {
    				"lat" : pos.coords.latitude,
    				"lng" : pos.coords.longitude
    		};
        	$('#latitude').html(coords.lat);     // 위도 
            $('#longitude').html(coords.lng); // 경도 
                
            
        	map = new google.maps.Map(document.getElementById("map_canvas"), {
        			"center" : coords,
        			"zoom" : 17
        	});
        	
            var marker = new google.maps.Marker({
            	position : coords,
            	map : map
            });    
        });
        
        
        $('#btnStop').click(function() {
            navigator.geolocation.clearWatch(id);
        });
        
        var map = function() {
    		$.ajax({
    			url : "/map/mapAjax.jv",
    			data : {
    				"lat" : coords.lat,
    				"lng" : coords.lng,
    			}
    		})
    				
    		
    		
    		
    	}

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
    <li>위도:<span id="latitude"></span></li>
    <li>경도:<span id="longitude"></span></li>
</ul>
<!-- 
<input id="btnStop" type="button" value="감시를 끝낸다" />
 -->
</body>
</html>
<script>
	




