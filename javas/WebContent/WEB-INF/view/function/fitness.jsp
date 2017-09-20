<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<jsp:useBean id="toDay" class="java.util.Date" />
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
.font {
/* 	font-family: 나눔바른펜;  */
}
img {
    vertical-align: baseline;
}
a:HOVER {
	color: gray;
}
</style>
<div class="font">
<div align="left" style="padding-top: 15px;">
	<h3>    
		<fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" />  
	</h3> 
</div>

<!-- 그래프 Modal --> 
<div id="modal-testNew3" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 900px; height: 700px">
		<div id="modal-content3" class="modal-content"></div>
	</div>
</div>

<div class="col-xs-4 col-md-4">
<div align="center" style="padding-top: 15px; padding-left: 47px;">
	<span style="font-size: 20pt;"  >    
		오늘의 체중
	</span>  
		<a href="javascript:graph()" >
		<img align="top" src="/icon/graph2.png" onmouseover="this.src='/icon/graph.png'" onmouseout="this.src='/icon/graph2.png'"></img>
		</a>
</div>
	<c:if test="${map.AC eq null }">
		<b style="color: red;">Fitness 정보를 입력해주세요.</b>
	</c:if>
	<form action="/function/fitnessExec.jv" method="post">
		<div class="input-group" style="padding-top: 20px;">
			<span class="input-group-addon" style="width: 81px;">신장 cm</span> <input
				type="number" id="cm" class="form-control " name="cm"
				style="width: 100px;" placeholder="신장 cm"
				value="${map.HEIGHT eq null ? '' : map.HEIGHT}" /> <span
				class="input-group-addon" style="width: 81px;">체중 kg</span><input
				type="number" id="kg" class="form-control " name="kg"
				placeholder="체중 kg" value="${map.WEIGHT eq null ? '' : map.WEIGHT}"
				style="width: 100px;" />
		</div>
		<div class="form-group" align="center" style="padding-top: 20px;">
			<button type="submit" class="w3-button w3-deep-purple w3-hover-deep-purple" style="width: 100px;">저장하기</button>
		</div> 
	</form> 
	<hr />
	  
<!-- 	<h3 align="left">MY FIT_INFO</h3> -->
	<div style="padding-top: 10px; text-align: left;">
		<h4 style="padding-top: 10px;">
			<span class="glyphicon glyphicon-scale"></span> 표준체중 <small>
				${map.SW}kg</small>
		</h4>
		<h4 style="padding-top: 10px;">
			<span class="glyphicon glyphicon-cutlery"></span> 하루 권장 칼로리 <small>
				${map.AC}Kcal</small>
		</h4>
		<h4 style="padding-top: 10px;">
			<span class="glyphicon glyphicon-ok"></span> 나의 BMI<small>
				${map.BMI} <c:choose>
					<c:when test="${map.BMI ge 20 and map.BMI lt 25}">
						<span style="color: green;">(정상)</span>
					</c:when>
					<c:when test="${map.BMI ge 25 and map.BMI lt 30}">
						<span style="color: #787ad6;">(과체중)</span>
					</c:when>
					<c:when test="${map.BMI ge 30 and map.BMI lt 40}">
						<span style="color: #ba78da;">(비만)</span>
					</c:when>
					<c:when test="${map.BMI ge 40}">
						<span style="color: red;">(고도비만)</span>
					</c:when>
					<c:otherwise>
						<span style="color: #7da4bd;">(저체중)</span>
					</c:otherwise>
				</c:choose>
			</small>
		</h4>
	</div>

</div>

<img src="기본이미지주소" onmouseover="this.src='마우스올렸을때 바뀔이미지주소'" onmouseout="this.src='기본이미지주소'" border="0">


<div class="col-xs-4 col-md-4" >
<div align="center" style="padding-top: 15px; padding-left: 47px;">
	<span style="font-size: 20pt;"  >    
		오늘의 식단
	</span>  
		<a href="javascript:meal()" >
		<img align="top" src="/icon/meal2.png" onmouseover="this.src='/icon/meal.png'" onmouseout="this.src='/icon/meal2.png'"></img>
		</a>
</div>
	<div style="padding-top: 10px;"> 
	<div style=" overflow: auto; width:350px; height:300px;">
		<c:forEach var="i" items="${list }"> 
			<p style="text-align: left; padding-left: 120px; ">
				<a href="javascript:myMenuDel(${i.NUM })"
					style="color: LightSkyBlue;"><span
					class="glyphicon glyphicon-remove"></span></a> <span
					style="font-size: 13pt;">${i.NAME}</span> <small>${i.KCAL}kcal</small>
			</p>
		</c:forEach>
		</div>
		<hr />
		<div  align="right" style="padding-right: 50px;">
			<c:choose>
				<c:when test="${total gt map.AC}">
					<b style="color: red;">${total}kcal</b>
				</c:when>
				<c:otherwise>
					<b style="color: Blue;">${total}kcal</b>
				</c:otherwise>
			</c:choose>
			/ <small>${map.AC}kcal</small>
		</div>
	</div>
</div>

<!-- 식사 Modal -->
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 450px; height: 700px">
		<div id="modal-content" class="modal-content"></div>
	</div>
</div>

<div class="col-xs-4 col-md-4 " >
	<div align="center" style="padding-top: 15px; padding-left: 47px;">
	<span style="font-size: 20pt;"  >    
		오늘의 운동
	</span>  
		<a href="javascript:exercise()" >
		<img align="top" src="/icon/fitness2.png" onmouseover="this.src='/icon/fitness.png'" onmouseout="this.src='/icon/fitness2.png'"></img>
		</a>
</div>
	<div style="padding-top: 10px;">
	<div style=" overflow: auto; width:350px; height:300px;">
		<c:forEach var="i" items="${list2 }">
			<p style="text-align: left; padding-left: 120px; ">
				<a href="javascript:myExerDel(${i.NUM })"
					style="color: LightSkyBlue;"><span
					class="glyphicon glyphicon-remove"></span></a> <span
					style="font-size: 13pt;">${i.NAME}</span> <small>${i.KCAL}kcal</small>
			</p>
		</c:forEach>
		</div>
		<hr />
		<div align="right" style="padding-right: 50px;">
			<b style="color: Blue; ">${total2}kcal</b>
		</div>
	</div>
</div>

<!-- 운동 Modal -->
<div id="modal-testNew2" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 450px; height: 700px">
		<div id="modal-content2" class="modal-content"></div>
	</div>
</div>
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
		function graph() {
			$.ajax({
				"url" : "/function/graphModal.jv"
			}).done(function(result) {
				$("#modal-content3").html(result);
				$("#modal-testNew3").modal();
			});
		}
		
		function meal() {
			$.ajax({
				"url" : "/function/fitnessModal.jv"
			}).done(function(result) {
				$("#modal-content").html(result);
				$("#modal-testNew").modal();
			});
		}
		function exercise() {
			$.ajax({
				"url" : "/function/exerciseModal.jv"
			}).done(function(result) {
				$("#modal-content2").html(result);
				$("#modal-testNew2").modal();
			});
		}

	function myMenuDel(num) {
		$.ajax({
			url : "/function/myMenuDelAjax.jv",
			data : {
				"num" : num,
			}
		}).done(function(result) {
			location.href = "/function/fitness.jv";
		});
	}

	function myExerDel(num) {
		$.ajax({
			url : "/function/myExerDelAjax.jv",
			data : {
				"num" : num,
			}
		}).done(function(result) {
			location.href = "/function/fitness.jv";
		});
	}
</script>

