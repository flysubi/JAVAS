<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
<c:when test="${rst}">
	<script>
		window.alert("게시물 삭제 성공");
		location.href="/freetalk/allTalks.jv";
	</script>
</c:when>
<c:otherwise>
	<script>
		window.alert("게시물 삭제 실패");
		location.href="/freetalk/viewTalk.jv?num="+${num};
	</script>
</c:otherwise>
</c:choose>