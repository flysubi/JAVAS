
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
    var map;
	var coords;
	var address;
 
    function initialize() {
    	directionsDisplay = new google.maps.DirectionsRenderer();
	    
    	$(function() {
    		// Geolocation API에 액세스할 수 있는지를 확인
    		if (navigator.geolocation) {
    			//위치 정보를 정기적으로 얻기
    		
    			var id = navigator.geolocation.watchPosition(function(pos) {
    				coords = {
    					"lat" : pos.coords.latitude,
    					"lng" : pos.coords.longitude,
    				};
    				var geocoder = new google.maps.Geocoder();

    				var latlng = new google.maps.LatLng(coords.lat, coords.lng);

    				geocoder.geocode({
    					'latLng' : latlng
    				}, function(results, status) {

    					if (status == google.maps.GeocoderStatus.OK) {

    						if (results[1]) {

    							address = results[3].formatted_address;

    							$('#latitude').html(coords.lat); // 위도 
    							$('#longitude').html(coords.lng); // 경도
    							$('#address').html(address); // 주소
    							
    						}

    					} else {

    						alert("Geocoder failed due to: " + status);

    					}

    				});

    				
    		    	var now = new google.maps.LatLng(coords.lat, coords.lng);
    			    alert(now);
    		    	var mapOptions = {
    			      zoom:17,
    			      mapTypeId: google.maps.MapTypeId.ROADMAP,
    			      center: now,
    			    }
    			    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    			    directionsDisplay.setMap(map);
    			    
    			    var marker = new google.maps.Marker({
    					position : now,
    					map : map
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
    
    function calcRoute() {
        var start = document.getElementById('start').value;
        var end = document.getElementById('end').value;
        var mode = document.getElementById('mode').value;
   
        var request = {
            origin:address,
            destination:end,
            travelMode: eval("google.maps.DirectionsTravelMode."+mode)
        };
        
        alert(request.origin);
        
        directionsService.route(request, function(response, status) {
          alert(status);  // 확인용 Alert..미사용시 삭제
          if (status == google.maps.DirectionsStatus.OK) {
              directionsDisplay.setDirections(response);
             
          }
        });
      }
   
 
   	google.maps.event.addDomListener(window, 'load', initialize);
    		
	    		   
    </script>
</head>
<body>
	<div id="panel">
		<b>Start: </b> <input type="text" id="start" /> <b>End: </b> <input
			type="text" id="end" />
		<div>
			<strong>Mode of Travel: </strong> <select id="mode">
				<option value="DRIVING">Driving</option>
				<option value="WALKING">Walking</option>
				<option value="BICYCLING">Bicycling</option>
				<option value="TRANSIT">Transit</option>
			</select> <input type="button" value="길찾기" onclick="Javascript:calcRoute();" />
		</div>
	</div>
	<div align="center">
		<div id="map-canvas" style="width: 460px; height: 380px;"></div>

		위도:<span id="latitude" name="lat"></span>
		</li> 경도:<span id="longitude" name="lng"></span>
		</li> 주소:<span id="address" name="add"></span>
		</li>
		</ul>
	</div>

</body>
</html>

