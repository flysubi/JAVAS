<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<h3>회원통계</h3>
<div id="chart_div" style="width: 900px; height: 500px;"></div>


<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		  
  	  
		
		var data = google.visualization.arrayToDataTable([ ['남여성별', 'Hours per Day'], 
			[ '남성', ${man}],	[ '여성', ${woman} ], [ '무응답', ${not} ] ]);

		var options = {
			title : '남여성비',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>



