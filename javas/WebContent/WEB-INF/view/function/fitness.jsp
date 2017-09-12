<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>

<div class="col-xs-4 col-md-4">
	<h3 align="center">MY FITNESS</h3>
	<form action="/function/fitnessExec.jv" method="post">
		<div class="input-group">
			<span class="input-group-addon">활동지수</span> <select
				class="form-control" name="active" style="width: 270px;">
				<option>가벼운 활동</option>
				<option>보통 활동</option>
				<option>심한 활동</option>
			</select>
		</div>
		<div class="input-group" style="padding-top: 10px;">
			<span class="input-group-addon" style="width: 81px;">신장 cm</span> <input
				type="number" id="cm" class="form-control " name="cm"
				placeholder="신장 cm" /> <span class="input-group-addon">체중 kg</span><input
				type="number" id="kg" class="form-control " name="kg"
				placeholder="체중 kg" />
		</div>
		<div class="form-group" align="center" style="padding-top: 10px;">
			<button type="submit" class="form-control" style="width: 100px;">저장하기</button>
		</div>
	</form>
	<h3 align="center">MY FIT_INFO</h3>
	<div>
		<table>
			<tr>
				<td>표준 체중</td>
				<td>${map.SW }</td>
			</tr>
			<tr>
				<td>하루 권장 칼로리</td>
				<td>${map.AC }</td>
			</tr>
			<tr>
				<td>BMI</td>
				<td>${map.BMI }</td>
			</tr>
		</table>

	</div>

</div>

<div class="col-xs-4 col-md-4">
	<h3 align="center">오늘의 식단</h3>
</div>
<div class="col-xs-4 col-md-4">
	<h3 align="center">****</h3>
</div>

<script>
	$(document).ready(function() {
		$('#cm').on('keyup', function() {
			if ($(this).val().length > 3) {
				$(this).val($(this).val().substring(0, 3));
			}
		});
		$('#kg').on('keyup', function() {
			if ($(this).val().length > 3) {
				$(this).val($(this).val().substring(0, 3));
			}
		});
	});
</script>