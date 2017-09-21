<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${rst }">
		<script>
			window.alert("메세지 전송에 성공하였습니다.");
			location.href="/memo/list.jv";
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			window.alert("메세지 전송에 실패하였습니다.\n없는 아이디 또는 탈퇴한 회원입니다.");
			location.href="/memo/write.jv";
		</script>
	</c:otherwise>
</c:choose>