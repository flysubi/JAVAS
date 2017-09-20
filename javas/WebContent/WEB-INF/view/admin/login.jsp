<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
b {
	font-size: 16pt;
}
</style>



	<div style="margin-top: 100px;"></div>
	<div align="center" class="row">
		<div class="col-ss-0 col-sm-4"></div>
		<div class="col-ss-12 col-sm-4">
			<div class="form-group">
				<form action="/admin/loginResult.jv" class="form-signin"
					method="post">
					<!-- 컨트롤러로 보냄 -->
					<div class="input-group">
						<div class="form-group">
							<input type="text" class="form-control" name="id" id="jid"
								placeholder="아이디" required="required"
								style="width: 73%; height: 50px;"> <input
								type="password" class="form-control" name="pass"
								placeholder="비밀번호" required="required"
								style="width: 73%; height: 50px;">
							<button type="submit" class="btn bnt-default" 
								style="background-color: Plum; color: white; font-weight: 900; height: 100px; width: 27%; font-size: 16px;">로그인</button>
						</div>
						<c:if test="${lfalse ne null }">
							<span style="color: red; float: left;">아이디 또는 비밀번호가 잘못되었습니다.</span><br/><span style="color: red; float: left; padding-bottom: 5px;">다시
							확인해주시기 바랍니다.<br/></span>
						</c:if>
						</div>
						<span style="float: left;">
							<input type="checkbox" name="keep" />로그인 상태 유지
						</span>
					<span style="float: right;">
						<a href="/user/findUser.jv">아이디/비밀번호 찾기</a>
					</span>
				</form>
			</div>
		</div>
		<div class="col-ss-0 col-sm-4"></div>
	</div>
