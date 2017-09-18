<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#top, #calendar.fc-unthemed {
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
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

.left {
	float: left
}

.right {
	float: right
}

.clear {
	clear: both
}

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

.fc-left, .fc-right, .fc-view-container {
	font-family: "Ubuntu", Tahoma, "Helvetica Neue", Helvetica, Arial,
		sans-serif;
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
				<div class="modal-body"
					style="padding: 40px 50px; padding-top: 10px;">
					<form action="/function/addCal.jv" method="post">
						<div class="form-group" style="text-align: right">
							<label>Dday 설정 </label> <input type="checkbox" name="dday">
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								id="title" name="title" placeholder="기념일/일정을 등록하세요."
								required="required">
						</div>
						<div class='form-group'>
							<label>날짜</label> <input class='form-control startDate'
								type="date" id='date' name='date'>
						</div>
						<div style="float: left; font-weight: 700; margin-left: 106px;">수입</div>
						<div style="float: right; margin-bottom: 0;">
							<button type="button" id="plus"
								style="font-size: 10px; padding-left: 2px; padding-right: 2px;">
								<i class="fa fa-plus"></i>
							</button>
						</div>
						<div align="right"
							style="font-weight: 700; margin-bottom: 5px; margin-right: 106px;">지출</div>

						<div class='form-group' id="asset"></div>
						<div class='form-group'>
							<label style="margin-top: 12px;">시간 (선택사항)</label> <input
								class='form-control' type="time" id='time' name='time'>
						</div>
						<div class='form-group'>
							<label>색상</label> <input class='form-control' type="color"
								id="color" name="color" value="#337ab7">
						</div>
						<button type="submit" class="btn btn-success btn-block submitbt">
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
				<div class="modal-body"
					style="padding: 40px 50px; padding-top: 10px;">
					<form action="/function/calModify.jv" method="post" id="sub">
						<input type="hidden" name="num" id="num"/>
						<div class="form-group" style="text-align: right">
							<label>Dday 설정 </label> <input type="checkbox" id="dday"
								name="dday" />
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								id="title2" name="title" required="required"
								placeholder="기념일/일정을 등록하세요.">
						</div>
						<div class='form-group'>
							<label>날짜</label> <input class='form-control startDate'
								type="date" id='date2' name='date'>
						</div>
						<div style="float: left; font-weight: 700; margin-left: 106px;">수입</div>
						<div style="float: right; margin-bottom: 0;">
							<button type="button" id="plus2"
								style="font-size: 10px; padding-left: 2px; padding-right: 2px;">
								<i class="fa fa-plus"></i>
							</button>
						</div>
						<div align="right"
							style="font-weight: 700; margin-bottom: 5px; margin-right: 106px;">지출</div>
						<div class='form-group' id="asset2"></div>
						<div class='form-group'>
							<label style="margin-top: 12px;">시간 (선택사항)</label> <input
								class='form-control' type="time" id='time2' name='time'>
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
								<button type="submit" class="btn btn-info btn-block submitbt" name="mode"
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
								plus = acontent;	
								$("#asset2").html('');
								$("#asset").html(acontent);
								$("#myModal").modal();
								$("#date").val(date.format());
							},
							eventClick: function(calEvent, jsEvent, view) {
								plus2 = acontent2;	
								$("#asset").html('');
								$("#asset2").html(acontent2);
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
								var imarr = calEvent.income.split(',');
								var emarr = calEvent.expense.split(',');
								var isarr = calEvent.icontent.split(',');
								var esarr = calEvent.econtent.split(',');
								var anarr = calEvent.anum.split(',');
								
								for(var i=0; i<imarr.length; i++) {
									if(i != 0) {
										plusfunc2();
									}
									$(".islt").eq(i).val(isarr[i]).prop("selected", true);
									$(".eslt").eq(i).val(esarr[i]).prop("selected", true);
									$(".imoney").eq(i).val(imarr[i]);
									$(".emoney").eq(i).val(emarr[i]);
									$(".anum").eq(i).val(anarr[i]);
									console.log($(".anum").eq(i).val());
								}
								if(calEvent.dday == "true") {
									$("#dday").prop("checked",true);
								} else {
									$("#dday").prop("checked",false);
								}
								
						    },
							events: [
								 <c:forEach var="g" items="${list }" varStatus="vs">
								 {
									title : '${g.TITLE}',
									start : '${g.CC}<c:if test="${g.CTIME ne null}">T${g.CTIME}</c:if>',
									num : '${g.NUM}',
									dday : '${g.DDAY}',
									income : '${g.INCOME}',
									icontent : '${g.ICONTENT}',
									expense : '${g.EXPENSE}',
									econtent : '${g.ECONTENT}',
									anum : '${g.ANUM}',
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
			

			var acontent = "<select class=\"form-control islt\" name=\"icontent\" style=\"width: 21%; float: left;\">"
			+"<option value=\"\">수입내역</option>"
			+"<option value=\"기본급여\">기본급여</option>"
			+"<option value=\"용돈\">용돈</option>"
			+"<option value=\"보너스\">보너스</option>"
			+"<option value=\"이자\">이자</option>"
			+"<option value=\"기타\">기타</option>"
			+"</select>"
			+"<input type=\"number\" class=\"form-control imoney\""
			+"name=\"income\" value=\"0\" required style=\"width: 28%; float: left;\">"
			+"<input type=\"number\" class=\"form-control emoney\""
			+"name=\"expense\" value=\"0\" required style=\"width: 28%; float: right;\">"
			+"<select class=\"form-control eslt\" name=\"econtent\" style=\"width: 21%; float: right;\">"
			+"<option value=\"\">지출내역</option>"
			+"<option value=\"식비\">식비</option>"
			+"<option value=\"생활용품\">생활용품</option>"
			+"<option value=\"의류/미용\">의류/미용</option>"
			+"<option value=\"경조사\">경조사</option>"
			+"<option value=\"통신비\">통신비</option>"
			+"<option value=\"용돈\">용돈</option>"
			+"<option value=\"방세/세금\">방세/세금</option>"
			+"<option value=\"기타\">기타</option>"
			+"</select>";
			
			var acontent2 = acontent+"<input type=\"hidden\" name=\"anum\" value=\"0\" class=\"anum\">";
			
			var plus = acontent;
			var plus2 = acontent2;
			
			var plusfunc = function(){
				var icar = new Array();
				var imar = new Array();
				var ecar = new Array();
				var emar = new Array();
				for(var i=0; i<$(".imoney").length; i++) {
					icar[i] = $(".islt").eq(i).val();
					imar[i] = $(".imoney").eq(i).val();
					ecar[i] = $(".eslt").eq(i).val();
					emar[i] = $(".emoney").eq(i).val();
				}
				plus += "<br/>" + acontent;
				$("#asset").html(plus);
				for(var i=0; i<$(".imoney").length-1; i++) {
					$(".islt").eq(i).val(icar[i]).prop("selected", true);
					$(".imoney").eq(i).val(imar[i]);
					$(".eslt").eq(i).val(ecar[i]).prop("selected", true);
					$(".emoney").eq(i).val(emar[i]);
				}
			};
			var plusfunc2 = function(){
				var icar = new Array();
				var imar = new Array();
				var ecar = new Array();
				var emar = new Array();
				var anar = new Array();
				for(var i=0; i<$(".imoney").length; i++) {
					icar[i] = $(".islt").eq(i).val();
					imar[i] = $(".imoney").eq(i).val();
					ecar[i] = $(".eslt").eq(i).val();
					emar[i] = $(".emoney").eq(i).val();
					anar[i] = $(".anum").eq(i).val();
				}
				plus2 += "<br/>" + acontent2;
				$("#asset2").html(plus2);
				for(var i=0; i<$(".imoney").length-1; i++) {
					$(".islt").eq(i).val(icar[i]).prop("selected", true);
					$(".imoney").eq(i).val(imar[i]);
					$(".eslt").eq(i).val(ecar[i]).prop("selected", true);
					$(".emoney").eq(i).val(emar[i]);
					$(".anum").eq(i).val(anar[i]);
				}
			};
			$("#plus").click(plusfunc);
			$("#plus2").click(plusfunc2);
			
			
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
