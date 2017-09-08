<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<style>
	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover	{
	background-color: LightSkyBlue;
	}

	a {
	color: #6aa563;
		font-weight: 700;
	}
</style>
</style>
<div class="row" style="margin-top: 30px;">
	<div class="col-md-2" style="margin-top: 30px; margin-left: 0px;">
		<ul class="nav nav-pills">

			<li class="active" style="backgroun-color: silver"><a href="/memo/write.jv">쪽지쓰기</a></li>
			<li class="active"><a href="/memo/mywrite.jv">내게쓰기</a></li>
		</ul>
		
		<ul class="nav nav-pills nav-stacked" style="margin-top: 20px;">
			<li class="${active eq 'list' ? 'active' : '' }" align="left" style="margin-left: 0px;"><a href="/memo/list.jv">받은쪽지함&nbsp;${sessionScope.memo }</a></li>
			<li class="${active eq 'mylist' ? 'active' : '' }" align="left" style="margin-left: 0px;"><a href="#">내게쓴쪽지함&nbsp;${sessionScope.mymemo }</a></li>
			<li class="${active eq 'sendlist' ? 'active' : '' }" align="left" style="margin-left: 0px;"><a href="#">보낸쪽지함</a></li>
			<li class="${active eq 'savelist' ? 'active' : '' }" align="left" style="margin-left: 0px;"><a href="#">쪽지보관함</a></li>
		</ul>
	</div>
	
	<div class="col-md-10">
		<tiles:insertAttribute name="section" />
	</div>
	
</div>