<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.btn {
	border: none;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

.bt {
	background-color: white;
	color: black;
	border: 1px solid gray;
}

.well {
	background: white;
}
</style>
<c:choose>
	<c:when test="${!empty map }">
		<h3 style="text-align: : left; padding-left: : 200px;"></h3>
		<p style="text-align: left; padding-left: 200px; font-size: 12pt;">
			보낸사람 : ${map.FT_SENDER } | 작성일 :
			<fmt:formatDate value="${map.FT_DATE}" pattern="yy-MM-dd" />
		
		받는사람 : ${map.FT_RECEIVER}
		</hr>
		</p>
		<div class="col-xs-0 col-md-2"></div>
		<div class="col-xs-12 col-md-8">
			<pre
				style="background-color: white; text-align: left; border-color: white; font-family: HelveticaNeue, '나눔바른고딕', NanumBarunGothic, AppleSDGothicNeo-Regular, sans-serif;">${map.FT_CONTENT}</pre>
		</div>
		<div class="col-xs-0 col-md-2"></div>


	</c:when>
</c:choose>


