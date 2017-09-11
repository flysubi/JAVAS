<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center"  class="row" style="margin-top: 100px;">
	<h3>회원가입을 환영합니다!</h3><br/>

	<p>
		이제 마지막으로 이메일 인증 절차가 남아있습니다.<br/>
		당신의 이메일로 링크를 첨부하였으니,<br/>
		클릭하시면 회원가입이 완료됩니다!<br/><br/>
		
		<b>※ 페이지를 벗어나지 말아주세요 ※<br/>(5분안에 인증하셔야 정상적으로 인증이 완료됩니다.)</b>
	</p>
</div>
<script>
var ws = new WebSocket("wss://${ip }/ws/join.ws")
	ws.onmessage = function(e) { // 서버측에서 메세지를 받을 때 해야할 일
	if(e.data == "true") {
			location.href="/user/success.jv";
		}else {
			location.href="/user/fail.jv";
		}
	};
</script>
