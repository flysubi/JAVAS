<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.well {
	background: white;
	border-radius: 0px;
	margin-top: 15px;
}

.w3-border {
	border: 0px solid #ccc !important;
}
</style>
<div class="well row ">
	<div class="row">
		<div class="col-xs-6 col-md-6">
			<h3 style="text-align: left; padding-left: 200px;">
				${sessionScope.map.TITLE}
				<c:if test="${sessionScope.map.WRITER eq sessionScope.auth }">
					<a href="/freetalk/talkDel.jv?num=${sessionScope.map.NUM}"
						style="color: red;"><span class="glyphicon glyphicon-remove"></span></a>
				</c:if>

			</h3>
		</div>
		<c:if test="${sessionScope.map.FILENAME ne null}">
			<div class="col-xs-6 col-md-6">
				<h3 align="right" style="padding-right: 250px;">
					<a href="/freetalk/down.jv?n=${param.num}"> <span
						class="glyphicon glyphicon-download-alt"></span>
					</a>
				</h3>
			</div>
		</c:if>
	</div>
	<p style="text-align: left; padding-left: 200px; font-size: 12pt;">
		작성자 : ${sessionScope.map.WRITER } | 작성일 :
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
		<button type="submit" class="btn" id="like"
			value="${sessionScope.map.NUM }"
			style="color: red; background-color: white; font-size: 10pt; padding-left: 3; padding-right: 3; padding-bottom: 1; padding-top: 0; border: 1px solid gray;">
			<c:choose>
				<c:when test="${b}">♥</c:when>
				<c:otherwise>♡</c:otherwise>
			</c:choose>
			<span style="color: black;">${love}</span>
		</button>
	</p>

	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
		<pre
			style="background-color: white; text-align: left; border-color: white; font-family: HelveticaNeue, '나눔바른고딕', NanumBarunGothic, AppleSDGothicNeo-Regular, sans-serif;">${sessionScope.map.CONTENT}</pre>
	</div>
	<div class="col-xs-0 col-md-2"></div>
	<hr
		style="background-color: silver; height: 1px; width: 65%; margin-left: 17%; margin-right: 17%;" />
	<p style="text-align: left; padding-left: 200px;">
		댓글
		<c:if test="${CNT ne null }">
			<b style="color: orange;">${CNT }</b>
		</c:if> 
	</p>
	<div class="row">
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
	</div>
	<div class="col-xs-0 col-md-2"></div>
	<div class=" col-xs-12 col-md-8" align="right">
		<button class="w3-btn w3-ripple w3-white w3-border">목록</button>
	</div>
	<div class="col-xs-0 col-md-2"></div>
</div>
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
										+ rst[i].WRITER + "</b> | " + rst[i].FC;
								if (rst[i].WRITER == ("${sessionScope.auth}")) {
									table += " <a href=\"javascript:commDel("
											+ rst[i].NUM
											+ ",'"
											+ rst[i].WRITER
											+ "')\" style=\"color: red;\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
								}
								table += "<br/>";
								table += rst[i].CONTENT + "</p>"
								table += "<hr style=\"background-color:silver; height: 1px; width: 80%;  margin-left: 10%; margin-right: 1	0%;\"/>";
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

	function commDel(num, writer) {
		$.ajax({
			url : "/freetalk/commDel.jv",
			data : {
				"num" : num,
				"writer" : writer,
			}
		}).done(function() {
			list();
		});
	}

	$("#like").on(
			"click",
			function() {
				$.ajax({
					url : "/freetalk/loveAjax.jv",
					data : {
						"num" : this.value,
						"writer" : " ${sessionScope.map.WRITER }",
					}
				}).done(
						function(rst) {
							if (rst.result) {
								window.alert("추천 성공");
								$("#like").html(
										"♥ <span style=\"color: black;\">"
												+ rst.cnt + "</span>");
							} else {
								window.alert("추천 실패\n이미 추천이 되어있는 글입니다.");
							}
						});
			});

		$('#allVeiw').on('click', function() {
		location.href='/freetalk/allTalks.jv';
	});
		
</script>

