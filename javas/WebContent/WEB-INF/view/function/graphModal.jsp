<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="modal-header"  id="myModal">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h3>나의 fitness 현황</h3>
</div>

<div class="modal-body" style="padding-left: 0px;">
<div id="chart_div"  ></div>
<div id="chart_div2"></div>
</div>

<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
	   var d1 = new Date("${wg}");
	   var time = d1.getTime();
	   var date2 = new Date(time);
	   var ar = [];
	   for(var i = 0; i <= ${length}; i++) {
		   time +=86400000;
		   date2 = new Date(time);
		   var year = date2.getFullYear();
		   var month = (1 + date2.getMonth());
		   month = month >= 10 ? month : '0' + month;
		   var day = date2.getDate();
		   day = day >= 10 ? day : '0' + day;
		   var d2 = year+"/"+month+"/"+day;
		   ar[i] = d2;
	   }

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'X');
      data.addColumn('number', '나의몸무게');
      data.addColumn('number', '표준체중');

      data.addRows([
    	  <c:forEach var="g" items="${list}" >
    	  [ "${g.D}",${g.KG} , ${g.SW} ],
        </c:forEach>
    	  <c:forEach var="i" begin="0" end="${length}" step="1" varStatus="vs">
          [ar[${i}] , null , null]
          	<c:if test="${!vs.last }"> , </c:if>
          </c:forEach>
    	  
    	  
      ]);

      var options = {
    		  title: '몸무게 변화 (표준체중)',
            
        hAxis: {
          title: '날짜',
        },
        vAxis: {
          title: 'kg',
        },
        colors: ['#a52714', '#097138'] ,
        width: 860,
        height: 300,
        pointSize : 5
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic2);

function drawBasic2() {
	var d1 = new Date("${gc}");
	   var time = d1.getTime();
	   var date2 = new Date(time);
	   var ar = new Array();
	   for(var i = 0; i <= ${length2}; i++) {
		   time +=86400000;
		   date2 = new Date(time);
		   var year = date2.getFullYear();
		   var month = (1 + date2.getMonth());
		   month = month >= 10 ? month : '0' + month;
		   var day = date2.getDate();
		   day = day >= 10 ? day : '0' + day;
		   var d2 = year+"/"+month+"/"+day;
		   ar[i] = d2;
	   }

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'X');
      data.addColumn('number', '나의 칼로리');
      data.addColumn('number', '권장 칼로리');

      data.addRows([
    	  <c:forEach var="g" items="${list2}">
    	  [ "${g.EDATE}", ${g.K} , ${map.AC} ]s,
        </c:forEach>
    	  <c:forEach var="i" begin="0" end="${length2}" step="1" varStatus="vs">
          [ar[${i}] , null , null]
          	<c:if test="${!vs.last }"> , </c:if>
          </c:forEach>
      ]);

      var options = {
    		  title: '칼로리 (운동+식사, 권장칼로리)',
            
        hAxis: {
          title: '날짜',
        },
        vAxis: {
          title: 'kcal',
        },
        colors: ['#a52714', '#097138'] ,
        legend: { position: 'center' },
        width: 860,
        height: 300,
        pointSize : 5
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

      chart.draw(data, options);
    }
    </script>


 