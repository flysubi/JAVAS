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
	 border : 1px solid gray;
}
.well {
	background: white;
}
</style>
<c:choose>
	<c:when test="${!empty posts }">
		<h3 style="text-align: : left; padding-left: : 200px;">
			${posts.FT_TITLE }
			<c:if test="${posts.FT_WRITER eq sessionScope.auth }">
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<a href="/question/boardDel.jv?num=${posts.FT_NUM}"><i
					class="fa fa-close" style="font-size: 24px; color: red"></i></a>
			</c:if>
		</h3>
		<p style="text-align: left; padding-left: 200px; font-size: 12pt;">
		작성자 : ${posts.FT_WRITER }
		| 작성일 :
			<fmt:formatDate value="${posts.FT_DATE}" pattern="yy-MM-dd" />
			<c:choose>
				<c:when test="${posts.FT_DIFF lt 1}">
					<c:choose>
						<c:when test="${posts.FT.DIFF * 1440 gt 60}">
							<small><fmt:formatNumber value="${posts.FT_DIFF * 24}"
									pattern="#,###" />시간 전</small>
						</c:when>
						<c:otherwise>
							<small><fmt:formatNumber value="${posts.FT_DIFF * 1440}"
									pattern="#,###" />분 전</small>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${posts.FT_DIFF lt 365}">
					<small><fmt:formatNumber value="${posts.FT_DIFF}"
							pattern="#,###" />일 전</small>
				</c:when>
				<c:otherwise>
					<small><fmt:formatNumber value="${posts.FT_DIFF div 365}"
							pattern="#,###" />년 전</small>
				</c:otherwise>
			</c:choose>
			</p>
			<div class="col-xs-0 col-md-2"></div>
			<div class="col-xs-12 col-md-8">
				<pre style="background-color: white; text-align: left; border-color: white;
					font-family: HelveticaNeue,'나눔바른고딕',NanumBarunGothic,AppleSDGothicNeo-Regular,sans-serif;">${posts.FT_CONTENT}</pre>
			</div>
			<div class="col-xs-0 col-md-2"></div>
			
			<c:if test="${sessionScope.auth eq 'admin' }">
				<div style="padding-right: 200px; padding-bottom: 10px;" align="right">
					<a href="/question/answer.jv?num=${posts.FT_NUM }">
						<button type="button" class="btn bt">답글 <span class="glyphicon glyphicon-pencil"></span></button>
					</a>
				</div>
			</c:if>
	</c:when>
</c:choose>


