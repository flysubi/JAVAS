<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<table class="table table-hover">
		<thead>
			<tr>
				<td style="width: 5%">No.</td>
				<td style="width: 15%">글쓴이</td>
				<td style="width: 65%">제목</td>
				<td style="width: 10%">추천수</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty postsList }">
					<c:forEach items="${postsList }" var="i">
						<tr>
							<td>${i.FT_NUM }</td>
							<td>${i.FT_WRITER }</td>
							<c:choose>
								<c:when test="${i.FT_DEPTH eq 0}">
									<td><a href="/question/detail.jv?num=${i.FT_NUM }">${i.FT_TITLE }</a></td>
								</c:when>
								<c:otherwise>
									<td><c:forEach begin="1" end="${i.FT_DEPTH }" step="1">
											&emsp;
										</c:forEach> <a href="/question/detail.jv?num=${i.FT_NUM }"> <i
											class="material-icons">subdirectory_arrow_right</i>${i.FT_TITLE }</a></td>
								</c:otherwise>
							</c:choose>
							<td>${i.FT_LIKE }</td>
						</tr>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<tr>
						<td colspan="4" style="text-align: center"><br />글이 없어요.</td>
					</tr>
					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<button  type="submit" class="btn btn-default" align="right" style="height:60;"><a href="/question/write.jv">글등록</a></button>
	<form action="/question/search.jv">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="Search"
				name="keyword"  required="required">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
</div>