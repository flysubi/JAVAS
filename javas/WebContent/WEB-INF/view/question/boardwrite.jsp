<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<form action="/freeboard/writeExec.choc" method="post">
			<div class="form-group">
				<input class="form-control" type="text" name="title" placeholder="제목을 입력해 주세요" required="required"/>
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="25" id="ta" name="content" required="required" placeholder="내용"></textarea>
			</div>
			<button type="submit" class="btn bnt-default" style="width: 40%">등록</button>
	</form>
</div>