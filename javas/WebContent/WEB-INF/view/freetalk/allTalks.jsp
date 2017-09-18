<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		style="padding-bottom: 10px; padding-top: 10px;  ">
			<form action="/freetalk/allTalks.jv" id="submit" method="post">
		<div class="col-xs-3 col-md-3">
				<select style="width: 223px;" class="w3-select w3-border"
					name="category" id="category">
					<option value="" disabled selected>카테고리 검색</option>
					<option value="" ${"" eq param.category ? 'selected' : ''}>전체
						카테고리 선택</option>
					<option value="날씨" ${"날씨" eq param.category ? 'selected' : ''}>날씨</option>
					<option value="캘린더" ${"캘린더" eq param.category ? 'selected' : ''}>캘린더</option>
					<option value="길찾기" ${"길찾기" eq param.category ? 'selected' : ''}>길찾기</option>
					<option value="자산관리" ${"자산관리" eq param.category ? 'selected' : ''}>자산관리</option>
					<option value="건강" ${"건강" eq param.category ? 'selected' : ''}>건강</option>
					<option value="기타" ${"기타" eq param.category ? 'selected' : ''}>기타</option> 
				</select>
		</div>
		<div class="col-xs-2 col-md-2">
				<select style="width: 150px;" class="w3-select w3-border"
					name="sequence" id="sequence">
					<option value="">최신순</option> 
					<option value="recommend" ${"recommend" eq param.sequence ? 'selected' : ''}>추천순</option>
					<option value="title" ${"title" eq param.sequence ? 'selected' : ''}>제목순</option>
				</select>
		</div>
		<div class="col-xs-6 col-md-6 " align="right"> 
		<div class="w3-row">
				<div class="w3-third w3-container" style="padding-right: 0;">
					<select class="w3-select w3-border" name="option" style="height: 38px;">
						<option value="content" ${"content" eq param.option ? 'selected' : ''}>제목+내용</option>
						<option value="writer" ${"writer" eq param.option ? 'selected' : ''}>작성자</option>					
					</select>
				</div>
				<div class="w3-third w3-container" style="padding-left: 0;">
					<input type="text" class="w3-input w3-border "
						value="${param.search eq null ? '' : param.search}"
						placeholder="Search" name="search"
						style="width: 195px;   background-image: url('searchicon.png');"></div>
						<div class="w3-third w3-container">  
					<button type="submit" class="w3-button w3-white w3-border ">
						검색 <span class="glyphicon glyphicon-search"></span>
					</button></div>
				</div>
				</div>
				<div style="padding-top: 10px;">
		<a href="javascript:refresh()"><span class="glyphicon glyphicon-repeat" style="color: black; font-size: 15pt;"></span></a>
		</div>
				</form>
		</div>
		<div class="col-xs-1 col-md-1"></div> 
	</div>

	<div class="table-responsive">
		<table class="w3-table w3-bordered">
			<thead>
				<tr class="Info">
					<th width="10%"></th>
					<th width="15%">카테고리</th>
					<th width="40%">제목</th>
					<th width="10%">작성자</th>
					<th width="10%">작성일</th>
					<th width="10%">추천수</th>
				</tr> 
			</thead>
			<tbody>
				<c:forEach var="m" items="${list}">
					<tr>
						<td>${m.NUM}</td>
						<td>${m.CATEGORY}<c:if test="${m.FILENAME ne null }">
								<a href="/freetalk/down.jv?n=${m.NUM}"> <span
									class="glyphicon glyphicon-download-alt"></span></a>
							</c:if></td>
						<td><a href="/freetalk/viewTalk.jv?num=${m.NUM}"
							style="color: black;">${m.TITLE}</a> <c:if
								test="${m.CNT ne null }">
								<a href="javascript:openModal(${m.NUM })" style="color: orange">[${m.CNT}]</a>
							</c:if></td>
						<td><a href="/memo/write.jv?w=${m.WRITER}">${m.WRITER eq null ? '(알수없음)' : m.WRITER}</a></td>
						<td>
							<c:choose>
								<c:when test="${m.TODAY eq m.FREEDAY}">
								<fmt:formatDate value="${m.WRITEDATE}" pattern="HH:mm" /> 
								</c:when> 
								<c:otherwise>
								<fmt:formatDate value="${m.WRITEDATE}" pattern="yyyy.MM.dd" /> 
								</c:otherwise>
							</c:choose>						
							</td>
						<td><fmt:formatNumber
								value="${m.RECOMMEND}" pattern="#,###" var="t" />${t }</td>
					</tr> 
				</c:forEach>
			</tbody>
		</table>
	</div> 
	<c:if test="${empty list}">게시글이 없습니다.</c:if>
	<div
		style="padding-right: 0px; padding-bottom: 10px; padding-top: 10px;"
		align="right">
		<a href="/freetalk/addNew.jv">
			<button type="button" class="w3-button w3-white w3-border ">
				글쓰기 <span class="glyphicon glyphicon-pencil"></span>
			</button>
		</a>
	</div>
 
<div align="center">
	<ul class="pagination">
		<c:forEach var="i" begin="1" end="${size}">
			<li class="${i eq page ? 'active' :'' }"><a
				href="/freetalk/allTalks.jv?p=${i }&category=${param.category}">${i}</a></li>
		</c:forEach>
	</ul>
</div>


<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 600px; height: 700px">
		<div id="modal-content" class="modal-content"></div>
	</div>
</div>


<script>
	$("#category").on("change", function() {
		$("#submit").submit();
	});
	
	$("#sequence").on("change", function() {
		$("#submit").submit();
	});
	
	function refresh() {
		location.href='/freetalk/allTalks.jv';
	}
	
	if(${sessionScope.auth} !=  null) {
		var openModal = function openModal(num) {
			$.ajax({
				"url" :"/freetalk/commModal.jv?num="+num
			}).done(function(result) {
				$("#modal-content").html(result);
				$("#modal-testNew").modal();
			});
		}
	}

if(${num ne null}) {
	 openModal(${num});
	 
	 
}

</script>