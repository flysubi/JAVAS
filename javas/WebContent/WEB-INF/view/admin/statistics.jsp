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
		  
  	  
		
		var data = google.visualization.arrayToDataTable([ ['남여성별회원분포도', ''], 
			['남성', ${man}],	['여성', ${woman}], ['무응답', ${no}] 
		]);

		var options = {
			title : '남여성별분포도',
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
		
  	 	
  	  	
  	  	
  	  	
  	  	
  	  	
		var data = google.visualization.arrayToDataTable([ ['나이별회원분포도', ''], 
			[ '10대', ${cnt1}],	[ '20대', ${cnt2} ], [ '30대', ${cnt3} ], [ '40대', ${cnt4}], [ '50대', ${cnt5} ], [ '60대이상', ${cnt6} ], [ '무응답', ${cnt7} ] ]);

		var options = {
			title : '연령별분포도',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div2'));
		chart.draw(data, options);
	}
	
	
</script>



