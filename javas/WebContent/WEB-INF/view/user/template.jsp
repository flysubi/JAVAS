<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<style>
	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
		background-color: LightSkyBlue;
	}
	a {
		color: #6aa563;
		font-weight: 700;
	}
</style>
<div class="row" style="margin-top: 30px;">
	<div class="col-md-2">
		<ul class="nav nav-stacked nav-pills">
			<li class="${section eq 'user/userInfo' ? 'active' : '' }">
			<a href="/user/userInfo.jv">기본정보</a></li>
		</ul>
	</div>
	<div class="col-md-10">
		<tiles:insertAttribute name="section"/>
	</div>
</div>