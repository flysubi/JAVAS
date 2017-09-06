<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div id="chart_div" align="center">
</div>
<div align="center" style="margin-left: 10px;">
<table style="width: 80%;" id="list">
	
</table>
</div>
<script>
	var weather = function() {
		$.ajax({
			url : "http://api.openweathermap.org/data/2.5/forecast",
			data : {
				"lat" : 37.5615512,
				"lon" : 126.9733249,
				"APPID" : "86e306162a4303e8b644973a4ce00b65"
			}
		}).done(function(rst){
			
			var all= rst;
			var weather = "";
			for(var i=0; i<=7; i++) {
				weather += "<td style=\"text-align: center;\">";
				weather += "<img alt=\""+all.list[i].weather[0].icon+"\" src=\"/style/weather-icon/"+all.list[i].weather[0].icon+".png\"/><br/>";
				weather += parseInt(all.list[i].main.temp - 273.15)+"˚C<br/>";
				weather += all.list[i].main.humidity+"%<br/>";
				weather += all.list[i].wind.speed+"m/s<br/>";
				weather += "<td/>"
			}
			
			$("#list").html(weather); 
			
			google.charts.load('current', {packages: ['corechart', 'line']});
			google.charts.setOnLoadCallback(drawBasic);

			function drawBasic() {

			      var data = new google.visualization.DataTable();
			      data.addColumn('string', '날짜');
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
	
	
</script>

