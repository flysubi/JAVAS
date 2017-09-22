<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    


<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
<style>

   #slidebox {
      position:relative;
      width:1034px;
      height:500px;
      overflow:hidden;
      white-space:nowrap;
      
   }
   #slidebox ul#slider {
      list-style:none;
      margin:0;
      padding:0;
   }
   #slidebox ul li {
      position:absolute;
      width:1034px;
      height:500px;
   }
   #slidebox ul li img {
      width:134px;
      height:500px;
   }



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
<div id="slidebox">
   <ul id="slider">
	<li><input type="radio" name="pos" id="pos1" checked></li>
	<li><input type="radio" name="pos" id="pos2"></li>
	<li><input type="radio" name="pos" id="pos3"></li>
	<li><input type="radio" name="pos" id="pos4"></li>
	<li><input type="radio" name="pos" id="pos5"></li>
	<li><input type="radio" name="pos" id="pos6"></li>
   </ul>
</div>	
	<div>
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
</div>


</body>			

<script type="text/javascript">

var x = 1034;
var slider = document.getElementById("slider");
var slideArray = slider.getElementsByTagName("li");
var slideMax = slideArray.length - 1;
var curSlideNo = 0;

for (i = 0; i <= slideMax; i++) {
   if (i == curSlideNo) slideArray[i].style.right = 0;
   else slideArray[i].style.right = -x + "px";
}

slider.addEventListener('click', function () {
   changeSlide();
}, false);

var aniStart = false;
var next = 1;
var changeSlide = function(){
   if (aniStart === true) return;
   next = curSlideNo + 1;
   if (next > slideMax) next = 0;
   aniStart = true;
   sliding();
}

function sliding() {
   var curX = parseInt(slideArray[curSlideNo].style.right, 10);
   var nextX = parseInt(slideArray[next].style.right, 10);
   var newCurX = curX + 50;
   var newNextX = nextX + 50;
   if (newCurX >= x) {
      slideArray[curSlideNo].style.right = -x + "px";
      slideArray[next].style.right = 0;
      curSlideNo = curSlideNo + 1;
      if (curSlideNo > slideMax) curSlideNo = 0;
      aniStart = false;
      return;
   }
   slideArray[curSlideNo].style.right = newCurX + "px";
   slideArray[next].style.right = newNextX + "px";
   setTimeout(function () {
      sliding();
   }, 20);
}
//setInterval(changeSlide,2000);

</script>
	</body>
	</html>