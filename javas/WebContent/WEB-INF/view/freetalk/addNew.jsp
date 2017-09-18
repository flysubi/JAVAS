<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<div align="center" class="row ">
	<h2>게시글 쓰기</h2>
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
		<form action="/freetalk/addNewExec.jv" method="post">
			<div class="form-group" align="left">
				<div class="input-group">
					<select style="width: 223px;" class="form-control" name="cate">
						<option value="" class="form-control">카테고리 선택하기</option>
						<c:forTokens var="t" items="PC관리,인터넷,기타" delims=",">
							<option value="${t}" class="form-control">${t}</option>
						</c:forTokens>
					</select>
				</div>
			</div>
			<div class="form-group" align="left">
				<label style="margin-left: 10px;">제목</label> <input
					class="form-control" type="text" name="title" />
			</div>
			<div class="form-group" align="left">
				<label style="margin-left: 10px;">내용</label>
				<textarea id="summernote" rows="10" class="form-control"
					name="content" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="form-group">
				<button id="sbt" type="submit" class="btn btn-default"
					style="width: 100%">확인</button>
			</div>
		</form>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
      $('#summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
      });
    });
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/image',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
</script>
