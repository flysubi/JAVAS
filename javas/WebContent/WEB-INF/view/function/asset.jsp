<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="row" style="margin-top: 20px;">
<div class="col-md-4 col-sm-4">
<button id="back" style="background-color: white; border: 0; height: 24px; width: 24px;"><i class="fa fa-angle-left" style="font-size: 24px;"></i></button>
<span id="date" style="font-size: 24px;"></span>
<button id="front" style="background-color: white; border: 0; height: 24px; width: 24px;"><i class="fa fa-angle-right" style="font-size: 24px;"></i></button>
<br/>
<div id=list></div>
</div>
<div class="col-md-4 col-sm-4"></div>
<div class="col-md-4 col-sm-4"></div>
</div>
</body>
</html>
<script>
	var today = new Date();
	var month = today.getMonth()+1 >= 10 ? today.getMonth()+1 : "0"+(today.getMonth()+1);
	var year = today.getYear();
	var first = String(year).substring(1)+"/"+month+"/"+"01";
	var last = String(year).substring(1)+"/"+month+"/"+new Date(year, month, 0).getDate();
	var date = first + " ~ " + last;
	
	$("#date").html(date);
	$("#back").click(function(){
		month = month-1 >= 10 ? month-1 : "0"+(month-1);
		if(month == 00) {
			month = 12;
			year -= 1;
		}
		
		var first = String(year).substring(1)+"/"+month+"/"+"01";
		var last = String(year).substring(1)+"/"+month+"/"+new Date(year, month, 0).getDate();
		var date = first + " ~ " + last;
		$("#date").html(date);
	});
	$("#front").click(function(){
		month *= 1;
		month = month+1 >= 10 ? month+1 : "0"+(month+1); 
		if(month == 13) {
			month = "01";
			year += 1;
		}
		var first = String(year).substring(1)+"/"+month+"/"+"01";
		var last = String(year).substring(1)+"/"+month+"/"+new Date(year, month, 0).getDate();
		var date = first + " ~ " + last;
		$("#date").html(date);
	});
	var getAsset = function() {
		$.ajax({
			url : "/function/assetListAjax.jv",
			data : {
				"first" : first,
				"last" : last
			}
		}).done(function(rst){
			var list = "";
			for(var i=0; i<rst.length; i++) {
				//if(i == 0 || rst[i].) 
				window.alert(rst[i].INCOME);
			}
		})
	}
	getAsset();
</script>	