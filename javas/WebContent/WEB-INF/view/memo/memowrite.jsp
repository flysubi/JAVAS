<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn {
	border: none;
	color: white;
	font-size: 17px;
	family-font
	cursor: pointer;
	width: 20px;
	height: 30px;
}

.bt {
	background-color: white;
	color: black;
	border: 1px solid gray;
}

.wrap {
	width: 450px;
	height: auto;
	position: absolute;
	left: 11px;
	display: inline-block;
}

.wrap textarea {
	width: 100%;
	resize: both;
	min-height: 200px;
	line-height: 1.6em;
	max-height: 1000px;
	left: 0px;
}

.wrap span {
	position: absolute;
	bottom: 5px;
	right: 5px;
}

#counter {
	background: rgba(255, 0, 0, 0.5);
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}
</style>

<div class="col-xs-0 col-md-1"></div>
<div class="col-xs-12 col-md-10">
	<div style="padding-bottom: 10px;">
		<div class="input-group"
			style="padding-bottom: 15px; padding-top: 15px;"></div>

		<form action="/memo/writeExec.jv" method="post">
			<div class="form-group" align="left">
				<button id="bnt" type="submit" class="btn bt" style="width: 10%">보내기</button>
			</div>
			<div class="form-inline" align="left">
				<label>받는 사람&nbsp;&nbsp;</label></label><label><input
					type="checkbox" id="target" name="target" >&nbsp;내게
					쓰기</label>&nbsp;&nbsp; <input type="text" placeholder="받는이" class="form-control"
					id="receiver" name="receiver" required="required" style="width: 40%;">
			</div>
			<p id="cid"></p>
			<div class="wrap">
				<textarea id="ta" name="ta" placeholder="내용"></textarea>
				<span id="counter"></span>
			</div>

		</form>
	</div>
</div>

<script>
	$("#target").on("change", function() {
		if ($("#target").is(":checked")) {
			document.getElementById("receiver").value = "${sessionScope.auth}";
		} else {
			document.getElementById("receiver").value = "";
		}
	});

	$(document).ready(function() {
		$('#ta').on('keyup', function() {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/1000');
			if ($(this).val().length > 1001) {
				$(this).val($(this).val().substring(0, 1000));
				window.alert("1000자까지만 입력이 가능합니다");
			}
		});

	});
</script>