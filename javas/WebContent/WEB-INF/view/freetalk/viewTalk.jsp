<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.well {
	background: white;
}
</style>
<!-- <div class="well"> -->
<h3 style="text-align: left; padding-left: 200px;">
${sessionScope.map.TITLE}
<c:if test="${sessionScope.map.WRITER eq sessionScope.auth }">
	<a href="/freetalk/talkDel.jv?num=${sessionScope.map.NUM}">X</a>
</c:if>
</h3>
<p style="text-align: left; padding-left: 200px; font-size: 12pt;">
	작성자 : ${sessionScope.map.WRITER }
	<button type="submit" class="btn btn-danger btn-xs" id="like"
		value="${sessionScope.map.NUM }">♡</button>
	| 작성일 :
	<fmt:formatDate value="${sessionScope.map.WRITEDATE}"
		pattern="yy-MM-dd" />
	<c:choose>
		<c:when test="${sessionScope.map.DIFF lt 1}">
			<c:choose>
				<c:when test="${sessionScope.map.DIFF * 1440 gt 60}">
					<small><fmt:formatNumber
							value="${sessionScope.map.DIFF * 24}" pattern="#,###" />시간 전</small>
				</c:when>
				<c:otherwise>
					<small><fmt:formatNumber
							value="${sessionScope.map.DIFF * 1440}" pattern="#,###" />분 전</small>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${sessionScope.map.DIFF lt 365}">
			<small><fmt:formatNumber value="${sessionScope.map.DIFF}"
					pattern="#,###" />일 전</small>
		</c:when>
		<c:otherwise>
			<small><fmt:formatNumber
					value="${sessionScope.map.DIFF div 365}" pattern="#,###" />년 전</small>
		</c:otherwise>

	</c:choose>
</p>
<div class="col-xs-0 col-md-2"></div>
<div class="col-xs-12 col-md-8">
	<pre style="background-color: white; text-align: left; border-color: white;">${sessionScope.map.CONTENT}</pre>
</div>
<div class="col-xs-0 col-md-2"></div>
<hr style="background-color:silver; height: 1px; width: 65%"/>
	<p style="text-align: left; padding-left: 200px;">댓글</p>
<div class="col-xs-0 col-md-2"></div>
<div class=" well col-xs-12 col-md-8">
	<div id="list"></div>
	<div class="form-group">
		<textarea rows="2" cols="70"
			style="vertical-align: bottom; height: 60;" class="input-control"
			id="comment" name="content" placeholder="내용을 입력해주세요."></textarea>
		<button id="suc" type="submit" class="btn btn-default"
			style="height: 60;">등록</button>
	</div>
</div>
<div class="col-xs-0 col-md-2"></div>
<script>
	var list = function() {
		$
				.ajax({
					url : "/freetalk/commentsAjax.jv",
					data : {
						"num" : "${param.num}",
					}
				})
				.done(
						function(rst) {
							console.log(rst);
							var table = "";
							for (var i = 0; i < rst.length; i++) {
								table += "<p style=\"text-align: left; padding-left:80px;\"><b>"
										+ rst[i].WRITER
										+ "</b> | "
										+ rst[i].FC
										+ "</br>";
								table += rst[i].CONTENT + "</p>"
								table += "<hr style=\"background-color:silver; height: 1px; width: 80%\"/>";
							}
							$("#list").html(table);
						});
		$("#comment").val("");
	}
	list();

	$("#suc").on("click", function() {
		$.ajax({
			url : "/freetalk/commentsAjax.jv",
			data : {
				"content" : $("#comment").val(),
				"num" : "${sessionScope.map.NUM }",
			}
		}).done(function() {
			list();
			$("#comment").val("");
		});
	});
</script>

<script>
	$("#like").on("click", function() {
		$.ajax({
			url : "/freetalk/loveAjax.jv",
			data : {
				"num" : this.value,
			}
		}).done(function(rst) {
			if (rst.result) {
				window.alert("추천 성공");
			} else {
				window.alert("추천 실패\n이미 추천이 되어있는 글입니다.");
			}
		});
	});
</script>

