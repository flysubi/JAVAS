<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD--k3vwuB9cAExy9ezTOAo-FR6ajxUctw&callback=initMap"
	async defer></script>
<script type="text/javascript" src="/style/weather/Modal.js"></script>
<style>
th {
	background-color: lightgray;
}

.fore>tr>td {
	border: 1px solid gray;
	text-align: center;
}
</style>
<button id="bt">실시간날씨</button>
<div id="modal">
<button class="js_close">닫기</button>
</div>
<h2 id=loc></h2>
<div id="chart_div" align="center"></div>
<div align="center" style="margin-left: 10px;">
	<table id="list" style="width: 80%;">
	</table>
</div>
<div align="center" style="margin-top: 70px;">
	<h2>3일예보</h2>
	<table id="one" class="fore"
		style="width: 80%; border: 1px solid gray; table-layout: fixed;">
	</table>
</div>
<script>
var myModal = new Example.Modal({
    id: "modal" // 모달창 아이디 지정
});

function initMap() {
	navigator.geolocation.getCurrentPosition(function(e) {
		var weather = function() {
		$.ajax({
			url : "https://api.openweathermap.org/data/2.5/forecast",
			data : {
				"lat" : e.coords.latitude,
				"lon" : e.coords.longitude,
				"APPID" : "86e306162a4303e8b644973a4ce00b65"
			}
		}).done(function(rst){
			
			var all= rst;
			var weather = "";
			var one = "";
			var two = "";
			var three = "";
			for(var i=0; i<=7; i++) {
				weather += "<td style=\"text-align: center;\">";
				weather += "<img alt=\""+all.list[i].weather[0].icon+"\" src=\"/style/weather/weather-icon/"+all.list[i].weather[0].icon+".png\"/><br/>";
				weather += "<b>"+parseInt(all.list[i].main.temp - 273.15)+"˚C</b><br/>";
				weather += all.list[i].main.humidity+"%<br/>";
				weather += all.list[i].wind.speed+"m/s<br/>";
				weather += "<td/>"
			}
			
			$("#list").html(weather);
			
			for(var i=8; i<=15; i++) {
				if(i == 8) {
					one += "<tr><th colspan=\"9\">내일("+new Date(all.list[i].dt*1000).getDate()+
							"일~"+new Date((all.list[i].dt+86400)*1000).getDate()+"일)</th></tr><tr><td>시간</td>";
				}
				one += "<td>"+(new Date(all.list[i].dt*1000).getHours() <10 ? "0" : "") +
	  			new Date(all.list[i].dt*1000).getHours()+"</td>";
			}
			for(var i=8; i<=15; i++) {
				if(i == 8) {
					one += "</tr><tr><td>날씨</td>";
				}
				one += "<td><img alt=\""+all.list[i].weather[0].icon+"\" src=\"/style/weather/weather-icon/"+all.list[i].weather[0].icon+".png\"/></td>";
			}
			for(var i=8; i<=15; i++) {
				if(i == 8) {
					one += "</tr><tr><td>기온</td>";
				}
				one += "<td><b>"+parseInt(all.list[i].main.temp - 273.15)+"˚C</b></td>";
			}
			for(var i=8; i<=15; i++) {
				if(i == 8) {
					one += "</tr><tr><td>습도</td>";
				}
				one += "<td>"+all.list[i].main.humidity+"%</td>";
			}
			for(var i=8; i<=15; i++) {
				if(i == 8) {
					one += "</tr><tr><td>풍속</td>"
				}
				one += "<td>"+all.list[i].wind.speed+"m/s</td>"
			}
			for(var i=16; i<=23; i++) {
				if(i == 16) {
					one += "</tr><tr><th colspan=\"9\">모레("+new Date(all.list[i].dt*1000).getDate()+
							"일~"+new Date((all.list[i].dt+86400)*1000).getDate()+"일)</th></tr><tr><td>시간</td>";
				}
				one += "<td>"+(new Date(all.list[i].dt*1000).getHours() <10 ? "0" : "") +
	  			new Date(all.list[i].dt*1000).getHours()+"</td>"
			}
			for(var i=16; i<=23; i++) {
				if(i == 16) {
					one += "</tr><tr><td>날씨</td>";
				}
				one += "<td><img alt=\""+all.list[i].weather[0].icon+"\" src=\"/style/weather/weather-icon/"+all.list[i].weather[0].icon+".png\"/></td>";
			}
			for(var i=16; i<=23; i++) {
				if(i == 16) {
					one += "</tr><tr><td>기온</td>";
				}
				one += "<td><b>"+parseInt(all.list[i].main.temp - 273.15)+"˚C</b></td>";
			}
			for(var i=16; i<=23; i++) {
				if(i == 16) {
					one += "</tr><tr><td>습도</td>";
				}
				one += "<td>"+all.list[i].main.humidity+"%</td>";
			}
			for(var i=16; i<=23; i++) {
				if(i == 16) {
					one += "</tr><tr><td>풍속</td>"
				}
				one += "<td>"+all.list[i].wind.speed+"m/s</td>"
			}
			for(var i=24; i<=31; i++) {
				if(i == 24) {
					one += "</tr><tr><th colspan=\"9\">글피("+new Date(all.list[i].dt*1000).getDate()+
							"일~"+new Date((all.list[i].dt+86400)*1000).getDate()+"일)</th></tr><td>시간</td>";
				}
				one += "<td>"+(new Date(all.list[i].dt*1000).getHours() <10 ? "0" : "") +
	  			new Date(all.list[i].dt*1000).getHours()+"</td>"
			}
			for(var i=24; i<=31; i++) {
				if(i == 24) {
					one += "</tr><tr><td>날씨</td>";
				}
				one += "<td><img alt=\""+all.list[i].weather[0].icon+"\" src=\"/style/weather/weather-icon/"+all.list[i].weather[0].icon+".png\"/></td>";
			}
			for(var i=24; i<=31; i++) {
				if(i == 24) {
					one += "</tr><tr><td>기온</td>";
				}
				one += "<td><b>"+parseInt(all.list[i].main.temp - 273.15)+"˚C</b></td>";
			}
			for(var i=24; i<=31; i++) {
				if(i == 24) {
					one += "</tr><tr><td>습도</td>";
				}
				one += "<td>"+all.list[i].main.humidity+"%</td>";
			}
			for(var i=24; i<=31; i++) {
				if(i == 24) {
					one += "</tr><tr><td>풍속</td>"
				}
				one += "<td>"+all.list[i].wind.speed+"m/s</td>"
			}
			$("#one").html(one);
			
			google.charts.load('current', {packages: ['corechart', 'line']});
			google.charts.setOnLoadCallback(drawBasic);

			function drawBasic() {

			      var data = new google.visualization.DataTable();
			      data.addColumn('string', '시간');
			      data.addColumn('number', '기온');

			      data.addRows([
			    	  <c:forEach begin="0" end="7" var="i" varStatus="vs">
			    	  	[	
			    	  		(new Date(all.list[${i}].dt*1000).getHours() <10 ? "0" : "") +
			    	  			String(new Date(all.list[${i}].dt*1000).getHours())
			    	  		,parseInt(all.list[${i}].main.temp - 273.15)]
			    	  	<c:if test="${!vs.last }"> , </c:if>
			    	  </c:forEach>
			      ]);

			      var options = {
			        
			        vAxis: {
			        	title : '온도(˚C)'
			        },
			        pointSize : 7
			        
			      };

			      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

			      chart.draw(data, options);
			    }
		})
	};
	
	weather();
	$("#loc").html(e.coords.latitude+"/"+e.coords.longitude);
	
	
	});	
}


</script>