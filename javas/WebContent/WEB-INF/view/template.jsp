<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
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
<body class="container">
	<div>
	<header>
		<div align="center" class="jumbotron"> <!-- 클래스는 2개이상도 쓸 수 있다. -->
			<a href="/" style="text-decoration:none; font-family: 돋움; font-weight: 900; font-size: 63pt;">JAVAS</a>
		</div>
	</header>
	<nav>
		<!-- <tiles:getAsString name="nav"/>  value값 출력(글씨를 찍음) -->
		<tiles:insertAttribute name="nav"/> <!-- value값 include -->
	</nav>
	<section style="min-height: 70%">
		<tiles:insertAttribute name="section"/>
	</section>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
	</div>
</body>
</html>