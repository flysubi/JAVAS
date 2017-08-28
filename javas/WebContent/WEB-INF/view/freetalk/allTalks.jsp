<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="padding-bottom: 10px;">
	<h2>게시판</h2>
	<div style="padding-right: 20px; padding-bottom: 10px;" align="right">
		<a href="/freetalk/addNew.js">
			<button type="button" class="btn btn-info">글쓰기</button></a>	
	</div>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr class="Info">
					<th width="10%"></th>
					<th width="50%">제목</th>
					<th width="10%">작성자</th>
					<th width="10%">좋아요</th>
				</tr>
			</thead>
			<tbody>
	<c:forEach var="m" items="${list}">
			<tr>
				<td>${m.FT_NUM}</td>
				<td><a href="/freetalk/viewTalk.js?num=${m.FT_NUM}">${m.FT_TITLE}</a><c:if test="${m.CNT ne null }">(${m.CNT})</c:if></td>
				<td>${m.FT_WRITER eq null ? '(알수없음)' : m.FT_WRITER}</td>
				<td style="text-align: center;"><fmt:formatNumber
						value="${m.FT_LIKE}" pattern="#,###" var="t" />${t }</td>
			</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${empty list}">게시글이 없습니다.</c:if>
	
</div>

<div align="center">
	<form action="/freetalk/allTalks.js" >
	<div class="input-group">
    	<span><input  type="text" class="form-control" placeholder="Search" 
    		name="search" style=" width: 250px;"></span>&nbsp;
		      <button type="submit" class="btn btn-info">검색</button>	
	</div>
	</form>

<ul class="pagination">
	<c:forEach var="i" begin="1" end="${size}">
		<li class="${i eq page ? 'active' :'' }"><a
			href="/freetalk/allTalks.js?p=${i }&search=${param.search}">${i}</a></li>
	</c:forEach>
	
</ul>
</div>
