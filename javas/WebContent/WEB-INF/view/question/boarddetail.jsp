<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="form-group">
	<div align="center">
		<h1>${posts.FT_WRITER }님의글</h1>

	</div>
	<label>제목</label> <input style="background-color: white;"
		class="form-control" type="text" readonly="readonly"
		value="${posts.FT_TITLE}" /> <label>내용</label>
	<textarea style="background-color: white;" rows="25"
		class="form-control" readonly="readonly">${posts.FT_CONTENT}</textarea>
</div>
<div align="center" style="margin-bottom: 15px;">
	
	<a href="/question/answer.jv?num=${posts.FT_NUM }"
		style="text-decoration: none;"><button class="btn bnt-default"
			type="button">답글 쓰기</button></a>
</div>



<div class="table-responsive">
	<table class="table table-hover">
		<thead id="list">

		</thead>
	</table>
</div>

<script>
	
	
	
	
	
	
	

	
</script>