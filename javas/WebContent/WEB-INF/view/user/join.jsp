<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">

.big,
.form-group input {
	display: inline;
}

.big {
	font-size: 16px; 
	font-weight: 400;
	font-family: HelveticaNeue,'나눔바른고딕',NanumBarunGothic,AppleSDGothicNeo-Regular,sans-serif;
	margin-top: 20px;
}

.form-group input {
	width:70%;
	float: right; 
	height: 40px;
}
</style>
<title>회원 가입</title>
</head>
<body>
<div align="left" class="row">
	<div class="col-ss-0 col-sm-2"></div>
	<div class="col-ss-12 col-sm-4">
		<div class="form-group">
			<form action="/join/result.sz" class="form-signin"  method="post">
				<div class="form-group">
				<label for="id"><span class="big">아이디</span></label><input type="text"
						name="id" id="jid" class="form-control" placeholder="아이디를 입력해주세요."
						required="required" style="width:70%; float: right;"><br /> <span id="cor"
						style="color: green;"></span> <span id="wrg" style="color: red;"></span>
				</div>
				<div class="form-group">
					<label for="email"><span class="big">이메일</span></label><input type="email"
						name="email" id="jemail" class="form-control"
						placeholder="your email address" required="required"><br />
					<span id="ecor" style="color: green;"></span> <span id="ewrg"
						style="color: red;"></span>
				</div>
				<div class="form-group">
					<label for="pass"><span class="big">비밀번호</span></label><input
						type="password" class="form-control" name="pass"
						placeholder="create a password" required="required"><br />
				</div>
				<div class="form-group">
					<label for="pass"><span class="big">비밀번호 확인</span></label><input
						type="password" class="form-control" name="passc"
						placeholder="create a password" required="required"><br />
				</div>
				<button type="submit" class="btn bnt-default" id="join">가입하기</button>
				<button type="reset" class="btn bnt-default">다시작성</button>
			</form>
			<a href="findMember.sz">아이디찾기</a>
		</div>
	</div>
	<div class="col-ss-0 col-sm-6"></div>
	</div>
</body>
</html>
<script>
	document.getElementById("jid").onblur = function() { // 포커스를 옮길 때 작동
		var xhr = new XMLHttpRequest();
		var id = this.value;
		if (id.trim().length > 0) {
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					if (this.responseText.trim() == "true") {
						document.getElementById("cor").innerHTML = "";
						document.getElementById("wrg").innerHTML = "이미 등록된 아이디입니다.<br/>";
						document.getElementById("join").disabled= true;
					} else {
						document.getElementById("cor").innerHTML = "멋진 아이디네요!<br/>";
						document.getElementById("wrg").innerHTML = "";
						if(document.getElementById("ecor").innerHTML.trim().length > 0) {
							document.getElementById("join").disabled= false;
						}
						// 내부에서 c:choose로 해도 됨.
					}
				}
			}
			xhr.open("get", "/join/idCheckAjax.sz?mode=id&id=" + id, true);
			xhr.send();
		}
	};
	
	document.getElementById("jemail").onblur = function() { // 포커스를 옮길 때 작동
		var xhr = new XMLHttpRequest();
		var email = this.value;
		if (email.trim().length > 0) {
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					if (this.responseText.trim() == "true") {
						document.getElementById("ecor").innerHTML = "";
						document.getElementById("ewrg").innerHTML = "이미 등록된 이메일입니다.<br/>";
						document.getElementById("join").disabled= true;
					} else {
						document.getElementById("ecor").innerHTML = "멋진 이메일이네요!<br/>";
						document.getElementById("ewrg").innerHTML = "";
						if(document.getElementById("cor").innerHTML.trim().length > 0) {
							document.getElementById("join").disabled= false;
						}
						
						// 내부에서 c:choose로 해도 됨.
					}
				}
			}
			xhr.open("get", "/join/idCheckAjax.sz?mode=email&email=" + email, true);
			xhr.send();
		}
		
	};
	
</script>