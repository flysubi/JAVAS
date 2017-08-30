<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
b {
	font-size: 16pt;
}
</style>
<div align="center" class="row" style="margin-top: 100px;">
	<div class="col-ss-0 col-sm-4"></div>
	<div class="col-ss-12 col-sm-4">
		<div class="form-group">
			<form action="/user/findResult.jv" class="form-signin"  method="post">
				<!-- 컨트롤러로 보냄 -->
				<h3 class="form-signin-heading">아이디 찾기</h3>
				<div class="form-group">
					<label for="email"><b>Email</b></label><br /> <input type="email"
						class="form-control" name="email" placeholder="찾고자하는 이메일을 입력해주세요."
						required="required"><br /> 
				</div>
				
				<button type="submit" class="btn bnt-default">아이디 찾기</button>
			</form>
		</div>
	</div>
	<div class="col-ss-0 col-sm-4"></div>
	</div>
</body>
</html>