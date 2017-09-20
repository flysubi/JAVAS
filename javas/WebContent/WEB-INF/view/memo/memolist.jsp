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
					<option value="recommend"
						${"recommend" eq param.sequence ? 'selected' : ''}>추천순</option>
					<option value="title"
						${"title" eq param.sequence ? 'selected' : ''}>제목순</option>
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

				<th width="6%" align="center"><input type="checkbox" id="all" /></th>
				<th width="6%"></th>
				<th width="15%">보낸사람</th>
				<th width="50%">내용</th>
				<th width="20%">보낸날짜</th>

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
								<td><a href="/memo/write.jv?target=${i.FT_SENDER }"
									style="color: white">${i.FT_SENDER}</a></td>
								<td><a href="/memo/detail.jv=${i.FT_NUM}"
									style="color: white">${i.FT_CONTENT}</a></td>
							</c:when>
							<c:otherwise>
								<td><span class="glyphicon glyphicon-envelope"
									style="color: black"></span></td>
								<td><a href="/memo/write.jv?target=${i.FT_SENDER }"
									style="color: black">${i.FT_SENDER}</a></td>
								<td><a href="/memo/detail.jv=${i.FT_NUM}"
									style="color: black">${i.FT_CONTENT}</a></td>

							</c:otherwise>
						</c:choose>
						<c:choose>

							<c:when test="${i.FT_DIFF < 1 }">
								<fmt:formatDate value="${i.FT_DATE }" pattern="HH:mm" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${i.FT_DATE }" pattern="yyyy-MM-dd" />
							</c:otherwise>
						</c:choose>
						</td>
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