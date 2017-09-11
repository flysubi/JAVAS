<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD--k3vwuB9cAExy9ezTOAo-FR6ajxUctw&callback=initMap"
	async defer></script>
<style>
.modal-dialog.modal-fullsize { 
	width: 25%; 
	height: 20%;
	float: center; 
	margin: 20px 550px; 
	padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 5px; 
}
</style>
<button type="button" id="wbt" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">현재날씨</button>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-fullsize">
      <div class="modal-content modal-fullsize">
        <div class="modal-header" style="background-color: LightSkyBlue;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="local" class="modal-title"></h4>
        </div>
       	 <div class="modal-body" style="padding-top: 0; padding-bottom: 15px;">
          <table id="content">
          </table>
         </div>
        <div class="modal-footer" style="background-color: LightSkyBlue; padding-bottom: 45px; padding-top:0;">
        </div>
      </div>
    </div>
  </div>
</div>
<script>
function initMap() {
$("#wbt").click(function(){
		var address;
		var add;
	navigator.geolocation.watchPosition(function(e) {
		var geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(e.coords.latitude, e.coords.longitude);
		geocoder.geocode({'latLng' : latlng}, function(results, status) {
			address = results[2].formatted_address;
			add = "<b>"+address.substring(5);
			add += " 현재날씨</b>";
		$("#local").html(add);
		});
		$.ajax({
			url : "https://api.openweathermap.org/data/2.5/weather",
			data : {
				"lat" : e.coords.latitude,
				"lon" : e.coords.longitude,
				"APPID" : "86e306162a4303e8b644973a4ce00b65"
			}
		}).done(function(rst){
			var data = rst;
			$.ajax({
				url : "/function/weatherCodeAjax.jv",
				data : {
					"code" : data.weather[0].id
				}	
			}).done(function(rst2){
				var data2 = rst2;
				var content = "";
				content += "<th><td style=\"text-align: center;\"><img alt=\""+data.weather[0].icon+"\" src=\"/style/weather/weather-icon/"+data.weather[0].icon+".png\" style=\"height: 100px; width: 100px;\"/>";
				content += "<span style=\"font-size: 40pt; vertical-align: middle; font-weight: 700;\">"+parseInt(data.main.temp - 273.15)+"˚C</span><br/>";
				content += "<b style=\"font-size:20px;\">"+data2.MEAN+"</b></td>";
				content += "<td style=\"padding-left: 20px; padding-top: 27px; vertical-align: top; \"><b>풍향 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.wind.speed+"m/s<br/>";
				content += "습도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.main.humidity+"%</b>";
				$("#content").html(content);
			});
			
		});
	});
	
});
}
</script>