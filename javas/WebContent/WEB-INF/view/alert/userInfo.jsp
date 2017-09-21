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
	<c:when test="${rst2 }">
		<script>
			window.alert("회원탈퇴에 성공하였습니다.\n그동안 이용해주셔서 감사합니다.");
			location.href="/";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			window.alert("현재 비밀번호를 잘못 입력하셨습니다.");
			location.href="/user/userInfo.jv";
		</script>
	</c:otherwise>
</c:choose>