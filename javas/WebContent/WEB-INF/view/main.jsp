<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style type='text/css'>
	body {
		margin:0;
	}
	#slidebox {
		position:relative;
		width:1600px;
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
		width:1600px;
		height:500px;
	}
	#slidebox ul li img {
		width:1600px;
		height:500px;
	}
</style>
<body>
	<div id="slidebox">
		<ul id="slider">
			<li><img alt="main" src="/style/새메인.png"/></li>
			<li><img alt="wader" src="/style/날씨소개.png"></li>
			<li><img alt="callender" src="/style/캘랜더.png"></li>
		</ul>
	</div>
	<div>
	  <img alt="javas" src="/style/javas1.png">
	  <img alt="good" src="/style/좋은점.png">
	  <img alt="join" src="/style/가입문2.png">
	</div>
	<script type='text/javascript'>
		var x = 1600;
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


