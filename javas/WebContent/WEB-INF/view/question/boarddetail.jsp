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
	<button class="btn bnt-default" id="likeup" type="button"
		style="width: 40%">추천</button>
	
	<a href="/quesiton/answer.js?num=${posts.FT_NUM }"
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
	
	
	
	var getlist = function(){
		$.ajax({
			url:"/quesiton/replylist.js",
			data:{
				"posts" : ${posts.FT_NUM }
			},
			method : "get"
		}).done(function(json){
				window.alert("${sessionScope.auth}");
			var text = "";
			for(var i = json.length-1 ; i >= 0; i--){
				var user = json[i].WRITER;
				if("${sessionScope.auth}" == user){
					var delAndModi = "수정, 삭제";
					
				}
				text += "<tr><td style=\"width: 20%\">"+json[i].WRITER+"</td><td style=\"width: 70%\">"+json[i].CONTENT+"</td><td style=\"width: 10%\">"+delAndModi+"</td></tr>";
			}
			$("#list").html(text);
			$("#reply").val("");
		})
		
	}

	getlist();
	
	$("#bnt").click(function(){
		if($("#reply").val().trim().length != 0){
			$.ajax({
				url:"/quesiton/reply.js",
				data:{
					"reply" : $("#reply").val(),
					"posts" : ${posts.FT_NUM }
				},
				method : "get"
			}).done(function(json){
				var text = "";
				for(var i = json.length-1 ; i >= 0; i--){
					 text += "<tr><td style=\"width: 20%\">"+json[i].WRITER+"</td><td style=\"width: 70%\">"+json[i].CONTENT+"</td><td style=\"width: 10%\">"+delAndModi+"</td></tr>";
				}
				$("#list").html(text);
				$("#reply").val("");
				$("#reply").slideUp();
				$("#bnt").slideUp();
				$("#sd").slideDown();
		})
		}else{
			window.alert("글 쓰고 눌러요");
		}
	})

	$("#bnt").click(function() {
		$("reply").trigger("change");
	});

	
</script>