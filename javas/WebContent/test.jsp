<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>

<title>Insert title here</title>
</head>
<body>

<div align="center" class="row ">
	<h2>FreeTalk</h2>
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
		<form action="/freetalk/writeExec.sk" method="post">
			<div class="form-group" align="left">
				<label style="margin-left: 10px;">제목</label>
				<input type="text" class="form-control" width="100%;" placeholder="제목 입력" name="title" id="title" required/>
			</div>
			<div class="form-group" align="left">
				<label style="margin-left: 10px;">내용</label>
				<textarea rows="7" class="form-control" name="content" id="content" placeholder="내용 입력" required></textarea>
			</div>
			<div class="form-group">
				<button id="sbt" type="submit" class="btn btn-default" style="width: 100%">저장</button>
			</div>
		</form>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>
<script src="/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace("content", {
		"filebrowserUploadUrl" : "/freetalk/upload.sk"			
	});
</script>

</body>
</html>