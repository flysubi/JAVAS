<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${rst}">
	<script>
		window.alert("구매 완료");
		location.href = "/";
	</script>
</c:when>
<c:otherwise>
	<script>
		window.alert("포인트 부족으로 인한 구매 실패");
		location.href = "/store/main.jv";
	</script>
</c:otherwise>
</c:choose>
