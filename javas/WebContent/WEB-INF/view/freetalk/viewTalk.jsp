<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
 .well {
 	background : snow;
 }
</style>
	<h2>${sessionScope.map.TITLE}</h2>
		<p style="text-align: right; padding-right: 100px; font-size: 12pt;">
			작성자 : ${sessionScope.map.WRITER }
				<button type="submit" class="btn btn-danger btn-xs" id="like" value="${sessionScope.map.NUM }">♡</button>
				 | 작성일 : <fmt:formatDate value="${sessionScope.map.WRITEDATE}" pattern="yy-MM-dd"/>
		 <c:choose>
			<c:when test="${sessionScope.map.DIFF lt 1}">
				<c:choose>
				<c:when test="${sessionScope.map.DIFF * 1440 gt 60}">
				 <small><fmt:formatNumber value="${sessionScope.map.DIFF * 24}" pattern="#,###"/>시간 전</small>
				</c:when>
				<c:otherwise>
					<small><fmt:formatNumber value="${sessionScope.map.DIFF * 1440}" pattern="#,###" />분 전</small>
				</c:otherwise>
				</c:choose>
			</c:when>
		 	<c:when test="${sessionScope.map.DIFF lt 365}">
			 <small><fmt:formatNumber value="${sessionScope.map.DIFF}" pattern="#,###"/>일 전</small>
			</c:when>
			<c:otherwise>
			 <small><fmt:formatNumber value="${sessionScope.map.DIFF div 365}" pattern="#,###"/>년 전</small>
			</c:otherwise>
		 
		 </c:choose>
		</p>
	<div class="col-xs-0 col-md-2"></div>
	<div class="well col-xs-12 col-md-8"><pre>${sessionScope.map.CONTENT}</pre></div>
	<div class="col-xs-0 col-md-2"></div>
	<hr style="background-color:silver; height: 2px; width: 70%"/>
	<div class="col-xs-0 col-md-2"></div>
	<div class="col-xs-12 col-md-8">
	<div class="table-responsive">
		<table id="list" class="table">
		</table>
	</div>
	<div class="form-group">
		<textarea rows="2" cols="70" style="vertical-align: bottom; height: 60;" 
			class="input-control" id="comment" name="content" placeholder="내용을 입력해주세요."></textarea>
		<button  id="suc" type="submit" class="btn btn-default" style="height:60;">등록</button>
	</div>
	</div>
	<div class="col-xs-0 col-md-2"></div>

<script>
	var list = function() {
		$.ajax({
			url : "/freetalk/commentsAjax.js",
			data : {
				"num" : "${param.num}",
			}
		}).done(function(rst) {
			console.log(rst);
			var table = "";
			for(var i=0; i<rst.length; i++) {
				table += "<tr><td style=\"width: 20%\"><b>"+rst[i].WRITER+"</b></td>";
				table += "<td  style=\"width: 60%\">"+rst[i].CONTENT+"</td>";
				table += "<td  style=\"width: 20%\">"+rst[i].FC+"</td></tr>";
			}
			$("#list").html(table);
		});
		$("#comment").val("");
	}
	list();
	
	$("#suc").on("click",function() {
			$.ajax({
				url : "/freetalk/commentsAjax.js",
				data : {
					"content" : $("#comment").val(),
					"num" : "${sessionScope.map.NUM }",
				}
			}).done(function(){
				list();
			$("#comment").val("");
			});
		});
	
</script>

