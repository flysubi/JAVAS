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
	
	#realTimer  {
       padding: 10px 50px; 
       width: 260px; 
       font-weight:bold;  
       font-family:'나눔 고딕';  
       font-size: 30px;
} 
</style>

<body style="position:relative;">
	<div id="slidebox" style="position: relative;">
		<ul id="slider">
			<li><img alt="main" src="/style/새메인.png"/></li>
			<li><img alt="wader" src="/style/기능.png">
			 <div style="position:absolute; left:665px; height:310px; bottom:0px;">
              <p id="realTimer"></p>
             </div>
			</li>
		</ul>
	</div>
	  
	<div>
	  <img alt="javas" src="/style/javas1.png">
	  <img alt="good" src="/style/좋은점.png">
	</div>
	
	
	<div style="position: relative;">
	   <img alt="join" src="/style/가입문2.png">
	  <div style="position: absolute; left:545px; height: 10px;">
	 <a href="/user/join.jv"><input type="image" src="/style/회원가입하러.png"></a>
	  </div>
	  <div style="position: absolute; left:1280px;">
	   <a href="/user//login.jv"><input type="image" src="/style/설정하러.png"></a>
	  </div>
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
		
//----------------슬라이드----------------------------------------------

function timer () { 

	 var date = new Date(); 

	 var hour = date.getHours(); 

	 var ampm = 
		 ( hour  < 12 || hour == 24 ) ? " A.M" : " P.M";  
	      hour = hour % 12 || 12; 
	      hour = ( hour > 9 ) ? hour : "0" + hour;


	 var minute = date.getMinutes(); 
	      minute = ( minute > 9 ) ? minute : "0" + minute; 

	 var second = date.getSeconds(); 
	      second = ( second > 9 ) ? second : "0" + second; 

	 var millisec = date.getMilliseconds(); 
	      millisec = ( millisec > 99 ) ? millisec : ( millisec > 9 ) ? "0" + millisec : "00" + millisec; 



	 var timeString = hour + ":" + minute + ":" + second +"<span style=\"font:18pt 'Monaco';font-weight:bold\">"+ ampm+"</span>"; 
	 // 또는,  var timeString = hour + ":" + minute + ":" + second + ":" + millisec + ampm; 


	 var year = date.getFullYear(); 
	 var month = date.getMonth() + 1; 
	 var day = date.getDate(); 


	 var arrayWeek = [ "SUN" , "MON" , "TUE" , "WED" , "THUR" , "FRI" , "SAT" ]; 
	 // 또는, var arrayWeek = [ "일. " , "월. " , "화. " , "수. " , "목. " , "금. " , "토. " ]; 


	 var week = date.getDay(); 
	       week = arrayWeek [ week ]; 


	 var dateString = "<span style=\"font:18pt '나눔 고딕'; font-weight:bold\">"+year + ". " + month + ". " + day + ".</span> <span style=\"font:14pt 'Consolas'; font-weight:bold\">" + week+"</span>"; 


	 return  dateString +"</br>"+ timeString; 
} 



var tag = document.getElementById( "realTimer" ); 

     tag.innerHTML = timer(); 

setInterval ( function() { tag.innerHTML = timer(); } , 1000 ); 

// function timer(){ 

// 	 var date = new Date(); 

// 	 // 그 지역의 날짜 (locale date). 
// 	 var dateString = date .toLocaleDateString(); 

// 	 // 그 지역의 시간 (locale time). 
// 	 var timeString = date .toLocaleTimeString(); 

// 	 var text = dateString + " " + timeString; 

// 	 // 'text'만 저장하고, 이 함수 끝내기. 
// 	 return text; 
// } 


// function get_timer(){ 

// 	 // 함수값 불러와서, 태그 안에 집어넣기. 
// 	 document.getElementById( "realTimer" ).innerHTML = timer(); 

// 	 // 1000 밀리초(=1초) 후에, 이 함수를 실행하기 (반복 실행 효과). 
// 	 setTimeout( "get_timer()", 1000 ); 
// }


// // (페이지가 열리자마자) 함수를 불러오기. 
// var callFunction = get_timer(); 

	</script>
</body>
</html>


