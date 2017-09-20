<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.well {
	background: white;
	border-radius: 0px;
	margin-top: 15px;
}

.w3-border {
	border: 0px solid #ccc !important;
}
</style>
<div class="well row ">
	<div class="row">
		<div class="col-xs-6 col-md-6">
			<h3 style="text-align: left; padding-left: 200px;">
				${sessionScope.map.TITLE}
				<c:if test="${sessionScope.map.WRITER eq sessionScope.auth }">
					<a href="/freetalk/talkDel.jv?num=${sessionScope.map.NUM}"
						style="color: red;"><span class="glyphicon glyphicon-remove"></span></a>
				</c:if>

			</h3>
		</div>
		<c:if test="${sessionScope.map.FILENAME ne null}">
			<div class="col-xs-6 col-md-6">
				<h3 align="right" style="padding-right: 250px;">
					<a href="/freetalk/down.jv?n=${param.num}"> <span
						class="glyphicon glyphicon-download-alt"></span>
					</a>
				</h3>
			</div>
		</c:if>
	</div>
	<p style="text-align: left; padding-left: 200px; font-size: 12pt;">
		작성자 : ${sessionScope.map.WRITER } | 작성일 :
		<fmt:formatDate value="${sessionScope.map.WRITEDATE}"
			pattern="yy-MM-dd" />
		<c:choose>
			<c:when test="${sessionScope.map.DIFF lt 1}">
				<c:choose>
					<c:when test="${sessionScope.map.DIFF * 1440 gt 60}">
						<small><fmt:formatNumber
								value="${sessionScope.map.DIFF * 24}" pattern="#,###" />시간 전</small>
					</c:when>
					<c:otherwise>
						<small><fmt:formatNumber
								value="${sessionScope.map.DIFF * 1440}" pattern="#,###" />분 전</small>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${sessionScope.map.DIFF lt 365}">
				<small><fmt:formatNumber value="${sessionScope.map.DIFF}"
						pattern="#,###" />일 전</small>
			</c:when>
			<c:otherwise>
				<small><fmt:formatNumber
						value="${sessionScope.map.DIFF div 365}" pattern="#,###" />년 전</small>
			</c:otherwise>

		</c:choose>
		<button type="submit" class="btn" id="like"
			value="${sessionScope.map.NUM }"
			style="color: red; background-color: white; font-size: 10pt; padding-left: 3; padding-right: 3; padding-bottom: 1; padding-top: 0; border: 1px solid gray;">
			<c:choose>
				<c:when test="${b}">♥</c:when>
				<c:otherwise>♡</c:otherwise>
			</c:choose>
			<span style="color: black;">${love}</span>
		</button>
	</p>

	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
		<pre
			style="background-color: white; text-align: left; border-color: white; font-family: HelveticaNeue, '나눔바른고딕', NanumBarunGothic, AppleSDGothicNeo-Regular, sans-serif;">${sessionScope.map.CONTENT}</pre>
	</div>
	<div class="col-xs-0 col-md-2"></div>
	<hr
		style="background-color: silver; height: 1px; width: 65%; margin-left: 17%; margin-right: 17%;" />
	<p style="text-align: left; padding-left: 200px;">