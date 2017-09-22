<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.btn {
	border: none;
	color: white;
	font-size: 15px;
	cursor: pointer;
}
th, td {
	font-size: 16px;
}
.bt {
	background-color: white;
	color: black;
	border: 1px solid gray;
}

table {
	font-size: small;
	table-layout: fixed;
}

.well {
	background: white;
}
.wrap .table, td {
	overflow: hidden;
	text-overflow:ellipsis;
	white-space: nowrap;
}
</style>
<div style="padding-bottom: 10px;">
	<div class="input-group" style="padding-bottom: 15px; padding-top: 15px;">
	</div>
	<form action="/memo/delete.jv">
		
		<div class="table-responsive">
	<table class="w3-table w3-bordered">
				<thead>
					<tr class="Info">
						<td style="width: 6%;" align="center"><input type="checkbox"
							id="all"/></td>
						<td style="width: 15%">보낸이</td>
						<td style="width: 60%">내용</td>
						<td style="width: 20%">보낸날짜</td>
					</tr>
				</thead>
				<c:if test="${!empty list}">
					<tbody>
						<c:forEach items="${list }" var="i">
							<tr>
								<td align="center"><input type="checkbox" class="chk" id="item"
									name="num" value="${i.FT_NUM}" /></td>
								<td><a href="/memo/write.jv?w=${i.FT_SENDER }">${i.FT_SENDER}</a></td>
								<td>${i.FT_CONTENT}</td>
								<td><fmt:formatDate value="${i.FT_DATE}" pattern="yy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>

			<c:if test="${empty list }">
					받은 쪽지가 없습니다<br />
			</c:if>
		<div style="padding-right: 0px; padding-bottom: 10px; padding-top: 10px;"
	align="left">
		<div class="col-md-1 col-xs-1 col-sm-1">
			<button type="submit"class="w3-button w3-white w3-border ">삭제</button>
		</div>

	</form>
	<div
	style="padding-right: 0px; padding-bottom: 10px; padding-top: 10px;"
	align="right">
	<a href="/memo/write.jv">
		<button type="button" class="w3-button w3-white w3-border ">
			글쓰기 <span class="glyphicon glyphicon-pencil"></span>
		</button>
	</a>
</div>
</div>
<script>
document.getElementById("all").onchange = function() {
	var flag = this.checked;
	var items = document.getElementsByClassName("chk");
	for(var i=0; i<items.length; i++) {
		items[i].checked= flag;
	}
}

var item = document.getElementsByClassName("chk");
for(var i =0 ; i<item.length; i++) {
	item[i].onchange = function() {
		if(this.checked== false) {
			document.getElementById("all").checked= false;
		}			
	}
}

	
</script>