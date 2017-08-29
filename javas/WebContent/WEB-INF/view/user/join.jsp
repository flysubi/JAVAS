<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
b {
	font-size: 16pt;
}
</style>
<title>회원 가입</title>
</head>
<body>
	<div align="center" class="row">
		<div class="col-ss-0 col-sm-4"></div>
		<div class="col-ss-12 col-sm-4">
			<div class="form-group">
				<form action="/user/joinResult.jv" class="form-signin" method="post">
					<h3 class="form-signin-heading">회원 가입</h3>
					<div class="form-group">
						<label for="id"><b>ID</b></label><br /> <input type="text"
							class="form-control" name="id" id="jid"
							placeholder="pick your id" required="required"><br /> <span
							id="cor" style="color: green;"></span> <span id="wrg"
							style="color: red;"></span>
					</div>
					<div class="form-group">
						<label for="email"><b>Email</b></label><br /> <input type="email"
							name="email" id="jemail" class="form-control"
							placeholder="your email address" required="required"><br />
						<span id="ecor" style="color: green;"></span> <span id="ewrg"
							style="color: red;"></span>
					</div>
					<div class="form-group">
						<label for="pass"><b>Password</b></label><br /> <input
							type="password" class="form-control" name="pass"
							placeholder="create a password" required="required"><br />
					</div>
					<button type="submit" class="btn bnt-default" id="join">가입하기</button>
					<button type="reset" class="btn bnt-default">다시작성</button>
				</form>
				<a href="findMember.sz">아이디찾기</a>
			</div>
		</div>
		<div class="col-ss-0 col-sm-4"></div>
	</div>
</body>
</html>
<script>
	document.getElementById("jid").onblur = function() { // 포커스를 옮길 때 작동
		var id = this.value;
		if (id.trim().length > 0) {
			$.ajax({
				url : "/user/idCheckAjax.jv",
				data : {
					"id" : id
				}
			}).done(function(rst){
				if(rst == true) {
					document.getElementById("cor").innerHTML = "";
					document.getElementById("wrg").innerHTML = "이미 등록된 아이디입니다.<br/>";
					document.getElementById("join").disabled= true;
				}else {
					document.getElementById("cor").innerHTML = "멋진 아이디네요!<br/>";
					document.getElementById("wrg").innerHTML = "";
					if(document.getElementById("ecor").innerHTML.trim().length > 0) {
						document.getElementById("join").disabled= false;
					}
				}
			})
		}	
	};
	
	document.getElementById("jemail").onblur = function() {
		var email = this.value;
		if (email.trim().length > 0) {
			$.ajax({
				url : "/user/emailCheckAjax.jv",
				data : {
					"email" : email
				}
			}).done(function(rst){
				if(rst == true) {
					document.getElementById("ecor").innerHTML = "";
					document.getElementById("ewrg").innerHTML = "이미 등록된 이메일입니다.<br/>";
					document.getElementById("join").disabled= true;
				}else {
					document.getElementById("ecor").innerHTML = "멋진 이메일이네요!<br/>";
					document.getElementById("ewrg").innerHTML = "";
					if(document.getElementById("cor").innerHTML.trim().length > 0) {
						document.getElementById("join").disabled= false;
					}
				}
			})
		}	
	};
</script>