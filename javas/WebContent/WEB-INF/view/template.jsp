<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:getAsString name="title"/></title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
body {
	font-family:HelveticaNeue,'나눔바른고딕',NanumBarunGothic,AppleSDGothicNeo-Regular,sans-serif;
	
}
</style>
<body>
	<nav>
		<!-- <tiles:getAsString name="nav"/>  value값 출력(글씨를 찍음) -->
		<tiles:insertAttribute name="nav"/> <!-- value값 include -->
	</nav>
	<c:choose>
	<c:when test="${nav eq null }">
	<div class="container">
	<section style="min-height: 72%; text-align: center;">
		<tiles:insertAttribute name="section"/>
	</section>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
	</div>
	</c:when>
	<c:otherwise>
	<section style="min-height: 79%; text-align: center;">
		<tiles:insertAttribute name="section"/>
	</section>
	<div class="container">
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
	</div>
	</c:otherwise>
	</c:choose>
</body>
</html>