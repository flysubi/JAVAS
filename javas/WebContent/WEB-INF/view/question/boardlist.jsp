<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<div class="row" style="padding-bottom: 10px; padding-top: 10px;">
</div>
<div class="table-responsive">
	<table class="w3-table w3-bordered">
		<thead>
			<tr class="Info">
				<th width="10%"></th>
				<th width="40%">제목</th>
				<th width="20%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>

			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${!empty postsList }">
					<c:forEach items="${postsList }" var="i">
						<tr>
							<td>${i.FT_NUM }</td>
							<c:choose>
								<c:when test="${i.FT_DEPTH eq 0}">
									<td><a
										href="/question/detail.jv?num=${i.FT_NUM }&like=${i.FT_LIKE}">${i.FT_TITLE }</a></td>
								</c:when>
								<c:otherwise>
									<td><c:forEach begin="1" end="${i.FT_DEPTH }" step="1">
											&emsp;
										</c:forEach> <a
										href="/question/detail.jv?num=${i.FT_NUM }&like=${i.FT_LIKE}">
											<i class="material-icons"></i>${i.FT_TITLE }</a></td>
								</c:otherwise>
							</c:choose>
							<td>${i.FT_WRITER }</td>
							<td>${i.FT_LIKE }</td>
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
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" style="text-align: center"><br />게시글이 없습니다.</td>
					</tr>

				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

<div style="padding-right: 0px; padding-bottom: 10px; padding-top: 40px;" align="right">
	<a href="/question/write.jv">
		<button type="button" class="w3-button w3-white w3-border ">
			글쓰기 <span class="glyphicon glyphicon-pencil"></span>
		</button>
	</a>
</div>
<div align="center">
	<form action="/question/list.jv">
		<div class="input-group">
			<span><input type="text" class="form-control"
				placeholder="Search" name="search" style="width: 250px;"></span>&nbsp;
			<button type="submit" class="btn bt">
				검색 <span class="glyphicon glyphicon-search"></span>
			</button>
		</div>
	</form>

	<ul class="pagination">
		<c:forEach var="i" begin="1" end="${size}">
			<li class="${i eq page ? 'active' :'' }"><a
				href="/question/list.jv?p=${i }">${i}</a></li>
		</c:forEach>
	</ul>
</div>

