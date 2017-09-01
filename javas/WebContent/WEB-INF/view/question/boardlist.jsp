<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
	 border : 1px solid gray;
}
</style>
<div style="padding-bottom: 10px;">
	<div class="input-group" style="padding-bottom: 15px; padding-top: 15px;">
	</div>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr class="Info">
					<th width="5%"></th>
					<th width="50%">제목</th>
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
										<td><a href="/question/detail.jv?num=${i.FT_NUM }&like=${i.FT_LIKE}">${i.FT_TITLE }</a></td>
									</c:when>
									<c:otherwise>
										<td><c:forEach begin="1" end="${i.FT_DEPTH }" step="1">
												&emsp;
											</c:forEach> <a href="/question/detail.jv?num=${i.FT_NUM }&like=${i.FT_LIKE}"> <i
												class="material-icons">subdirectory_arrow_right</i>${i.FT_TITLE }</a></td>
									</c:otherwise>
								</c:choose>
								<td>${i.FT_WRITER }</td>
								<td>${i.FT_LIKE }</td>
								<td>${i.FT_DATE }</td>
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
</div>
<div style="padding-right: 20px; padding-bottom: 10px;" align="right">
	<a href="/question/write.jv">
		<button type="button" class="btn bt">글쓰기 <span class="glyphicon glyphicon-pencil"></span></button>
	</a>
</div>
<div align="center">
	<form action="/question/list.jv">
		<div class="input-group">
			<span><input type="text" class="form-control"
				placeholder="Search" name="search" style="width: 250px;"></span>&nbsp;
			<button type="submit" class="btn bt">검색 <span class="glyphicon glyphicon-search"></span></button>
		</div>
	</form>

	<ul class="pagination">
		<c:forEach var="i" begin="1" end="${size}">
			<li class="${i eq page ? 'active' :'' }"><a
				href="/question/list.jv?p=${i }">${i}</a></li>
		</c:forEach>
	</ul>
</div>

	