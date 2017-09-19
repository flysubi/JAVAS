<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<button id="cal">TEST ...</button>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 550px;">
				<div class="modal-header" align="center">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>
						오늘은 <span class="glyphicon glyphicon-music"></span>
					</h3>
				</div>
				<div class="modal-body"
					style="padding: 40px 50px; padding-top: 10px;">
					<div class="row" style="text-align: left;">
						<div class="col-sm-5">
							<h3>
								<span class="glyphicon glyphicon-ok"></span> 일정
							</h3>
					<table style="font-size: 10pt;" >
							<c:forEach var="i" items="${today}">
										<tr >
										<td style="padding-right: 10px;padding-top: 5px;">
										<c:choose>
											<c:when test="${i.CTIME ne null }">
										 <span id="${i.NUM}"></span>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</td>
									<td><b>${i.TITLE}</b></td> 
										</tr>
							</c:forEach>
								</table>
							<c:if test="${empty today}">
								<p id="today">오늘의 일정이 없습니다.</p>
							</c:if> 
						</div>
						<div class="col-sm-7">
							<h3> 
								<span class="glyphicon glyphicon-ok"></span> D-day
							</h3>
							<c:forEach var="i" items="${dday}">
								<p>
									<b>${i.TITLE}</b>까지D${i.DD}일남았습니다.
								</p>
							</c:forEach>
							<c:if test="${empty dday}">
								<p id="dday">설정해둔 D-day가 없습니다.</p>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#cal").click(function() {   
				$("#myModal").modal();
				var message = "오늘의 일정은";
				$.ajax({
					url : "/function/calTtsAjax.jv",
				}).done(function(rst) {
					if(${!empty today}) {
						for (var i = 0; i < rst.length; i++) {
						if(rst[i].CTIME != null) {
							var getTime = (rst[i].CTIME).substring(0, 2);
							var intTime = parseInt(getTime);
							if (intTime < 12 ) { 
								message += " 오전  "+rst[i].CTIME;
								$("#"+rst[i].NUM).html("오전 "+rst[i].CTIME);
								} else { 
									var getMinutes = (rst[i].CTIME).substring(3,5);
									getTime = intTime - 12;  
									message += " 오후  "+getTime+" :  "+getMinutes;
									$("#"+rst[i].NUM).html("오후 "+getTime+":"+getMinutes);
									}
								}
							message +="   "+rst[i].TITLE+"  , "; 
						} 
						message += "입니다. ";
					 } else {
						 message += "없습니다.";
					 }
				if(${!empty dday}) { 
					var dday = "${dday[0].DD}".substring(1, "${dday[0].DD}".length); 
					message += "오늘의 D-day는 ${dday[0].TITLE}까지  "+dday+"일남았습니다.";
				} else {
					message += "없습니다.";
				}
				$.ajax({
					url : "/tts/ttsAjax.jv",
					data : {
						"message" : message
					}
				}).done(function(rst3){ 
					var audio = new Audio("/voice//"+rst3);
					audio.play();   
					deleteFile(rst3); 
				});
				
				var deleteFile = function(rst3) { 
					$.ajax({
						url : "/tts/ttsDeleteAjax.jv",
						data : {
							"tempname" : rst3 
						}
					})
				};  
				});
			});
		});
	</script>

</body>
</html>