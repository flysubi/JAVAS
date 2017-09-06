<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
</head>
<body>
	<script src='/fullcalendar/lib/jquery.min.js'></script>
	<script src='/fullcalendar/lib/moment.min.js'></script>
	<script src='/fullcalendar/fullcalendar.js'></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#calendar').fullCalendar({
		    dayClick: function(date, jsEvent, view) {

		        alert('Clicked on: ' + date.format());

		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

		        alert('Current view: ' + view.name);

		        // change the day's background color just for fun
		        $(this).css('background-color', 'red');

		    }
		});
	});
	</script>

	<div id='calendar'></div>
</body>
</html>