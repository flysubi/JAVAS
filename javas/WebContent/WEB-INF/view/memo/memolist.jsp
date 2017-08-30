<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn {
    border: none;
    color: white;
    font-size: 15px;
    cursor: pointer;
}
.bt {
	background-color: white; 
	color: black;
	 border : 1px solid gray;
}
</style>
<div style="padding-bottom: 10px;">
	<div class="input-group" style="padding-bottom: 15px; padding-top: 15px;">
	</div>
	<form action="/memo/delete.jv">
		
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr class="Info">
						<td style="width: 6%;" align="center"><input type="checkbox"
							id="delAll"/></td>
						<td style="width: 15%">보낸이</td>
						<td style="width: 60%">내용</td>
						<td style="width: 20%">보낸날짜</td>
					</tr>
				</thead>
				<c:if test="${!empty list}">
					<tbody>
						<c:forEach items="${list }" var="i">
							<tr>
								<td align="center"><input type="checkbox" class="chk" id="delAll"
									name="num" value="${i.NUM}" /></td>
								<td><a href="/memo/write.jv?target=${i.SENDER }">${i.SENDER}</a></td>
								<td>${i.CONTENT}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>

			<c:if test="${empty list }">
					받은 쪽지가 없습니다<br />
			</c:if>
		</div>
		<div class="col-md-1 col-xs-1 col-sm-1">
			<button type="submit" class="btn bt">삭제</button>
		</div>

	</form>
	<div class="col-md-11 col-xs-9 col-sm-9" align="right">
		<a href="/memo/write.jv"><button type="button" class="btn bt"
				>쪽지쓰기</button></a>
	</div>
</div>
<script>
	document.getElementById("delAll").onclick = function() {
		var col = document.getElementsByClassName("chk");
		var b = document.getElementById("delAll").checked;
		if (b) {
			for (var i = 0; i < col.length; i++) {
				col[i].checked = true;
			}
		} else {
			for (var e = 0; e < col.length; e++) {
				col[e].checked = false;
			}
		}
	}
</script>