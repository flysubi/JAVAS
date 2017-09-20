<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.w3-table td, .w3-table th, .w3-table-all td, .w3-table-all th {
	text-align: center;
}

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

table {
	font-size: small;
	
}

.well {
	background: white;
}
</style>
<div class="row" style="padding-bottom: 10px; padding-top: 10px;">

	<form action="/admin//member.jv" id="submit" method="post">
		<div class="table-responsive">
			<table class="w3-table w3-bordered">
				<thead>
					<tr class="Info">
						<th width="10%">아이디</th>
						<th width="10%">이메일</th>
						<th width="10%">이름</th>
						<th width="5%">성별</th>
						<th width="15%">생년월일</th>
						<th width="10%">포인트</th>
						<th width="15%">가입날짜</th>
						<th width="15%">최근접속날짜</th>
						<th width="20%">회원탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${list}">
						<tr>
							<td >${m.ID}</td>
							<td >${m.EMAIL}</td>
							<td >${m.NAME eq null ? '없음' : m.NAME}</td>
							<td >${m.GENDER eq null ? '없음' : m.GENDER}</a></td>
							<td >${m.YEAR eq null ? '없음' : m.YEAR}/${m.MONTH eq null ? '없음' : m.MONTH}/${m.DAY eq null ? '없음' : m.DAY}</td>
							<td ><a href="javascript:openModal('${m.ID }')"
								style="color: orange">${m.POINT}</a></td>
							<td >${m.JOINDATE}</td>
							<td >${m.LOGINDATE}</td>
							<td><c:if test="${ sessionScope.auth eq 'admin'}">
									<a
										href="javascript:memberDel('${m.ID}')"
										style="color: red;" ><span
										class="glyphicon glyphicon-remove" ></span></a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<c:if test="${empty list}">회원명단이 없습니다.</c:if>
	</form>

</div>

<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 600px; height: 700px">
		<div id="modal-content" class="modal-content"></div>
	</div>
</div>

<script>

if(${sessionScope.auth ne null}) {
	var openModal = function openModal(id) {
		
		$.ajax({
			"url" :"/admin/pointModal.jv?id="+id
		}).done(function(result) {
			$("#modal-content").html(result);
			$("#modal-testNew").modal();
		});
	}
}

function memberDel(id) {
	window.alert(id);
	$.ajax({
		url : "/admin/memberDel.jv?id="+id,
			}).done(function(result) {
		list();
	});
}

</script>