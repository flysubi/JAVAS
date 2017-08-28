<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.navbar-default .navbar-nav>li>a {
	color: black;
}

</style>
<!--  navigator 
	navbar-default
	navbar-inverse
-->
<div class="navbar navbar-default"
	style="padding-left: 205px; padding-right: 213px; background-color: white; background-image: none; color: black; margin: 0;">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNav">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div class="collapse navbar-collapse" id="myNav"
		style="background-color: white;">
		<c:choose>
			<c:when test="${auth eq null }">
				<ul class="nav navbar-nav">
					<li><a href="#">신민수님 환영합니다! (100p)</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/user/join.one"> <span
							class="glyphicon glyphicon-user"></span> 회원가입
					</a></li>
					<li><a href="/user/login.one"> <span
							class="glyphicon glyphicon-log-in"></span> 로그인
					</a></li>
				</ul>
			</c:when>
			<c:otherwise>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"
						style="font-size: 18px; font-weight: 900; color: black;">${auth }
							(${point } p)<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">로그아웃</a></li>

						</ul></li>

				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="collapse navbar-collapse" id="myNav"
		style="background-color: white;">
		<ul class="nav navbar-nav">
<!-- 			<li><a href="#" style="color: black;">JAVAS</a></li> -->
            <li><a href="#"><img alt="javas" src="/style/javas.png"></a>
			<li><a href="#">자바스 사용법</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">JAVAS</a></li>
<<<<<<< HEAD
			<li><a href="/question/list.jv">Q&A</a></li>
			<li><a href="/freetalk/allTalks.js">공유게시판</a></li>
=======
			<li><a href="/question/list.js">Q&A</a></li>
			<li><a href="/freetalk/allTalks.jv">공유게시판</a></li>
>>>>>>> branch 'master' of https://github.com/flysubi/JAVAS.git
		</ul>
	</div>
</div>
<c:if test="${nav ne 'on'}">
	<div style="background-color: LightSkyBlue; margin-top: 0; padding-left: 218px;">
		<h1 style="margin: 0; color: white; font-size: 14pt; padding: 10px;">공지사항</h1>
	</div>
</c:if>