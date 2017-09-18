<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="row">
<div class="col-md-4 col-sm-4">

</div>
<div class="col-md-4 col-sm-4"></div>
<div class="col-md-4 col-sm-4"></div>
</div>
</body>
</html>
<script>
	var today = new Date();
	var month = today.getMonth()+1 > 10 ? today.getMonth()+1 : "0"+(today.getMonth()+1);
	var year = today.getYear();
	var oneday = String(year).substring(1)+"/"+month+"/"+"01";
	var lastday = String(year).substring(1)+"/"+month+"/"+new Date(year, month, 0).getDate();
	window.alert(oneday);
	window.alert(lastday);
	
	
</script>