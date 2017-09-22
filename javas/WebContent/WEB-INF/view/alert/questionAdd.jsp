<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
<c:when test="${rst}">
	<script>
		window.alert("게시물이 성공적으로 처리되었습니다.");
		location.href="/question/list.jv";
	</script>
</c:when>
<c:otherwise>
	<script>
		window.alert("게시물 업로드 실패");
		location.href="/question/list.jv";
	</script>
</c:otherwise>
</c:choose>