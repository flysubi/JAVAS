<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<style type="text/css">
.form-control {
	height: 50px;
}
</style>
<title>회원탈퇴</title>
</head>
<body>
	<div>
	</div>
		<div align="left" style="margin-left: 120px;">
		<h3>탈퇴 안내</h3>
		<i class="fa fa-check"></i> 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br/><br/>
		<b>사용하고 계신 아이디(${id })는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</b><br/>
		<span style="color: #ff6000;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구</span>가 불가하오니 신중하게 선택하시기 바랍니다.<br/><br/><br/>
		<i class="fa fa-check"></i> <b>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</b><br/></br>
		회원정보 및 포인트, 메세지, 구매목록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br/>
		삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br/><br/><br/>
		<i class="fa fa-check"></i> <b>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</b><br/></br>
		공유게시판, Q&A등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br/>
		삭제를 원하는 게시글이 있다면 <span style="color: #ff6000;">반드시 탈퇴 전 삭제하시기 바랍니다.</span><br/> 
		탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.<br/><br/><br/>
		</div>
	<div align="center" class="row">
		<div class="col-ss-0 col-sm-4"></div>
		<div class="col-ss-12 col-sm-4">
			<div class="form-group">
				<form action="/user/deleteResult.jv" class="form-signin" method="post">
					<div class="form-group" >
						<input
							type="password" class="form-control" name="pass"
							placeholder="현재 비밀번호를 다시 한번 입력해주세요." required="required">
					</div>
					<button type="submit" class="btn bnt-default" id="save" style="background-color: LightSkyBlue; color: white; font-weight: 900; width: 100%;">계정삭제</button>
				</form>
			</div>
		</div>
		<div class="col-ss-0 col-sm-4"></div>
	</div>
</body>
</html>