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
						<h3><span class="glyphicon glyphicon-ok"></span> Today</h3>
						<c:forEach var="i" items="${today}">
							<p><b>${i.TITLE}</b><br />
								<small><fmt:formatDate value="${i.CDATE}" pattern="yyyy년 MM월 dd일" /></small>
							</p>
						</c:forEach>
						<c:if test="${empty today}">
							<p>오늘의 일정이 없습니다.</p>
						</c:if>
						</div>
						<div class="col-sm-7">
						<h3><span class="glyphicon glyphicon-ok"></span> D-day</h3>
						<c:forEach var="i" items="${dday}">
							<p><b>${i.TITLE}</b>까지D${i.DD}일남았습니다.</p>
						</c:forEach>
						<c:if test="${empty dday}">
							<p>설정해둔 D-day가 없습니다.</p>
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
			});
		});
	</script>

</body>
</html>