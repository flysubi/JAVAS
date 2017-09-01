<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn {
    border: none;
    color: white;
    font-size: 15px;
    cursor: pointer;
}
.bt {
	background-color: white; 
	color: black;
	 border : 1px solid gray;
}
</style>
<div style="padding-bottom: 10px;">
<div class="input-group" style="padding-bottom: 15px; padding-top: 15px;">
</div>
<c:if test="${result ne null }">
	<div class="alert alert-danger">
				<b>보내기실패</b> 당신의 요청을 처리할수 없어요.
		</div>
</c:if>
	<form action="/memo/sendExec.jv" method="post">
		<div class="form-group">
			<input type="text" value="${!empty target ? target : ''}" placeholder="받는이" class="form-control" id="reciver" name="reciver" required="required">
		</div>
		<p id="cid"></p>
		<div class="form-group">
			<textarea class="form-control" rows="5" id="ta" name="ta" required="required" placeholder="내용"></textarea>
		</div>
		<button id="bnt" type="submit" class="btn bt" style="width: 40%" disabled>보내기</button>
	</form>
</div>

<script>
	document.getElementById("reciver").onblur = function(){
		var val = this.value;
		var req = new XMLHttpRequest();
		req.onreadystatechange = function(){
			if (val.length > 3) {
				if (req.readyState == 4) {
					if (this.responseText != "true") {
						document.getElementById("cid").innerHTML = "<b>예, 가능합니다</b>";
						document.getElementById("bnt").disabled = false;
					}else{
						document.getElementById("cid").innerHTML = "<b>이런 아이디 없어요</b>";
						document.getElementById("bnt").disabled = true;
					}
				}
			}
		}
		req.open("get", "/user/idCheck.choc?id=" + val, true);
		req.send();
	}
</script>