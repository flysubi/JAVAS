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
<div class="row" style="padding-bottom: 10px; padding-top: 10px;">
	<div class="col-xs-1 col-md-1"></div>
	<div align="left" class="row well col-xs-10 col-md-10"
		style="padding-bottom: 10px; padding-top: 10px;">
		<form action="/memo/list.jv" id="submit" method="post">
			<div class="col-xs-3 col-md-3">
				<select style="width: 223px;" class="w3-select w3-border"
					name="category" id="category">
					<option value="" disabled selected>쪽지 검색</option>
					<option value="" ${"" eq param.category ? 'selected' : ''}>전체
						카테고리 선택</option>
					<option value="전체쪽지" ${"전체쪽지" eq param.category ? 'selected' : ''}>전체쪽지</option>
					<option value="받은쪽지" ${"받은쪽지" eq param.category ? 'selected' : ''}>받은쪽지</option>
					<option value="보낸쪽지" ${"보낸쪽지" eq param.category ? 'selected' : ''}>보낸쪽지</option>
					<option value="보관쪽지" ${"보관쪽지" eq param.category ? 'selected' : ''}>보관쪽지</option>
					<option value="내게쓴쪽지" ${"내게쓴쪽지" eq param.category ? 'selected' : ''}>내게쓴쪽지</option>
			</select>
			</div>			
			<div class="col-xs-6 col-md-6 " align="right">
				<div class="w3-row">
					<div class="w3-third w3-container" style="padding-right: 0;">
						<select class="w3-select w3-border" name="option"
							style="height: 38px;">
							<option value="content"
								${"content" eq param.option ? 'selected' : ''}>제목+내용</option>
							<option value="writer"
								${"writer" eq param.option ? 'selected' : ''}>작성자</option>
						</select>
					</div>
					<div class="w3-third w3-container" style="padding-left: 0;">
						<input type="text" class="w3-input w3-border "
							value="${param.search eq null ? '' : param.search}"
							placeholder="Search" name="search" style="width: 195px;">
					</div>
					<div class="w3-third w3-container">
						<button type="submit" class="w3-button w3-white w3-border ">
							검색 <span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</div>
			</div>
			<div class="w3-third w3-container">
				받은쪽지함 "${sessionScope.
			</div>
			<div style="padding-top: 10px;">
				<a href="javascript:refresh()"><span
					class="glyphicon glyphicon-repeat"
					style="color: black; font-size: 15pt;"></span></a>
			</div>
		</form>
	</div>
	<div class="col-xs-1 col-md-1"></div>
</div>

<div class="table-responsive">
	<table class="w3-table w3-bordered">
		<thead>
			<tr class="Info">
				<th width= "6%" align="center"><input type="checkbox"
							id="all"/></th>
				<th width="15">보낸이</th>
				<th width="60%">내용</th>
				<th width="20%">보낸날짜</th>
				
			</tr>
		</thead>
				
				<c:if test="${!empty list}">
					<tbody>
						<c:forEach items="${list }" var="i">
							<tr>
								<td align="center"><input type="checkbox" class="chk" id="item"
									name="num" value="${i.FT_NUM}" /></td>
								<td><a href="/memo/write.jv?target=${i.FT_SENDER }">${i.FT_SENDER}</a></td>
								<td><a href="/memo/detail.jv=${i.FT_NUM}">${i.FT_CONTENT}</td>
								<td>${i.FT_DATE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>

			<c:if test="${empty list }">
					받은 쪽지가 없습니다<br />
			</c:if>
		</div>
		

	</form>
	
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