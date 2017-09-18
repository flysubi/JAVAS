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
<div class="col-xs-12 col-md-6">
	<div style="padding-bottom: 10px;">
		<div class="input-group"
			style="padding-bottom: 15px; padding-top: 15px;"></div>

		<form action="/memo/writeExec.jv" method="post">
			<div class="form-group" align="left">
				<button id="bnt" type="submit" class="btn bt" style="width: 20%">보내기</button>
			</div>
			<div class="form-group" align="left">
				<label>받는 사람</label> <input type="checkbox" id="target"
					name="target" ${my eq null ? '' : 'checked'}>내게 쓰기 <input
					type="text" placeholder="받는이" id="receiver"
					value=<c:choose>
						<c:when test="${w ne null }">"${w}"</c:when>
						<c:when test="${my ne null}">"${my}"</c:when>
						<c:otherwise>""</c:otherwise>
					</c:choose>
					name="receiver" required="required" class="form-control">
			</div>
			<p id="cid"></p>
			<div class="wrap">
				<textarea id="ta" name="ta" class="form-control" rows="10" placeholder="내용"></textarea>
				<span id="counter"></span>
			</div>

		</form>
	</div>
</div>


<script>
	$("#target").on("change", function() {
		if ($("#target").is(":checked")) {
			$("#receiver").val("${sessionScope.auth}");
		} else {
			$("#receiver").val("");
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