<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
p {
	/* 	 margin: 14pt; */
	
}
</style>
<div class="w3-row" style="padding-top: 10px;">
	<div class="w3-col m2 w3-center">
		<a href="javascript:itemSelect('calendar')" id="calendar3"><img src="/style/store/캘린더.png" id="calendar2"></img></a>
		<p style="padding-top: 10px;"> 
			캘린더<br />200P
		</p>
	</div>
	<div class="w3-col m2 w3-center">
		<a href="javascript:itemSelect('fitness')" id="fitness3"><img src="/style/store/건강.png" id="fitness2"></img></a>
		<p style="padding-top: 10px;">
			건강<br />200P
		</p>
	</div>
	<div class="w3-col m2 w3-center">
		<a href="javascript:itemSelect('asset')" id="asset3" onclick="return false;"><img src="/style/store/asset.png" id="asset2"></img></a>
		<p style="padding-top: 10px;">
			자산관리<br />* 캘린더 구매자만 가능<br/>200P
		</p>
	</div>
	<div class="w3-col m2 w3-center">
		<a href="javascript:itemSelect('voice')" id="voice3"><img src="/style/store/보이스.png" id="voice2"></img></a>
		<p style="padding-top: 10px;">
			보이스<br />200P
		</p>
	</div>
	<div class="w3-col m2 w3-center">
		<a href="javascript:itemSelect('double')" id="double3"><img src="/style/store/더블패키지.png" id="double2"></img></a>
		<p style="padding-top: 10px;">
			더블 패키지<br/>캘린더 + 자산관리<br />300P
		</p>
	</div>
	<div class="w3-col m2 w3-center">
		<a href="javascript:itemSelect('full')" id="full3" ><img src="/style/store/풀패키지.png" id="full2"></img></a>
		<p style="padding-top: 10px;">
			풀 패키지<br/>모든 기능<br />500P
		</p>
	</div>
</div>

<div class="row">
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10" align="left"
		style="padding-top: 70px;">
		<p style="font-size: 16px;">
			비용 <b style="color: orange;">결제</b>
		</p>
		<p style="color: orange;">* 구매하실 품목과 포인트를 확인하시고, 아래 구매수단을 선택해주세요!</p>
		<p style="color: orange;">(만약, 품목과 포인트가 보이지 않는다면, 자바스에게 문의해주세요.)</p>
		<form action="/store/itemBuy.jv">
			<div class="w3-row">
				<div class="w3-col s2 w3-center" style="padding-top: 8px;">
					<p style="text-align: left;">구매할 품목</p>
				</div>
				<div class="w3-col s4 w3-center">
					<p>
						<select class="w3-select w3-border" name="item" id="item">
							<option id="basic" disabled selected>구매할 품목</option>

							<option value="calendar" id="calendar"
								${"calendar" eq param.category ? 'selected' : ''}>캘린더</option>
							<option value="fitness" id="fitness"
								${"fitness" eq param.category ? 'selected' : ''}>건강</option>
							<option value="asset" id="asset"
								${"asset" eq param.category ? 'selected' : ''} disabled>자산관리</option>
							<option value="voice" id="voice"
								${"voice" eq param.category ? 'selected' : ''}>보이스</option>
							<option value="double" id="double"
								${"double" eq param.category ? 'selected' : ''}>더블패키지</option>
							<option value="full" id="full"
								${"full" eq param.category ? 'selected' : ''}>풀패키지</option>
						</select>
					</p>
				</div>
				<div class="w3-row">
					<div class="w3-col s2 w3-center" style="padding-top: 8px;">
						<p style="text-align: left;">차감할 포인트</p>
					</div>
					<div class="w3-col s4 w3-center">
						<p>
							<input type="text" class="w3-input w3-border" value="0P"
								style="text-align: right;" disabled id="text1"/>
						</p>
					</div>
				</div>
				<div class="w3-row">
					<div class="w3-col s2 w3-center" style="padding-top: 8px;">
						<p style="text-align: left;">남은 포인트</p>
					</div>
					<div class="w3-col s4 w3-center">
						<p>
							<input type="text" class="w3-input w3-border"
								style="text-align: right;" disabled id="text2"/>
						</p>
					</div>
				</div>
			</div>
			<hr />
			<button class="w3-btn w3-ripple w3-white w3-block w3-border">구매하기</button>
		</form>
	</div>
</div>

<script>
var pSet = function item() {
	var item =$("#item").val(); 
	var point = "${point}";
	if( item== 'full') {
		$("#text1").val("500P");
		$("#text2").val((point-500)+"P");
	} else if ( item == 'double') {
		$("#text1").val("300P");
		$("#text2").val((point-300)+"P");
	} else { 
		$("#text1").val("200P");
		$("#text2").val((point-200)+"P");
	}
}
$("#item").on("change", function() {
	pSet();
});

$(document).ready(function() {
	$("#text2").val("${point}P");
	$.ajax({
		"url" : "/store/itemBuyAjax.jv" 
	}).done(function(rst) {
		if(rst != null) {
			for (var i = 0; i < rst.length; i++) {
				if(rst[i] == "calendar") {
					$("#asset").prop("disabled", false); 
					$("#asset2").attr("src","/style/store/자산관리.png");
					$("#asset3").attr("onclick","return true;"); //a태그 비활성화
				} 
					$("#"+rst[i]).prop("disabled", true);
					$("#"+rst[i]+"2").attr("src","/style/store/"+rst[i]+".png");
					$("#"+rst[i]+"3").attr("onclick","return false;"); //a태그 비활성화
				}
			}
		});
});

function itemSelect(item) {
// 	window.alert("작동");
	$("#fitness").attr("selected",false); //a태그 비활성화
	$("#calendar").attr("selected",false); //a태그 비활성화
	$("#asset").attr("selected",false); //a태그 비활성화
	$("#voice").attr("selected",false); //a태그 비활성화
	$("#full").attr("selected",false); //a태그 비활성화
	$("#double").attr("selected",false); //a태그 비활성화
	
	$("#"+item).attr("selected", true);
	pSet();
}

</script>