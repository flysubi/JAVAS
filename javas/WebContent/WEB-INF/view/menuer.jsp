<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <style type='text/css'> -->

<!--  	#album-contain {width:1200px; margin:0 auto;}  -->
<!--  	.album-wrap {float:left; position:relative; width:1034px; height:500px; margin:0 10px; overflow:hidden;}  -->
<!--  	.album-wrap ul.album {position:absolute;  list-style:none;}  -->
<!--  	.album-wrap ul.album li {float:left; width:1034px;}  -->

<!-- 	span.prev {float:left; width:25px; margin-top:300px;}  -->
<!--  	span.next {float:left; width:25px; margin-top:300px;}  -->

<!--  	ul.bt-roll {width:200px;height: 50px; margin:0 auto; margin-top:20px;list-style:none;}  -->
<!--  	ul.bt-roll li {float:left; margin-right:5px;}  -->

<!-- </style> -->

<!-- <body> -->
<!-- <div id="album-contain" class="clfix"> -->
<!-- 	<span class="prev"><a href="#"><img src="/style/왼쪽.png" alt="이전"></a></span> -->
<!-- 	<div class="album-wrap"> -->
<!-- 		<ul class="album clfix"> -->
<!-- 			<li><img src="/style/메뉴얼표.png" alt=""></li> -->
<!-- 			<li><img src="/style/메뉴얼날씨.png" alt=""></li> -->
<!-- 			<li><img src="/style/메뉴얼캘랜더.png" alt=""></li> -->
<!-- 			<li><img src="/style/메뉴얼길찾기.png" alt=""></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- 	<span class="next"><a href="#"><img src="/style/오른쪽.png" alt="다음"></a></span> -->
<!-- </div> -->

<!-- <ul class="bt-roll"> -->
<!-- 	<li><a href="#"><img src="/style/btn_circle_.png" alt=""></a></li> -->
<!-- 	<li><a href="#"><img src="/style/btn_circle.png" alt=""></a></li> -->
<!-- 	<li><a href="#"><img src="/style/btn_circle.png" alt=""></a></li> -->
<!-- 	<li><a href="#"><img src="/style/btn_circle.png" alt=""></a></li> -->
<!-- </ul>	-->


<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
<style>
	*{margin:0;padding:0;}
	
	ul,li{list-style:none;}
	
	#slide{
	left:85px;
	width:1034px;
	height:500; 
	position:relative;
	overflow:hidden;
	}
	
	#slide ul{width:600%;height:100%;transition:1s;}
	#slide ul:after{content:"";display:block;clear:both;}
	#slide li{float:left;width:1034px;height:100%;}
	
	#slide li:nth-child(1){background-image: url("/style/메뉴얼표.png");}
	#slide li:nth-child(2){background-image: url("/style/메뉴얼날씨.png");}
	#slide li:nth-child(3){background-image: url("/style/메뉴얼캘랜더.png");}
	#slide li:nth-child(4){background-image: url("/style/메뉴얼길찾기.png");}
	#slide li:nth-child(5){background-image: url("/style/메뉴얼자산관리.png");}
	#slide li:nth-child(6){background-image: url("/style/메뉴얼건강.png");}
	
	#slide input{display:none;}
	
	#slide label
	{
	display:inline-block;
	vertical-align:middle;
	width:10px;
	height:10px;
	border:2px solid #666;
	background:#fff;
	transition:0.3s;
	border-radius:50%;
	cursor:pointer;}
	
	#slide .pos
	{
	text-align:center;
	position:absolute;
	bottom:10px;
	left:0;
	width:1034px;
	text-align:center;}
	
	#pos1:checked~ul{margin-left:0%;}
	#pos2:checked~ul{margin-left:-100%;}
	#pos3:checked~ul{margin-left:-200%;}
	#pos4:checked~ul{margin-left:-300%;}
	#pos5:checked~ul{margin-left:-400%;}
	#pos6:checked~ul{margin-left:-500%;}
	
	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	#pos4:checked~.pos>label:nth-child(4){background:#666;}
	#pos5:checked~.pos>label:nth-child(5){background:#666;}
	#pos6:checked~.pos>label:nth-child(6){background:#666;}
</style>
<div id="slide">
	<input type="radio" name="pos" id="pos1" checked>
	<input type="radio" name="pos" id="pos2">
	<input type="radio" name="pos" id="pos3">
	<input type="radio" name="pos" id="pos4">
	<input type="radio" name="pos" id="pos5">
	<input type="radio" name="pos" id="pos6">
	
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	<p class="pos">
		<label for="pos1"></label>
		<label for="pos2"></label>
		<label for="pos3"></label>
		<label for="pos4"></label>
		<label for="pos5"></label>
		<label for="pos6"></label>
	</p>
</div>

</body>			

<script type="text/javascript">
// 	var $list = $('#album-contain').find('ul.album');
// 	var $prev = $('#album-contain').find('span.prev > a');
// 	var $next = $('#album-contain').find('span.next > a');
// 	var size = $list.children().outerWidth();
// 	var len =  $list.children().length;
// 	var cnt = 0;

// 	$list.css('width',len*size);

// 	trace();

// 	$('.bt-roll').children().bind('click',function(){

// 		var idx = $('.bt-roll').children().index(this);
// 		cnt = idx;
// 		$list.animate({'left': -(cnt*size)+'px' },'normal');

// 		var source2 = $('.bt-roll').children().find('img').attr('src').replace('_.png','.png');
// 		$('.bt-roll').children().find('img').attr('src',source2);

// 		var source = $(this).find('img').attr('src').replace('.png','_.png');
// 		$(this).find('img').attr('src',source);

// 		trace();

// 		if(cnt==0){
// 			$prev.hide();
// 			$next.show();
// 		}
// 		if(cnt>=len-1){
// 			$prev.show();
// 			$next.hide();
// 		}
// 		if(cnt>0&&cnt<len-1){
// 			$prev.show();
// 			$next.show();
// 		}

// 		return false;
// 	});

// 	$next.bind('click', function(){
// 		if(cnt>=len-1) return false;

// 		cnt++;
// 		$list.animate({'left': -(cnt*size)+'px'}, 'normal');

// 		var btOff = $('.bt-roll').children().find('img').attr('src').replace('_.png','.png');
// 		$('.bt-roll').children().find('img').attr('src',btOff);

// 		var btOn =  $('.bt-roll').children().eq(cnt).find('img').attr('src').replace('.png','_.png');
// 		$('.bt-roll').children().eq(cnt).find('img').attr('src',btOn);

// 		trace();

// 		if(cnt > 0) $prev.show();
// 		if(cnt>=len-1) $(this).hide();

// 		return false;
// 	});

// 	$prev.bind('click', function(){
// 		if(cnt==0) return false;

// 		cnt--;
// 		$list.animate({'left': -(cnt*size)+'px'}, 'normal');

// 		var btOff = $('.bt-roll').children().find('img').attr('src').replace('_.png','.png');
// 		$('.bt-roll').children().find('img').attr('src',btOff);

// 		var btOn =  $('.bt-roll').children().eq(cnt).find('img').attr('src').replace('.png','_.png');
// 		$('.bt-roll').children().eq(cnt).find('img').attr('src',btOn);

// 		trace();

// 		if(cnt <= len-1) $next.show();
// 		if(cnt==0) $(this).hide();

// 		return false;
// 	});

// 	function trace(){
// 		$('#trace').find('span').text(cnt);
// 	}

</script>
<!-- 	</body> -->
<!-- 	</html> -->