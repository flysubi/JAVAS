<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<h3>회원통계</h3>
<div id="chart_div" style="width: 900px; height: 500px;"></div>
<div id="chart_div2" style="width: 900px; height: 500px;"></div>

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


	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		  
  	  	var mc = ${man};
  	  	var wc = ${woman};
  	  	var nc = ${no};
		
		var data = google.visualization.arrayToDataTable([ ['남여성별회원분포도', ''], 
			[ '남성', mc],	[ '여성', wc ], [ '무응답', nc ] ]);

		var options = {
			title : '남여성비',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart2);
	function drawChart2() {
		var age = 0;  
		
  	  	var y = new Date().getYear()+1900;
  	  	
  	  	console.log("${list(1).year}");
  	  	
  	  	
		var data = google.visualization.arrayToDataTable([ ['나이별회원분포도', ''], 
			[ '10대', mc],	[ '20대', wc ], [ '30대', nc ], [ '30대', nc ], [ '30대', nc ], [ '40대', nc ], [ '50대', nc ], [ '60대이상', nc ], [ '무응답', nc ] ]);

		var options = {
			title : '남여성비',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div2'));
		chart.draw(data, options);
	}
	
	
</script>



