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
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/user/join.jv"  style="color: #939393;"> <span
							class="glyphicon glyphicon-user"></span> 회원가입
					</a></li>
					<li><a href="/user/login.jv"  style="color: #939393;"> <span
							class="glyphicon glyphicon-log-in"></span> 로그인
					</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav navbar-nav">
					<li><p class="navbar-text" style="color: black;">${auth }님 환영합니다 (${point} P)</p></li>
				</ul>
				<ul class="nav navbar-nav navbar-right" >
						<li><a href="/user/logout.jv" style="color: #939393;">정보수정</a></li>
						<li><a href="/user/logout.jv" style="color: #939393;">로그아웃</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	<hr style="background-color: #939393; margin: 0"/>
	<div class="collapse navbar-collapse" id="myNav"
		style="background-color: white; font-weight: 600;">
		<ul class="nav navbar-nav">
<!-- 			<li><a href="#" style="color: black;">JAVAS</a></li> -->
            <li><a href="#"><img alt="javas" src="/style/javas.png"></a>
		</ul>
		<ul class="nav navbar-nav navbar-right" style="font-size: 14pt; margin-top: 17px;">
		<li><a href="#">메뉴얼</a></li>
			<li><a href="/question/list.jv">Q&A</a></li>
			<li><a href="/freetalk/allTalks.jv">공유게시판</a></li>
			<li><a href="#">JAVAS</a></li>
		</ul>
	</div>
</div>
<c:if test="${nav ne 'on'}">
	<div style="background-color: LightSkyBlue; margin-top: 0; padding-left: 218px;">
		<h1 style="margin: 0; color: white; font-size: 14pt; padding: 10px;">${title }</h1>
	</div>
</c:if>