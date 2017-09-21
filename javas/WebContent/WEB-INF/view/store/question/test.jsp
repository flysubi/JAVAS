<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
#faqWrap #faqTable tr.slide-hide,
#faqWrap #faqTable tr.slide-hide dl {
    display: none;
}
#faqWrap #faqTable tr.slide-show {
    display: table-rows;
    *display: block;
}
#faqWrap #faqTable tr.slide-show dl {
    display: block;
}
#faqWrap #faqTable tr.slide-hide td,
#faqWrap #faqTable tr.slide-show td {
    cursor: default;
    background-color: #fffae5;<style>
}


</style>
<div id="faq-category">
	<ul class="faq-menu">
		<li><a href="javascript:faqSearch('category','ALL');">전체보기</a></li>
		<li><a href="javascript:faqSearch('category','5');">주문문의</a></li>
		<li><a href="javascript:faqSearch('category','6');">입금문의</a></li>
		<li><a href="javascript:faqSearch('category','7');">배송문의</a></li>
		<li><a href="javascript:faqSearch('category','8');">반품문의</a></li>
		<li><a href="javascript:faqSearch('category','9');">취소/환불문의</a></li>
		<li><a href="javascript:faqSearch('category','10');">회원문의</a></li>
		<li><a href="javascript:faqSearch('category','11');">기타문의</a></li>
		<li><a href="javascript:faqSearch('category','12');">해외배송</a></li>
	</ul>
	<!-- .faq-menu-->
</div>
<!-- .faq-category-->
<div id="faqTable">
	<table summary="분류 제목">
		<caption>질문/답변</caption>
		<colgroup>
			<col width="55" />
			<col width="150" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">
					<div class="tb-center">번호</div>
				</th>
				<th scope="col">
					<div class="tb-center">분류</div>
				</th>
				<th scope="col">
					<div class="tb-center">제목</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr uid="23">
				<td>
					<div class="tb-center">42</div>
				</td>
				<td>
					<div class="tb-center">반품문의</div>
				</td>
				<td>
					<div class="tb-left">반품이 불가능한 상품은 어떤 상품인가요?</div>
				</td>
			</tr>
			<tr class="slide-hide">
				<td colspan="3">
					<div class="tb-slide">
						<dl class="qst">
							<dt>
								<img alt="질문"
									src="/images/d3/modern_simple/common/icon_faq_qst.gif">
							</dt>
							<dd>반품이 불가능한 상품은 어떤 상품인가요?</dd>
						</dl>
						<dl class="adv">
							<dt>
								<img alt="답변"
									src="/images/d3/modern_simple/common/icon_faq_adv.gif">
							</dt>
							<dd>
								- 상품 수령후 3개월이 지난경우.<br> - 상품을 착용하여 사용한 경우(오염 냄새 주름 등)<br>
								- 신발 및 수트 상품의 경우 동봉되는 흰색 신발박스 및 수트케이스가 분실 된 경우.<br> - 실밥은
								제거가 가능함으로 불량사유가 되지 않습니다. <br> <br> 위와 같은 경우에는 반품처리가
								불가능하니 꼭 읽어주시고 확인해주세요~!<br>
							</dd>
						</dl>
					</div>
				</td>
			</tr>
			<tr uid="36">
				<td>
					<div class="tb-center">41</div>
				</td>
				<td>
					<div class="tb-center">반품문의</div>
				</td>
				<td>
					<div class="tb-left">상품받았는데 환불하고 싶어요. 어떻게 하나요 ?</div>
				</td>
			</tr>
			<tr class="slide-hide">
				<td colspan="3">
					<div class="tb-slide">
						<dl class="qst">
							<dt>
								<img alt="질문"
									src="/images/d3/modern_simple/common/icon_faq_qst.gif">
							</dt>
							<dd>상품받았는데 환불하고 싶어요. 어떻게 하나요 ?</dd>
						</dl>
						<dl class="adv">
							<dt>
								<img alt="답변"
									src="/images/d3/modern_simple/common/icon_faq_adv.gif">
							</dt>
							<dd>
								반품 요청시 상품을 받아보신 후 3개월 이내로 보내주셔야하며<br> 상품하자, 또는 받아보신 상품이
								상세내용과 다를경우 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에로 반품 게시판, 전화상담을 통해
								사전접수 후 <br> CJ 택배 (1588- 5353)를 이용하여 상품은 받아보신 그대로 포장하여 <br>
								반품 양식서(우편봉투)와 함께 보내주시면 됩니다^^<br> *타택배 이용시 선불로 결제 후 보내주셔야
								합니다.(편의점택배도 타택배로 포함)<br> (반품주소 : "서울시 성북구 종암동 57-39번지 CJ
								종암대리점내 아보키사업부" )<br> 보내주신 상품은 도착후 처리가능합니다^^<br>


							</dd>
						</dl>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
jQuery('#faqTable tr').click(function() {
    if (jQuery(this).next(':first').hasClass('slide-hide')) {
        jQuery('.slide-show').removeClass('slide-show').addClass('slide-hide');
        jQuery(this).next('.slide-hide:first').removeClass('slide-hide').addClass('slide-show');
        faqUpdateHits(jQuery(this).attr('uid'));
    } else if (jQuery(this).next(':first').hasClass('slide-show')) {
        jQuery(this).next('.slide-show:first').removeClass('slide-show').addClass('slide-hide');
    }
});
/*
var _table = document.getElementById('faqTable');
var _tr = _table.getElementsByTagName('tr');
for (var i = 0; i < _tr.length; i++) {
    _tr[i].onclick = function() {
        if (this.nextElementSibling === undefined) {
            _slide = this.nextSibling;
            if (_slide == null) {
                return true;
            }
            _filter = _slide.className;
            if (!_filter) {
                return true;
            }
            if (_filter == 'slide-hide') {
                for(var i = 0; i < _tr.length; i++) {
                    if (_tr[i].className == 'slide-show') {
                        _tr[i].className = 'slide-hide';
                    }
                }
                _slide.className = 'slide-show';
                faqUpdateHits(this.getAttribute('uid'));
            } else {
                _slide.className = 'slide-hide';
            }
        } else {
            _slide = this.nextElementSibling;
            _filter = _slide.getAttribute('class');
            if (!_filter) {
                return true;
            }
            if (_filter == 'slide-hide') {
                for (var i = 0; i < _tr.length; i++) {
                    if (_tr[i].getAttribute('class') == 'slide-show') {
                        _tr[i].setAttribute('class', 'slide-hide');
                    }
                }
                _slide.setAttribute('class', 'slide-show');
                faqUpdateHits(this.getAttribute('uid'));
            } else {
                _slide.setAttribute('class', 'slide-hide');
            }
        }
        return true;
    }
}