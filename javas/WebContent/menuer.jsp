<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<html>
<head>
<meta charset="UTF-8">


<style type='text/css'>

	body {
		margin:0;
	}
	#slidebox {
	    left:300px;
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
		width:1034px;
		height:500px;
	}
   
    
</style>

<body style="position:relative;">
<div style="background-image:url('/style/표.png');">
	<div id="slidebox" style="position: relative;" >
	
		<ul id="slider">
			<li>
			   <div style="position: absolute; " align="center">
                  <img alt="table" src="/style/메뉴얼표.png">
              </div>
			</li>
			<li>              
              <div style="position: absolute;" align="center">
               <img alt="lain" src="/style/메뉴얼날씨.png">
              </div>
			</li>
			<li>
			   <div style="position: absolute;" align="center">
                  <img alt="table" src="/style/메뉴얼캘랜더.png">
              </div>
			</li>
			<li>
			   <div style="position: absolute;" align="center">
                  <img alt="table" src="/style/메뉴얼길찾기.png">
              </div>
			</li>
		</ul>
		
	</div>
	</div>
	<script type='text/javascript'>


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