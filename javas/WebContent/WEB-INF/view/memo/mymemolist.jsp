<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="row" style="padding-bottom: 20px; padding-top: 20px; padding-left: 50px;">
	
<div class="table-responsive">
	<table class="w3-table w3-bordered">
		<thead>
			<tr class="Info">

				<th width="6%" align="center"><input type="checkbox" id="all" /></th>
				<th width="6%"></th>
				<th width="15%">보낸사람</th>
				<th width="40%">내용</th>
				<th width="30%">보낸날짜</th>

			</tr>
		</thead>

		<c:if test="${!empty list}">
			<tbody>
				<c:forEach items="${list }" var="i">
					<tr>
						<td align="center"><input type="checkbox" class="chk"
							id="item" name="num" value="${i.FT_NUM}" /></td>
						<c:choose>
							<c:when test="${i.CATEGORY eq '읽은쪽지'}">

								<td><span class="glyphicon glyphicon-envelope"
									style="color: white"></span></td>
								<td><a href="/memo/write.jv?w=${i.FT_SENDER }"
									style="color: white">${i.FT_SENDER}</a></td>
								<td><a href="/memo/detail.jv=${i.FT_NUM}"
									style="color: white">${i.FT_CONTENT}</a></td>
							</c:when>
							<c:otherwise>
								<td><span class="glyphicon glyphicon-envelope"
									style="color: black"></span></td>
								<td><a href="/memo/write.jv?w=${i.FT_SENDER }"
									style="color: black">${i.FT_SENDER}</a></td>
								<td><a href="/memo/detail.jv?num=${i.FT_NUM}"
									style="color: black">${i.FT_CONTENT}</a></td>

							</c:otherwise>
						</c:choose>
						<td><c:choose>

								<c:when test="${i.FT_DIFF < 1 }">
									<fmt:formatDate value="${i.FT_DATE }" pattern="HH:mm" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${i.FT_DATE }" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</c:if>
	</table>
</div>
<c:if test="${empty list }">
					받은 쪽지가 없습니다<br />
</c:if>


<div align="center">
	<ul class="pagination">
		<c:forEach var="i" begin="1" end="${size}">
			<li class="${i eq page ? 'active' :'' }"><a
				href="/memo/mylist.jv?p=${i }&category=${param.category}">${i}</a></li>
		</c:forEach>
	</ul>
</div>
<script>
	$("#category").on("change", function() {
		$("#submit").submit();
	});

	function refresh() {
		location.href = '/memo/mylist.jv';
	}

	document.getElementById("all").onchange = function() {
		var flag = this.checked;
		var items = document.getElementsByClassName("chk");
		for (var i = 0; i < items.length; i++) {
			items[i].checked = flag;
		}
	}

	var item = document.getElementsByClassName("chk");
	for (var i = 0; i < item.length; i++) {
		item[i].onchange = function() {
			if (this.checked == false) {
				document.getElementById("all").checked = false;
			}
		}
	}
</script>