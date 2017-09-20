<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<div class="modal-header" id="myModal">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">포인트내역</h4>
</div>
<div class="modal-body">
	<div class="row" style="padding-bottom: 10px; padding-top: 10px;">
		<div class="table-responsive">
			<table class="w3-table w3-bordered">
				<thead>
					<tr class="Info">
						<th width="20%">아이디</th>
						<th width="10%">포인트</th>
						<th width="30%">포인트내역</th>
						<th width="30%">취득날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.ID}</td>
							<td>${m.POINT}</td>
							<td>${m.CONTENT}</td>
							<td>${m.POINTDATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<c:if test="${empty list}">회원명단이 없습니다.</c:if>
	</div>
</div>
<script>
	function commDel(num, writer, num2) {
		$.ajax({
			url : "/admin/pointDel.jv",
			data : {
				"num" : num,
			}
		}).done()

	}
</script>

