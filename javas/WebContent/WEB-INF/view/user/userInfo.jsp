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
				<form action="/user/infoResult.jv" class="form-signin" method="post">
					<div class="form-group" >
						<div class="input-group">
    				<span class="input-group-addon">아이디</span>
						<input type="text"
							class="form-control" name="id" id="id" value="${map.ID }" readonly="readonly">
							</div>
						<input
							type="password" class="form-control" name="pass" id="pass"
							placeholder="현재 비밀번호" required="required">
						<input
							type="password" class="form-control" name="npass" id="npass"
							placeholder="새 비밀번호">
						<input
							type="password" class="form-control" id="cpass"
							placeholder="새 비밀번호 확인">
							<span id="pwrg" style="color: red; float: left;"></span>
						<div class="input-group">
    				<span class="input-group-addon">이메일</span>
						<input type="email"
							name="email" id="jemail" class="form-control"
							value="${map.EMAIL }" required="required">
							</div>
						<span id="ecor" style="color: green; float: left;"></span> <span id="ewrg"
							style="color: red; float: left;"></span>
					</div>
					<br/>
					<div class="form-group" >
					<div class="input-group">
    				<span class="input-group-addon">이름</span>
					<input type="text"
							class="form-control" name="name"
							value="${map.NAME }">
					</div>
					 <div class="input-group">
    				<span class="input-group-addon">생일</span>
    				<input id="year" type="text" class="form-control" name="year" placeholder="년(4자)" 
    					style="width: 40%;" maxlength="4" value="${map.YEAR }">
    				<select class="form-control" name="month" id="month" style="width: 30%;">
    					<option ${map.month eq null ? 'selected' : '' }>월</option>
    					<c:forEach begin="1" step="1" end="12" var="i">
    						<option value="${i }" ${map.MONTH eq i ? 'selected' : '' }>${i }</option>
    					</c:forEach>
    				</select>
    				<input id="day" type="text" class="form-control" name="day"  maxlength="2" placeholder="일" value="${map.DAY }" style="width: 30%;">
    				</div>
    				<span id="ywrg"
							style="color: red; float: left;"></span><br/>
					<label class="radio-inline" style="font-size: 20px;"><input type="radio" name="gender" value="남" ${map.GENDER eq '남' ? 'checked' : '' } style="height: 20px; width: 20px;"> 남성</label>
					<label class="radio-inline" style="font-size: 20px;"><input type="radio" name="gender" value="여" ${map.GENDER eq '여' ? 'checked' : '' } style="height: 20px; width: 20px;"> 여성</label>
					</div>
					<c:if test="${map.VOICE ne 0 }">
					<div style="font-size: 20px;">
					알림 voice
					</div>
					<div>			
					<label class="radio-inline" style="font-size: 20px;"><input type="radio" name="voice" value="1" ${map.VOICE eq 1 ? 'checked' : '' } style="height: 20px; width: 20px;"> 남</label>
					<label class="radio-inline" style="font-size: 20px;"><input type="radio" name="voice" value="2" ${map.VOICE eq 2 ? 'checked' : '' } style="height: 20px; width: 20px;"> 여</label>
					</div>
					</c:if>
					<button type="submit" class="btn bnt-default" id="save" style="background-color: LightSkyBlue; color: white; font-weight: 900; width: 49%;">저장하기</button>
					<button type="reset" class="btn bnt-default" style="background-color: LightSkyBlue; color: white; font-weight: 900;  width: 49%;">다시작성</button>
				</form>
			</div>
		</div>
		<div class="col-ss-0 col-sm-4"></div>
	</div>
</body>
</html>
<script>
	$("#jemail").blur(function(){
		var email = this.value;
		if (email.trim().length > 0 && (email != "${map.EMAIL}")) {
			$.ajax({
				url : "/user/emailCheckAjax.jv",
				data : {
					"email" : email
				}
			}).done(function(rst){
				if(rst == true) {
					$("#ecor").html("");
					$("#ewrg").html("<div align=\"left\ style=\"padding-left: 7px;\">이미 등록된 이메일입니다.</div>");
					$("#save").attr("disabled", true);	
				}else {
					$("#ecor").html("<div align=\"left\" style=\"padding-left: 7px;\">멋진 이메일이네요!</div>");
					$("#ewrg").html("");
					if($("#pwrg").html().trim().length == 0) {
						$("#save").attr("disabled", false);	
					}
				}
			})
		}	
	});
	$("#npass").blur(function(){
		if($("#cpass").val().trim().length == 0) {
			$("#save").attr("disabled", true);
		}
	});
	
	$("#cpass").blur(function(){
		var pass = $("#npass").val();
		var cpass = this.value;
		if(cpass.length == 0 && pass.length == 0) {
			$("#save").attr("disabled", false);
		}
		if (cpass.length > 0) {
			if(pass != cpass) {
				$("#pwrg").html("<div align=\"left\" style=\"padding: 7px;\">비밀번호가 일치하지 않습니다.</div>");
				$("#save").attr("disabled", true);	
			}else {
				$("#pwrg").html("");
				if($("#ewrg").html().length == 0) {
					$("#save").attr("disabled", false)	;			
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