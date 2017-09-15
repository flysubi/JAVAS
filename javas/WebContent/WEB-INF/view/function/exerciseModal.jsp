<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 칼로리 modal -->
<div class="modal-header" style="padding: 35px 50px;" id="myModal">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>
		<span class="glyphicon glyphicon-scissors"></span> 운동을 기록하세요
	</h4>
</div>

<div class="modal-body" style="padding: 40px 50px;">
	<form action="/function/exerciseModalExec.jv" method="post">
		<div class="input-group" style="padding-top: 10px;">
			<span class="input-group-addon">운동종류</span> <select
				class="form-control" name="sort" id="sort">
				<option>오늘의 운동을 선택해주세요.</option>
				<c:forEach var="i" items="${list}">
					<option>${i.SORT}</option>
				</c:forEach>
			</select>
		</div>
		<div class="input-group" style="padding-top: 10px;">
			<span class="input-group-addon">몸무게</span> <select
				class="form-control"  id="kgg" name="kg">
				<option>자신에 맞는 몸무게를 선택해주세요.</option>
			</select>
		</div>
		<div class="input-group">
			<span class="input-group-addon">운동량(분)</span> <input type="number"
				class="form-control " id="cnt" name="cnt" /> <span
				class="input-group-addon" style="width: 52px;">Minute</span> <input
				type="text" class="form-control " id="kcal" name="cal" placeholder="분"
				readonly />
		</div>
		<div class="input-group" id="div" style="padding-top: 10px;">
			<span class="input-group-addon">운동명</span> <input type="text"
				class="form-control " name="sort" /> <span class="input-group-addon"
				style="width: 52px;">Minute</span> <input type="number"
				class="form-control "  name="kcal" placeholder="분당 칼로리" />
		</div>
		<div class="row" style="padding-top: 10px;">
			<div class="col-sm-6">
				<button type="button" class="btn btn-default btn-block" id="add">
					<span class="glyphicon glyphicon-plus" style="color: red;"></span>
					운동 추가하기
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
	오늘 총 소비 Kcal : <span id="total">${map.totalCal eq null ? 0 : map.totalCal}</span>Kcal
</div>

<script>
	$("#sort").on("change", function() {
		$.ajax({
			url : "/function/exerciseModalAjax.jv",
			data : {
				"sort" : $("#sort").val(),
			}
		}).done(function(rst) {
			console.log(rst);
			$("#kgg").empty();
			$("#kgg").append("<option>자신에 맞는 몸무게를 선택해주세요.</option>");
			for (var i = 0; i < rst.length; i++) {
				$("#kgg").append("<option>" + rst[i].KG + "</option>");
			}
		});
	});

	$("#kgg").on("change", function() {
		$.ajax({
			url : "/function/exerciseModalAjax.jv",
			data : {
				"kg" : $("#kgg").val(),
				"sort" : $("#sort").val(),
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
	$("#cnt").on("change", function() {

	});

	$(document).ready(function() {
		$.ajax({
			url : "/function/exerciseTotalAjax.jv",
		}).done(function(rst) {
			$("#total").html(rst[0].total);
		});
		$("#div").hide();
		$("#add").click(function() {
			$("#kgg").prop("disabled", !$("#kgg").prop("disabled"));
			$("#sort").prop("disabled", !$("#sort").prop("disabled"));
			$("#cnt").prop("disabled", !$("#cnt").prop("disabled"));
			$("#div").toggle();
		});
	});
</script>
