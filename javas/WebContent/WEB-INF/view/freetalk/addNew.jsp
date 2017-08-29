<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" class="row ">
	<h2>게시글 쓰기</h2>
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
		<form action="/freetalk/addNewExec.jv" method="post">
			<div class="form-group" align="left">
				<label style="margin-left: 10px;">제목</label> 
				 <input class="form-control" type="text" name="title" />
			</div>
			<div class="form-group" align="left">
				<label style="margin-left: 10px;">내용</label>
				<textarea rows="10" class="form-control" name="content" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="form-group">
				<button id="sbt" type="submit" class="btn btn-default" style="width: 100%">확인</button>
			</div>
		</form>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>