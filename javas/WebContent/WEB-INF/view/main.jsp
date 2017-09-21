<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">


<style type='text/css'>
	.modal-dialog.modal-fullsize { 
		width: 25%; 
		height: 20%;
		float: center; 
		margin: 20px 600px; 
		padding: 0;
	}
	.modal-content.modal-fullsize {
	  height: auto;
	  min-height: 100%;
	  border-radius: 5px; 
	}
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
	
		background-color: rgba(0, 0, 0, 0.5);
	
	  -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
		-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
		box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
		
	  -webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		
	  color: #FFFFFF;
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
		top: 5%;
		left: 20;
		opacity: 1;
	}   
</style>
<body style="position:relative;">
	<div id="slidebox" style="position: relative;">
		<ul id="slider">
			<li><img alt="main" src="/style/새메인.png"/></li>
			<li>
              <div style="position: absolute; left: 300px; height:400px; bottom: 0px;">
               <button id="wbt" data-toggle="modal" data-target="#myModal"
                style="background-color: transparent; border: none;">
                <span data-tooltip-text="날씨 바로가기">
                <img alt="lain" src="/style/날씨예보.png"
                onmouseover="this.src='/style/날씨예보반전.png'" 
                onmouseout="this.src='/style/날씨예보.png'"
                style="width: 110px;height:110px;">
                </span>
              </button>
              <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-fullsize">
      <div class="modal-content modal-fullsize">
        <div class="modal-header" style="background-color: #D2E4F1;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="local" class="modal-title"></h4>
        </div>
       	 <div class="modal-body" style="padding-top: 0; padding-bottom: 15px;">
          <table id="content">
          </table>
         </div>
        <div class="modal-footer" style="background-color: #D2E4F1; padding-top :9px; padding-bottom: 12px">
        <img src="/style/javasicon.png" style="width: 62px; height: 16px" >
        </div>
      </div>
    </div>
  </div>
              </div>
              <div style="position: absolute; left:480px; height:150px; bottom: 0px;">
              <button id=cal style="background-color: transparent; border: none;">
               <span data-tooltip-text="캘랜더 바로가기">
               <img alt="callender" src="/style/캘랜더.png"
                onmouseover="this.src='/style/캘랜더반전.png'" 
                onmouseout="this.src='/style/캘랜더.png'"
                style="width:100px; height:100px;">
                </span>
              </button> 
              </div>
                 <div style="position: absolute; left:1150px; height:300px; bottom: 0px;">
               <button id=cal style="background-color: transparent; border: none;">
              <span data-tooltip-text="지도 바로가기">
               <img alt="callender" src="/style/지도.png"
                onmouseover="this.src='/style/지도반전.png'" 
                onmouseout="this.src='/style/지도.png'"
                style="width:100px; height:100px;">
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
	        <img alt="login2" src="/style/설정하러.png">	     
	     </a>
	   </div>
	</div>
	<div class="modal fade" id="myModal2" role="dialog">
              <div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 550px;">
				<div class="modal-header" align="center"
					style="background-color: #D2E4F1;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>
						오늘은 <span class="glyphicon glyphicon-music"></span>
					</h3>
				</div>
				<div class="modal-body"
					style="padding: 40px 50px; padding-top: 10px;">
					<div class="row" style="text-align: left;">
						<div class="col-sm-5">
							<h3>
								<span class="glyphicon glyphicon-ok"></span> 일정
							</h3>
							<table style="font-size: 10pt;">
								<c:forEach var="i" items="${today}">
									<tr>
										<td style="padding-right: 10px; padding-top: 5px;"><c:choose>
												<c:when test="${i.CTIME ne null }">
													<span id="${i.NUM}"></span>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose></td>
										<td><b>${i.TITLE}</b></td>
									</tr>
								</c:forEach>
							</table>
							<c:if test="${empty today}">
								<p id="today">오늘의 일정이 없습니다.</p>
							</c:if>
						</div>
						<div class="col-sm-7">
							<h3>
								<span class="glyphicon glyphicon-ok"></span> D-day
							</h3>
							<c:forEach var="i" items="${dday}">
								<p>
									<b>${i.TITLE}</b>까지D${i.DD}일남았습니다.
								</p>
							</c:forEach>
							<c:if test="${empty dday}">
								<p id="dday">설정해둔 D-day가 없습니다.</p>
							</c:if>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<img src="/style/javasicon.png" style="width: 62px; height: 16px">
				</div>
			</div>
		</div>
	</div>
<script type='text/javascript'>


	  var swh = 2;
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
    	 if(swh == 2) {
    	  	 changeSlide();
         }
         if(swh != 2) {
        	 swh++;
         }
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

function initMap() {
	$("#wbt").click(function(){
		swh = 0;	
		var address;
			var add;
		navigator.geolocation.watchPosition(function(e) {
			var geocoder = new google.maps.Geocoder();
			var latlng = new google.maps.LatLng(e.coords.latitude, e.coords.longitude);
			geocoder.geocode({'latLng' : latlng}, function(results, status) {
				address = results[2].formatted_address;
				add = "<b>"+address.substring(5)+"</b>";
			$("#local").html(add);
			
			$.ajax({
				url : "https://api.openweathermap.org/data/2.5/weather",
				data : {
					"lat" : e.coords.latitude,
					"lon" : e.coords.longitude,
					"APPID" : "86e306162a4303e8b644973a4ce00b65"
				}
			}).done(function(rst){
				var data = rst;
				$.ajax({
					url : "/function/weatherCodeAjax.jv",
					data : {
						"code" : data.weather[0].id
					}	
				}).done(function(rst2){
					var data2 = rst2;
					var content = "";
					content += "<th><td style=\"text-align: center;\"><img alt=\""+data.weather[0].icon+"\" src=\"/style/weather/weather-icon/"+data.weather[0].icon+".png\" style=\"height: 100px; width: 100px;\"/>";
					content += "<span style=\"font-size: 40pt; vertical-align: middle; font-weight: 700;\">"+parseInt(data.main.temp - 273.15)+"˚C</span><br/>";
					content += "<b style=\"font-size:24px;\">"+data2.MEAN+"</b></td>";
					content += "<td style=\"padding-left: 20px; padding-top: 27px; vertical-align: top; \"><b>풍속 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.wind.speed+"m/s<br/>";
					content += "습도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.main.humidity+"%</b>";
					$("#content").html(content);
					
					var message = address.substring(5)+"의 날씨를 알려드리겠습니다. 현재 "+data2.MEAN+data2.VOICE
					+" 기온은 "+parseInt(data.main.temp - 273.15)+"도, 풍속은 "+data.wind.speed+", 습도는"+data.main.humidity+"퍼센트 입니다.";
					$.ajax({
						url : "/tts/ttsAjax.jv",
						data : {
							"message" : message
						}
					}).done(function(rst3){
						var audio = new Audio("/voice//"+rst3);
						audio.play();
						$('#myModal').on('hide.bs.modal', function (e) {
							audio.pause();
							});
						$('#myModal').on('show.bs.modal', function (e) {
							audio = new Audio("/voice//"+rst3);
							audio.play();
							});
						deleteFile(rst3);
						
					});
				});
				var deleteFile = function(rst3) {
					$.ajax({
						url : "/tts/ttsDeleteAjax.jv",
						data : {
							"tempname" : rst3
						}
					})
				};
			});
		});
		});
	});
	}
	
$(document).ready(function() {

	$("#cal").click(function() {   
		swh = 0;
		$("#myModal2").modal();
		var message = "오늘의 일정은";
		$.ajax({
			url : "/function/calTtsAjax.jv",
		}).done(function(rst) {
			if(${!empty today}) {
				for (var i = 0; i < rst.length; i++) {
				if(rst[i].CTIME != null) {
					var getTime = (rst[i].CTIME).substring(0, 2);
					var intTime = parseInt(getTime);
					if (intTime < 12 ) { 
						message += " 오전  "+rst[i].CTIME;
						$("#"+rst[i].NUM).html("오전 "+rst[i].CTIME);
						} else { 
							var getMinutes = (rst[i].CTIME).substring(3,5);
							getTime = intTime - 12;  
							message += " 오후  "+getTime+" :  "+getMinutes;
							$("#"+rst[i].NUM).html("오후 "+getTime+":"+getMinutes);
							}
						}
					message +="   "+rst[i].TITLE+"  , "; 
				} 
				message += "입니다. ";
			 } else {
				 message += "없습니다.";
			 }
			message += "오늘의 D-day는 ";
		if(${!empty dday}) { 
			var dday = "${dday[0].DD}".substring(1, "${dday[0].DD}".length); 
			message += "${dday[0].TITLE}까지  "+dday+"일남았습니다.";
		} else {
			message += "없습니다.";
		}
			$.ajax({
				url : "/tts/ttsAjax.jv",
				data : {
					"message" : message
				}
		}).done(function(rst3){ 
				var audio = new Audio("/voice//"+rst3);
				audio.play();   
				$('#myModal2').on('hide.bs.modal', function (e) {
					audio.pause();
					});
				$('#myModal2').on('show.bs.modal', function (e) {
					audio = new Audio("/voice//"+rst3);
					audio.play();
					});
				deleteFile(rst3);
			});
		
			var deleteFile = function(rst3) { 
			$.ajax({
				url : "/tts/ttsDeleteAjax.jv",
				data : {
					"tempname" : rst3 
				}
			})
			};  
		});
	});
});

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

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD--k3vwuB9cAExy9ezTOAo-FR6ajxUctw&callback=initMap"
	async defer></script>



