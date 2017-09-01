<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${rst }">
		<script>
			window.alert("정보 변경에 성공하였습니다.");
			location.href="/user/userInfo.jv";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			window.alert("정보 변경에 실패하였습니다.\n관리자에게 문의바랍니다.");
			location.href="/user/userInfo.jv";
		</script>
	</c:otherwise>
</c:choose>