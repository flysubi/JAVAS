<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
b {
	font-size: 16pt;
}
.form-control {
	height: 50px;
}
</style>
<title>회원 가입</title>
</head>
<body>
	<div style="margin-top: 40px;">
	</div>
	<div align="center" class="row">
		<div class="col-ss-0 col-sm-4"></div>
		<div class="col-ss-12 col-sm-4">
			<div class="form-group">
				<form action="/user/joinResult.jv" class="form-signin" method="post">
					<div class="form-group" >
						<div class="input-group">
    				<span class="input-group-addon">아이디</span>
						<input type="text"
							class="form-control" name="id" id="jid"
							required="required">
							</div>
						<input
							type="password" class="form-control" name="pass" id="pass"
							placeholder="비밀번호" required="required">
						<input
							type="password" class="form-control" id="cpass"
							placeholder="비밀번호 재확인" required="required">
							<span id="pcor" style="color: green; float: left;"></span> <span id="pwrg"
							style="color: red; float: left;"></span>
						<input type="email"
							name="email" id="jemail" class="form-control"
							placeholder="본인확인 이메일" required="required">
						<span id="ecor" style="color: green; float: left;"></span> <span id="ewrg"
							style="color: red; float: left;"></span>
					</div>
					<br/>
					<div class="form-group" >
					<input type="text"
							class="form-control" name="name"
							placeholder="이름">
					 <div class="input-group">
    				<span class="input-group-addon">생일</span>
    				<input id="year" type="text" class="form-control" name="year" placeholder="년(4자)" 
    					style="width: 40%;" maxlength="4">
    				<select class="form-control" name="month" id="month" style="width: 30%;">
    					<option>월</option>
    					<c:forEach begin="1" step="1" end="12" var="i">
    						<option value="${i }">${i }</option>
    					</c:forEach>
    				</select>
    				<input id="day" type="text" class="form-control" name="day"  maxlength="2" placeholder="일" style="width: 30%;">
    				</div>
    				<span id="ywrg"
							style="color: red; float: left;"></span><br/>
					<label class="radio-inline" style="font-size: 20px;"><input type="radio" name="gender" value="남" style="height: 20px; width: 20px;"> 남자</label>
					<label class="radio-inline" style="font-size: 20px;"><input type="radio" name="gender" value="여" style="height: 20px; width: 20px;"> 여자</label>
					</div>
					<button type="submit" class="btn bnt-default" id="join" style="background-color: LightSkyBlue; color: white; font-weight: 900; width: 49%;">저장하기</button>
					<button type="reset" class="btn bnt-default" style="background-color: LightSkyBlue; color: white; font-weight: 900;  width: 49%;">다시작성</button>
				</form>
				
				<a href="/user/findUser.jv">아이디찾기</a>
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
					document.getElementById("wrg").innerHTML = "<div align=\"left\" style=\"padding: 7px;\">이미 등록된 아이디입니다.</div>";
					document.getElementById("join").disabled= true;
				}else {
					document.getElementById("cor").innerHTML = "<div align=\"left\" style=\"padding: 7px;\">멋진 아이디네요!</div>";
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
					document.getElementById("ewrg").innerHTML = "<div align=\"left\ style=\"padding-left: 7px;\">이미 등록된 이메일입니다.</div>";
					document.getElementById("join").disabled= true;
				}else {
					document.getElementById("ecor").innerHTML = "<div align=\"left\" style=\"padding-left: 7px;\">멋진 이메일이네요!</div>";
					document.getElementById("ewrg").innerHTML = "";
					if(document.getElementById("cor").innerHTML.trim().length > 0) {
						document.getElementById("join").disabled= false;
					}
				}
			})
		}	
	};
	
	
	
	$("#cpass").blur(function(){
		var pass = $("#pass").val();
		var cpass = this.value;
		if (pass.trim().length > 0) {
			if(pass != cpass) {
				document.getElementById("pwrg").innerHTML = "<div align=\"left\" style=\"padding: 7px;\">비밀번호가 일치하지 않습니다.</div>";
				document.getElementById("pcor").innerHTML = "";
				document.getElementById("join").disabled= true;
			}else {
				document.getElementById("pcor").innerHTML = "<div align=\"left\" style=\"padding: 7px;\">비밀번호가 일치합니다!</div>";
				document.getElementById("pwrg").innerHTML = "";
				if(document.getElementById("cor").innerHTML.trim().length > 0 && document.getElementById("ecor").innerHTML.trim().length > 0) {
					document.getElementById("join").disabled= false;
				}
			}
		}
	})
	
	$("#year").blur(function(){
		var r = /[0-9]{4}/;
		if(r.test($(this).val()) == false) {
			$("#ywrg").html("<div align=\"left\ style=\"padding-left: 7px;\">태어난 년도를 정확히 입력해주세요!</div>")
		}
	});
	
	$("#month").blur(function(){
		var r = /[0-9]/;
		if(r.test($(this).val()) == false) {
			$("#ywrg").html("<div align=\"left\ style=\"padding-left: 7px;\">태어난 달을 정확히 입력해주세요!</div>")
		}
	});
	
	$("#day").blur(function(){
		var r = /[0-9]{1,2}/;
		if(r.test($(this).val()) == false) {
			$("#ywrg").html("<div align=\"left\ style=\"padding-left: 7px;\">태어난 날짜를 정확히 입력해주세요!</div>")
		}
	});
</script>