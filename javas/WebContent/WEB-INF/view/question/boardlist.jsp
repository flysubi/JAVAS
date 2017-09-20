<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.btn {
	border: none;
	color: black;
	font-size: 15px;
	cursor: pointer;
	margin-left: 1ps;
	margin-right: 1ps;
}

.bt {
	background-color: siver;
	color: black;
	border: 1px solid black;
	margin-left: 1px;
}

.button {
	background-color: sliver;
	border: 1px solid black;
	color: black;
	margin-left: font-size: 7px;
}

<
.small1 {
	width: 100px;
}

.small2 {
	height: 50px;
}

#panel {
	padding: 5px;
	text-align: center;
	font-size: 15px;
	background-color: #e5eecc;
	border: solid 1px #c3c3c3;
}
</style>




<div class="container-fluid">

	<div class="row">
		<div class="col-sm-12"
			style="background-color: white; border: 1px solid black; margin-top: 2px;">
			<div class="col-sm-12"
				style="background-color: white; border: 1px solid black; margin-top: 2px;">
				<div id="exTab1" class="container">
					<ul class="nav nav-pills">
						<li class="active"><a href="#1a" data-toggle="tab">Overview</a>
						</li>
						<li><a href="#2a" data-toggle="tab">F&Q</a></li>
						<li><a href="#3a" data-toggle="tab">Q&A</a></li>
						<li><a href="#4a" data-toggle="tab">나의 Q&A</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12"
				style="background-color: white; height: 100px; border: 1px solid black; margin-top: 5px; margin-bottom: 5px; margin-left: 10px; padding: 0px; width: 98%;">
				<div id="tabs-1">
					<div class="detail_info_table fabric">
						<table style="margin-top: 0px;">
							<colgroup>
								<col width="9%" />
								<col width="*" />
								<col width="2%" />
								<col width="9%" />
								<col width="*%" />
								<col width="2%" />
								<col width="9%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th><img class="small2"
										src="http://aboki.img8.kr/2015_re/shop/faq_book.png"></th>
									<td>
										<p>
											<span>문의전 자주 묻는 질문 확인</span>
										</p>
										<p>· 원하는 답변이 있을 지도! 자주 묻고 답하는 질문을 찾아주세요.</p>
									</td>

									<td>></td>

									<th><img class="small2"
										src="http://aboki.img8.kr/2015_re/shop/faq_edit.png"></th>
									<td>
										<p>
											<span>1:1 상담 </span>
										</p>
										<p>· 자주 묻는 질문에 없다면 1:1 상담을 이용해주세요.</p>
									</td>

									<td>></td>

									<th><img class="small2"
										src="http://aboki.img8.kr/2015_re/shop/faq_phone.png"></th>
									<td>
										<p>
											<span>아보키 고객센터</span>
										</p>
										<p>· 궁금한 점이 더 있으시다면 상담원과 통화해주세요! 친절히 답변해드리겠습니다.</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>



		</div>
		<div class="col-sm-12"
			style="background-color: white; border: 1px solid black; margin-top: 2px;">
			<div align="center">
				<h4>
					<img alt="FAQ 자주 묻는 질문" src="/style/tit_faq_sch_form.gif" />
				</h4>
				<form action="/question/list.jv">
					<div class="input-group">
						<span><input type="text" class="form-control"
							placeholder="Search" name="search" style="width: 250px;"></span>&nbsp;
						<button type="submit" class="btn bt">
							검색 <span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</form>


			</div>


		</div>




	</div>
	<div class="table-responsive">
		<table class="table" id="question">
			<thead>
				<tr class="Info">
					<th width="5%"></th>
					<th width="50%">제목</th>
					<th width="20%">작성자</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>

				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${!empty postsList }">
						<c:forEach items="${postsList }" var="i">

							<tr>

								<th>${i.FT_NUM }</th>


								<th>${i.FT_TITLE }</a>
								</th>




								<th>${i.FT_WRITER }</th>
								<th>${i.FT_LIKE }</th>
								<th><c:choose>
										<c:when test="${i.FT_DIFF < 1 }">
											<fmt:formatDate value="${i.FT_DATE }" pattern="HH:mm" />
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${i.FT_DATE }" pattern="yyyy-MM-dd" />
										</c:otherwise>
									</c:choose></th>

							</tr>


							<tr id="panel">
								<td colspan="5">
									<div class="tb-slide">
										<dl class="qst">
											<dt>
												<img alt="질문"
													src="/images/d3/modern_simple/common/icon_faq_qst.gif">
											</dt>
											<dd>입금확인해주세요</dd>
										</dl>
										<dl class="adv">
											<dt>
												<img alt="답변"
													src="/images/d3/modern_simple/common/icon_faq_adv.gif">
											</dt>
											<dd>
												ABOKI는 무통장입금, 카드결제, 계좌이체, 핸드폰결제, 에스크로이체가 가능합니다.<br> <br>
												무통장입금 결제시에는 자동 입금 확인 시스템이 마련되어 있어<br> 주문시 선택해주신 은행계좌로
												입금자명과 금액이 동일할 경우 자동으로 입금확인이 되고 있습니다.^^<br> <br>
												주문후에 일주일 이내에 입금확인이 되지 않으면 주문서는 자동을 주문취소됩니다.
											</dd>
										</dl>
									</div>
								</td>

							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" style="text-align: center"><br />게시글이 없습니다.</td>
						</tr>

					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<ul class="pagination">
		<c:forEach var="i" begin="1" end="${size}">
			<li class="${i eq page ? 'active' :'' }"><a
				href="/question/list.jv?p=${i }">${i}</a></li>
		</c:forEach>
	</ul>
</div>
<script>
	$('tr').bind('click', function() {
		var trNum = $(this).closest('tr').prevAll().length;
		$("#panel").closest('tr').;
		
	});
</script>