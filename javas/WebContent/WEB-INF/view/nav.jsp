<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  navigator 
	navbar-default
	navbar-inverse
-->
<div class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNav"><span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span></button>
	</div>
	<div class="collapse navbar-collapse" id="myNav">
		<ul class="nav navbar-nav">
			<li><a href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900;">게시판</a></li>
		</ul>
		<c:choose>
		<c:when test="${auth eq null }">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900;">로그인</a></li>
			<li><a href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900;">회원가입</a></li>
		</ul>
		</c:when>
		<c:otherwise>
		
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900;">${auth } (${point } p)<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">로그아웃</a></li>
							
						</ul></li>
			
		</ul>
		</c:otherwise>
		</c:choose>
	</div>
</div>
<c:if test="${sessionScope.auth ne null }">
<script>
	var ws = new WebSocket("ws://192.168.10.70/ws/alert.ws")
	var num = 0;
	ws.onmessage = function(e) { // 서버측에서 메세지를 받을 때 해야할 일
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/memo/memoAjax.sz", true);
		xhr.send();
		location.reload(true);
	};
</script>
</c:if>
