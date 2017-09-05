<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
<c:when test="${rst}">
	<script>
		window.alert("일정등록 완료");
		location.href="/calendar/mainCal.jv";
	</script>
</c:when>
<c:otherwise>
	<script>
		window.alert("일정등록 실패");
		location.href="/calendar/mainCal.jv";
	</script>
</c:otherwise>
</c:choose>