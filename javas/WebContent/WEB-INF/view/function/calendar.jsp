<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

	body {
		margin: 0;
		padding: 0;
		font-size: 14px;
	}

	#top,
	#calendar.fc-unthemed {
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
	#top {
		background: #eee;
		border-bottom: 1px solid #ddd;
		padding: 0 10px;
		line-height: 40px;
		font-size: 12px;
		color: #000;
	}

	#top .selector {
		display: inline-block;
		margin-right: 10px;
	}

	#top select {
		font: inherit; /* mock what Boostrap does, don't compete  */
	}

	.left { float: left }
	.right { float: right }
	.clear { clear: both }

	#calendar {
		max-width: 900px;
		margin: 40px auto;
		padding: 0 10px;
	}


	.fc-sat {
	color: blue;
	}
	
	.fc-sun {
		color: red;
	}
	
	.cal {
		padding-bottom: 50px;
		padding-top: 20px;
	}
</style>
<!-- <link rel="stylesheet" type="text/css" href="https://bootswatch.com/united/bootstrap.min.css"> -->
<script src='/fullcalendar/lib/moment.min.js'></script>
<script src='/fullcalendar/lib/jquery-ui.min.js'></script>
<script src='/fullcalendar/fullcalendar.js'></script>
<script src='/fullcalendar/demos/js/theme-chooser.js'></script>
<script src='/fullcalendar/locale-all.js'></script>

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
					<form action="/function/addCal.jv" method="post">
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
							<label>색상</label> <input class='form-control' type="color"
								id="color" name="color" value="#337ab7">
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-send"></span> 등록
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<!-- Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-calendar"></span> 기념일/일정 수정
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form action="/function/calModify.jv" method="post" id="sub">
						<input type="hidden" name="num" id="num" />
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								id="title2" name="title" placeholder="기념일/일정을 등록하세요.">
						</div>
						<div class='form-group'>
							<label>날짜</label> <input class='form-control startDate'
								type="date" id='date2' name='date'>
						</div>
						<div class='form-group'>
							<label>시간 (선택사항)</label> <input class='form-control' type="time"
								id='time2' name='time'>
						</div>
						<div class='form-group'>
							<label>색상</label> <input class='form-control' type="color"
								id="color2" name="color">
						</div>
						<div class="row">
							<div class="col-sm-6">
								<button type="button" class="btn btn-danger btn-block"
									name="mode" value="delete" id="del">
									<span class="glyphicon glyphicon-remove"></span> 삭제
								</button>
							</div>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-info btn-block" name="mode"
									value="update">
									<span class="glyphicon glyphicon-wrench"></span> 수정
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
			$(document).ready(function() {

				initThemeChooser({
					init: function(themeSystem) {
						$('#calendar').fullCalendar({
							handleWindowResize: true,							
// 							 contentHeight: 750,		
// 							 aspectRatio: 2,
							themeSystem: 'bootstrap3',
							locale : 'ko',
							header: {
								left: 'title',
								center: '',
							},
							weekNumbers: true,
							dayClick : function(date, jsEvent, view) {
								$("#date").val(date.format());
								$("#myModal").modal();
							},
							eventClick: function(calEvent, jsEvent, view) {
								$("#myModal2").modal();
								$("#date2").val(calEvent.start.format("YYYY-MM-DD"));
								if(calEvent.start.format("HH-mm") != "00-00") {
									$("#time2").val(calEvent.start.format("HH:mm"));
								} else {
									$("#time2").val("");
								}
								$("#title2").val(calEvent.title);
								$("#color2").val(calEvent.color);
								$("#num").val(calEvent.num);
								
						    },
							events: [
								 <c:forEach var="g" items="${list }" varStatus="vs">
								 {
									title : '${g.TITLE}',
									start : '${g.CC}<c:if test="${g.CTIME ne null}">T${g.CTIME}</c:if>',
									num : '${g.NUM}',
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


<script>
$("#del").on("click", function() {
	var v = confirm("일정을 삭제하시겠습니까?");
	if(v){
		$.ajax({
			url : "/function/calModify.jv",
			data : {
				"num" : $("#num").val(),
				"mode" : "delete",
			}
		})
		$("#myModal2").modal('hide');
		top.document.location.reload(); 

	} else {
		return;
	}
});
</script>