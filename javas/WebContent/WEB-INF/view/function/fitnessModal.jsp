<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 칼로리 modal -->
<div class="modal-header" style="padding: 35px 50px;" id="myModal">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>
		<span class="glyphicon glyphicon-cutlery"></span> 식사를 기록하세요
	</h4>
</div>

<div class="modal-body" style="padding: 40px 50px;">
	<form action="/function/fitnessModalExec.jv" method="post">
		<div class="input-group" style="padding-top: 10px;">
			<span class="input-group-addon">음식종류</span> <select
				class="form-control" name="sort" id="sort">
				<option>음식종류를 선택해주세요.</option>
				<c:forEach var="i" items="${list}">
					<option>${i.SORT}</option>
				</c:forEach>
			</select>
		</div>
		<div class="input-group" style="padding-top: 10px;">
			<span class="input-group-addon">음식명</span> <select
				class="form-control" name="name" id="name">
				<option>음식명을 선택해주세요.</option>
			</select>
		</div>
		<div class="input-group">
			<span class="input-group-addon">음식양(개/인분)</span> <input type="number"
				class="form-control " id="cnt" name="cnt" /> <span
				class="input-group-addon" style="width: 52px;">Kcal</span> <input
				type="text" class="form-control " id="kcal" name="cal" placeholder="개/인분당"
				readonly />
		</div>
		<div class="input-group" id="div" style="padding-top: 10px;">
			<span class="input-group-addon">음식명</span> <input type="text"
				class="form-control " name="name" /> <span class="input-group-addon"
				style="width: 52px;">Kcal</span> <input type="number"
				class="form-control "  name="kcal" placeholder="Kcal" />
		</div>
		<div class="row" style="padding-top: 10px;">
			<div class="col-sm-6">
				<button type="button" class="btn btn-default btn-block" id="add">
					<span class="glyphicon glyphicon-plus" style="color: red;"></span>
					음식 추가하기
				</button>
			</div>
			<div class="col-sm-6">
				<button type="submit" class="btn btn-default btn-block">
					<span class="glyphicon glyphicon-ok" style="color: blue;"></span>
					확인
				</button>
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	오늘 총 Kcal : <span id="total">${map.totalCal eq null ? 0 : map.totalCal}</span>Kcal
</div>

<script>
	$("#sort").on("change", function() {
		$.ajax({
			url : "/function/fitnessModalAjax.jv",
			data : {
				"sort" : $("#sort").val(),
			}
		}).done(function(rst) {
			console.log(rst);
			$("#name").empty();
			$("#name").append("<option>음식명을 선택해주세요.</option>");
			for (var i = 0; i < rst.length; i++) {
				$("#name").append("<option>" + rst[i].NAME + "</option>");
			}
		});
	});

	$("#name").on("change", function() {
		$.ajax({
			url : "/function/fitnessModalAjax.jv",
			data : {
				"name" : $("#name").val(),
			}
		}).done(function(rst) {
			console.log(rst);
			var kcal = "";
			for (var i = 0; i < rst.length; i++) {
				kcal += rst[i].kcal;
			}
			console.log(kcal);
			$("#kcal").val(kcal);
		});
	});

	$(document).ready(function() {
		$.ajax({
			url : "/function/totalAjax.jv",
		}).done(function(rst) {
			$("#total").html(rst[0].total);
		});
		$("#div").hide();
		$("#add").click(function() {
			$("#name").prop("disabled", !$("#name").prop("disabled"));
			$("#sort").prop("disabled", !$("#sort").prop("disabled"));
			$("#cnt").prop("disabled", !$("#cnt").prop("disabled"));
			$("#div").toggle();
		});
	});
</script>
