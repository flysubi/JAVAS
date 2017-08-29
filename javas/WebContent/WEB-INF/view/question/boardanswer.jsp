<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h1>답글</h1>
	<form action="/question/replyExec.jv" method="post">
			<div class="form-group">
				<input class="form-control" type="text" name="title" placeholder="제목을 입력해 주세요" value="re : ${posts.FT_TITLE }" required="required"/>
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="25" name="content" required="required" placeholder="내용">



${posts.FT_WRITER} 님의 글
=============================================================================================

${posts.FT_CONTENT}

=============================================================================================
</textarea>
	<input type="text" name="group" value="${posts.FT_GROUP }" style="display: none;"/>
	<input type="text" name="step" value="${posts.FT_STEP }" style="display: none;"/>
	<input type="text" name="depth" value="${posts.FT_DEPTH }" style="display: none;"/>
			</div>
			<button type="submit" class="btn bnt-default" style="width: 40%">등록</button>
	</form>
</div>