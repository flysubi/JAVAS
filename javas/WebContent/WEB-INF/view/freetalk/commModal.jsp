<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal-header" id="myModal">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">댓글</h4>
</div>
<div class="modal-body">
	<hr style="background-color: silver; height: 1px; width: 80%" />
	<c:forEach var="i" items="${list}">
		<p style="text-align: left; padding-left: 80px;">
			<b>${i.WRITER}</b> | ${i.FC}
			<c:if test="${i.WRITER eq sessionScope.auth}">
				<c:if test="${i.WRITER eq sessionScope.auth}">
				<a href="javascript:commDel(${i.NUM },'${i.WRITER}',${i.FT_NUM })" style="color: red";><span class="glyphicon glyphicon-remove"></span></a>
			</c:if>
			</c:if>
			<br/> ${i.CONTENT}
		</p>
		<hr style="background-color: silver; height: 1px; width: 80%" />
	</c:forEach>
</div>
<script>
function commDel(num, writer,num2) {
		$.ajax({
			url : "/freetalk/commDel.jv",
			data : {
				"num" : num,
				"writer" : writer,
			}
		}).done(function(result) {
			location.href="/freetalk/allTalks.jv?num="+num2+"&num2="+num;
		});
}
</script>
