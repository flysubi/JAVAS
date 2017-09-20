<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
	{
	background-color: silver;
}

. {
	color: #6aa563;
	font-weight: 700;
}
</style>

<div class="row" style="margin-top: 30px;">
	<div class="col-md-2" id="d"
		style="margin-top: 30px; margin-left: 0px;">
		<ul class="nav nav-pills">
			<a href="/memo/write.jv"><button type="button"
				style="width: 100px; height: 30px; background-color: #5bc0de; color: white; border: 1px solid #5bc0de; font-size: 15px; position: absolute; left: 0px;"
				onclick="location.href='/memo/write.jv?'">쪽지쓰기</button></a>
			<button type="button"
				style="width: 100px; height: 30px; background-color: #5bc0de; color: white; border: 1px solid #5bc0de; font-size: 15px; position: absolute; left: 100px;"
				onclick="location.href='/memo/write.jv?my=${auth}'">내게쓰기</button>
		</ul>

		<ul class="nav nav-pills nav-stacked" style="margin-top: 50px;">
			<li class="${active eq 'list' ? 'active' : '' }" align="left"
				style="margin-left: 0px;"><a href="/memo/list.jv">받은쪽지함&nbsp;${sessionScope.memo }</a></li>
			<li class="${active eq 'mylist' ? 'active' : '' }" align="left"
				style="margin-left: 0px;"><a href="/memo/mylist.jv">내게쓴쪽지함&nbsp;${sessionScope.mymemo }</a></li>
			<li class="${active eq 'sendlist' ? 'active' : '' }" align="left"
				style="margin-left: 0px;"><a href="/memo/mysend">보낸쪽지함&nbsp;${sessionScope.mysend }</a></li>
			<li class="${active eq 'savelist' ? 'active' : '' }" align="left"
				style="margin-left: 0px;"><a href="/memo/savelist">쪽지보관함&nbsp;${sessionScope.smemo }</a></li>
		</ul>
	</div>

	<div class="col-md-10" id="d2">
		<tiles:insertAttribute name="section" />
	</div>

</div>



<script>

	
	
		$("#c").click(function() {
			
			if("${name == write && name == mywrite}" ) {
				$("#d").animate({left: '-1000px'}, 500 );
				$("#d2").animate({left: '-400px'}, 500 );
			}
			
			if("${name == list}" ) {
				$("#d").animate({left: '-1000px'}, 500 );
				$("#d2").animate({left: '-100px', top: '-300px', height: '100%',
			        width: '100%'},  );
			}
		});
	
	
	
	
	
	
</script>

