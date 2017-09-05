<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='/fullcalendar/lib/moment.min.js'></script>
<script src='/fullcalendar/fullcalendar.js'></script>
<script src='/fullcalendar/locale-all.js'></script>
<script src='/fullcalendar/demos/js/theme-chooser.js'></script>

<style>
	
.fc-sat {
	color:blue;
}
.fc-sun {
	color:red;
}
.cal {
	padding-bottom: 50px;
	padding-top: 20px;
}

</style>
<div id='calendar' class="cal"></div>

<div class="container">

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-calendar"></span> 기념일/일정 등록
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form action="/calendar/addCal.jv" method="post">
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								id="title" name="title" placeholder="기념일/일정을 등록하세요.">
						</div>
						<div class='form-group'>
							<label>날짜</label> <input class='form-control startDate'
								type="date" id='date' name='date'>
						</div>
						<div class='form-group'>
							<label>시간 (선택사항)</label> <input class='form-control' type="time"
								id='time' name='time'>
						</div>
						<div class='form-group'>
						<label>색상</label>
							<input class='form-control' type="color" name="color" value="#337ab7">
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-send"></span> 등록
						</button>
					</form>
				</div>
			</div>
			<script type="text/javascript">
			$(document).ready(function() {

				initThemeChooser({

					init: function(themeSystem) {
						$('#calendar').fullCalendar({
							dayClick : function(date, jsEvent, view) {
								$("#date").val(date.format());
								$("#myModal").modal();
							},
							themeSystem: themeSystem,
							header: {
								left: '',
								center: 'title',
							},
							defaultDate: '2017-09-12',
							weekNumbers: true,
							events: [
								 <c:forEach var="g" items="${list }" varStatus="vs">
								 {
									title : '${g.TITLE}',
									start : '${g.CC}<c:if test="${g.CTIME ne null}">T${g.CTIME}</c:if>',
									<c:if test="${g.COLOR ne null}">color:'${g.COLOR}'</c:if>
								 }
								<c:if test="${!vs.last }"> , </c:if> 
							</c:forEach>
								]
						});
					},

					change: function(themeSystem) {
						$('#calendar').fullCalendar('option', 'themeSystem', themeSystem);
					}

				});

			});

			</script>
		</div>
	</div>
</div>
