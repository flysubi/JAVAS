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
		<c:choose>
		<c:when test="${auth eq null }">
		<ul class="nav navbar-nav">
			<li><a href="#" style="font-family: 돋움; font-size: 14px; font-weight: 700; color: black;">신민수님 환영합니다! (100p)</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" style="font-family: 돋움; font-size: 14px;">로그인</a></li>
			<li><a href="#" style="font-family: 돋움; font-size: 14px;">회원가입</a></li>
		</ul>
		</c:when>
		<c:otherwise>
		
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900; color: black;">${auth } (${point } p)<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">로그아웃</a></li>
							
						</ul></li>
			
		</ul>
		</c:otherwise>
		</c:choose>
	</div>
	<div class="collapse navbar-collapse" id="myNav">
		<ul class="nav navbar-nav">
			<li><a href="#" style="font-family: 돋움; font-size: 36px; font-weight: 900; color: blue;">JAVAS</a></li>
		</ul>
		
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900; color: black;">사용법</a></li>
			<li><a href="#" style="font-family: 돋움; font-size: 18px; font-weight: 900; color: black;">공유게시판</a></li>
		</ul>
	</div>
</div>