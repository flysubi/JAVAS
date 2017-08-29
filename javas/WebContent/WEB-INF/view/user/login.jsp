<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
b {
	font-size: 16pt;
}
</style>
</head>

<body>
	<div style="margin-top: 40px;">
	</div>
	<div align="center" class="row">
		<div class="col-ss-0 col-sm-4"></div>
		<div class="col-ss-12 col-sm-4">
			<div class="form-group">
				<form action="/user/loginResult.jv" class="form-signin" method="post">
					<!-- 컨트롤러로 보냄 -->
					<div class="form-group">
						<label for="id"><b>ID</b></label><br /> <input type="text"
							class="form-control" name="id" id="jid"
							placeholder="아이디를 입력해주세요." required="required"><br />
					</div>

					<div class="form-group">
						<label for="pass"><b>Password</b></label><br /> <input
							type="password" class="form-control" name="pass"
							placeholder="비밀번호를 입력해주세요." required="required">
						<c:if test="${lfalse ne null }">
							<span style="color: red;">아이디 또는 비밀번호가 잘못되었습니다.<br/>
							다시 확인해주시기 바랍니다.<br/></span>
						</c:if>
						<br />
					</div>
					<button type="submit" class="btn bnt-default" style="background-color: LightSkyBlue; color: white; font-weight: 900">로그인</button>
					<div class="form-group">
					<br/><input type="checkbox" name="keep"/>로그인 상태 유지
					</div>
				</form>
				<a href="/user/findUser.jv">아이디 또는 비밀번호찾기</a>
			</div>
		</div>
		<div class="col-ss-0 col-sm-4"></div>
	</div>
</body>
</html>