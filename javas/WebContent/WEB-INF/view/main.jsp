<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    
   [data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:after {
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

	background-color: rgba(0,0, 0, 0.5);

  -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	
  -webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	
    color: #ffffff;
	font-size: 12px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 50px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;

	opacity: 0;
	left: -9999px;
  top: 90%;
	
	content: attr(data-tooltip-text);
}

[data-tooltip-text]:hover:after {
    top:5%;
	left: 20px;
	opacity: 1;
}
   
    
</style>

<body style="position:relative;">
	<div id="slidebox" style="position: relative;">
		<ul id="slider">
			<li><img alt="main" src="/style/새메인.png"/></li>
			<li>            
              <div style="position: absolute; left: 300px; height:400px; bottom: 0px;">
               <button 
                style="background-color: transparent; border: none;"
                onclick="location.href='/function/weather.jv';">
                <span data-tooltip-text="날씨 바로가기">
                <img alt="lain" src="/style/날씨예보.png"
                onmouseover="this.src='/style/날씨예보반전.png'" 
                onmouseout="this.src='/style/날씨예보.png'"
                style="width: 110px;height:110px;">
                </span>
              </button>
              </div>
              
              <div style="position: absolute; left:480px; height:150px; bottom: 0px;">
              
               <button 
               style="background-color: transparent; border: none;"
                onclick="location.href='/function/calendar.jv';">
                <span data-tooltip-text="캘랜더 바로가기">
              <img alt="callender" src="/style/캘랜더.png"
                onmouseover="this.src='/style/캘랜더반전.png'"
                onmouseout="this.src='/style/캘랜더.png'"
                style="width:110px; height:110px;">
                </span>
                </button>
                
              </div>
              
                 <div style="position: absolute; left:1150px; height:300px; bottom: 0px;">
              <button 
              style="background-color: transparent; border: none;"
               onclick="location.href='/function/map.jv';">
               <span data-tooltip-text="지도 바로가기">
               <img alt="map" src="/style/지도.png"
                onmouseover="this.src='/style/지도반전.png'"
                onmouseup=""
                onmouseout="this.src='/style/지도.png'"
                style="width:110px;height:110px;">
               </span>

              </button>
              </div>
			
			 <img alt="wader" src="/style/기능.png">
			
			 <div style="position:absolute; left:665px; height:310px; bottom: 0px;">		
              <p id="realTimer"></p>     
             </div> 
			</li>
		</ul>
	</div>
	<div style="position: relative;">
	  <img alt="javas" src="/style/javas2.png">
	  <img alt="good" src="/style/좋은점.png">
	  <img alt="join" src="/style/가입문.png">
	  
	  <div style="position: absolute; left: 550px;  top:855px;">
	       <a href="/user/join.jv">
	         <img alt="join2" src="/style/회원가입하러.png">
	       </a>
	   </div>
	   <div style="position:absolute; left:1280px; top:855px">
	     <a href="/menuer.jv">
	        <img alt="login2" src="/style/메뉴얼로.png">	     
	     </a>
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


$(function(){
	$("span.tooltip").css({
	    opacity:"0.9",
	    position:"absolute",
	    display:"none"
	}); 
	$("a").mouseover(function(){
	    $("span.tooltip").fadeIn();
	}).mouseout(function(){
	    $("span.tooltip").fadeOut();
	}).mousemove(function(e){
	    $("span.tooltip").css({
		"top":e.pageY+10+"px",
		"left":e.pageX+10+"px"
	    });
	});
});
	</script>
</body>
</html>


