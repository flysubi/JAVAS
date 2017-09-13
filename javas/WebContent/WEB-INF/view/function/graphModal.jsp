<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-header" style="padding: 35px 50px;" id="myModal">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>
	</h4>
</div>

<div class="modal-body" style="padding: 40px 50px;">
<div id="chart_div"></div>
</div>
<div class="modal-footer">
</div>



<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'Point');

      data.addRows([
    	  <c:forEach var="g" items="${list}" varStatus="vs">
    	  [ "${g.KG}" , ${g.SW} ]
			<c:if test="${!vs.last }"> , </c:if> 
        </c:forEach>
      ]);

      var options = {
        hAxis: {
          title: '날짜'
        },
        vAxis: {
          title: '포인트'
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    </script>
    