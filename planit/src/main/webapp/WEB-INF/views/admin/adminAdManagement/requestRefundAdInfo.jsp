<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	.flex-father{
		display: flex;
		width: 820px;
		margin: 25px auto;
		margin-bottom: 0px;
	}
	.form-box{/* 겹치니 나중에 삭제 */
		margin: 5px;
		width: 280px;
	}
	.form-box2{/* 겹치니 나중에 삭제 */
		margin: 5px;
		width: 120px;
		text-align: center;
	}
	.form-box3{/* 겹치니 나중에 삭제 */
		margin: 5px;
		width: 820px;
		height: 50px;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
	.form-box4{/* 겹치니 나중에 삭제 */
		margin: 5px;
		width: 480px;
	}
	.tableDiv{
		display: table;
		margin: auto;
	}
	#adImage{
		width: 100px;
		height: 500px;
	}
	.leftAlign{
		text-align: left;
		text-indent: 20px;
	}
	.centerAlign{
		text-align: center;
		text-indent: 0px;
		border-bottom: 1px solid gray;
		width: 80%;
		margin: auto;
	}
	.btn {
		font-weight:bold;
		text-decoration:none;
		font-family:Arial;
		box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 4px 6px;
		background:#787878;
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#787878', endColorstr='#454545');
		background:linear-gradient(#787878, #454545);
		text-indent:0px;
		line-height:0px;
		border-radius:3px;
		text-align:center;
		vertical-align:middle;
		display:inline-block;
		font-size:12px;
		color:#f7f7f7;
		width:63px;
		height:0px;
		padding:13px;
		border-color:#2e2e2e;
		border-width:1px;
		border-style:solid;
		margin-left: 35px;
		margin-right: 35px;
	}
	.btn:active {
		box-shadow:inset #595959 0px 5px 8px -1px,#a6a6a6 0px 0 6px;
		position:relative;
		top:4px
	}
	.btn:hover {
		background:#454545;
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#454545', endColorstr='#787878');
		background:linear-gradient(#454545, #787878);
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#allRefundBtn").on('click', function(){//모두 환불버튼을 클릭하면
			//카카오페이결제환불
			const cid="TC0ONETIME";
			const ad_num=$("#refundAd_num").val();
			const ad_tid=$("#refundAd_tid").val();
			const cancel_amount=$("#refundCancel_amount").val();
			const cancel_tax_free_amount=$("#refundCancel_tax_free_amount").val();
			$.getJSON("<c:url value='/admin/adminAdManagement/requestRefundAllAdInfo'/>",{cid:cid, ad_num:ad_num, ad_tid:ad_tid, cancel_amount:cancel_amount, cancel_tax_free_amount:cancel_tax_free_amount},
				function(data) {
					window.parent.$(".ui-dialog-content:visible").dialog("close");
					window.parent.location.reload();
			});
		});
		var refunded=1;
		var length=${fn:length(getAdInfoInfo)};
		<c:forEach items="${getAdInfoInfo}" var ="vo">
			if("${vo.adInfo_status}"==4){
				refunded++;
			};
		</c:forEach>
		if(refunded>1){
			$("#allRefundBtn").remove();
		}
		$(".form-box4 a").on("click", function(event){//부분환불
			event.preventDefault();
			const ad_num=$("#refundAd_num").val();
			const cid="TC0ONETIME";
			const adInfo_num=$(event.target).prev().val();
			const ad_tid=$("#refundAd_tid").val();
			const cancel_amount=$(event.target).next().val();
			const cancel_tax_free_amount="0";
			$.getJSON("<c:url value='/admin/adminAdManagement/adminAdKakaoPayRefund'/>",{cid:cid, adInfo_num:adInfo_num, ad_tid:ad_tid, cancel_amount:cancel_amount, cancel_tax_free_amount:cancel_tax_free_amount},
					function(data) {
						$(event.target).prop("src","<c:url value='/resources/adminImages/refunded.png'/>")
						if(length==refunded){
							$.getJSON("<c:url value='/admin/adminAdManagement/allRefundedAd'/>", {ad_num:ad_num}, function(){});
						}else{
							$.getJSON("<c:url value='/admin/adminAdManagement/partRefundedAd'/>", {ad_num:ad_num}, function(){});
						}
						location.reload();
			});
		});
	});
</script>
<div>
<header>
</header>
<section>
	<article>
		<div class="flex-father">
			<div class="form-box">
				<br>
				<div class="leftAlign">번호</div>
				<div class="centerAlign">${getAdInfo.ad_num }</div><br>
				<div class="leftAlign">회사명</div>
				<div class="centerAlign">${getAdInfo.ad_company }</div><br>
				<div class="leftAlign">신청일</div>
				<div class="centerAlign">${getAdInfo.ad_requestDate }</div><br>
				<div class="leftAlign">총 결제금액</div>
				<div class="centerAlign"><fmt:formatNumber value="${getAdInfo.ad_price }" pattern="#,###" />&#8361;</div><br>
				<div class="leftAlign">결제 번호</div>
				<div class="centerAlign">${getAdInfo.ad_tid }</div><br>
				<div class="leftAlign">신청자 ID</div>
				<div class="centerAlign">${getAdInfo.mem_id }</div><br>
				<div class="leftAlign">URL</div>
				<div class="centerAlign">${getAdInfo.ad_url }</div><br>
				<div class="leftAlign">결재일</div>
				<c:choose>
					<c:when test="${getAdInfo.ad_approveDate!=null }">
						<div class="centerAlign">${getAdInfo.ad_approveDate }</div><br>
					</c:when>
					<c:otherwise>
						<div class="centerAlign">X</div><br>
					</c:otherwise>
				</c:choose>
				<div class="leftAlign">결제 수단</div>
				<div class="centerAlign">${getAdInfo.ad_payment }</div><br>
				<div class="leftAlign">진행 상황</div>
				<c:choose>
					<c:when test="${getAdInfo.ad_progress=='0' }">
						<div class="centerAlign">승인 대기중</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='1' }">
						<div class="centerAlign">승인됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='2' }">
						<div class="centerAlign">반려됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='3' }">
						<div class="centerAlign">환불 요청됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='4' }">
						<div class="centerAlign">부분 환불됨</div><br>
					</c:when>
					<c:when test="${getAdInfo.ad_progress=='5' }">
						<div class="centerAlign">환불 완료됨</div><br>
					</c:when>
					<c:otherwise>
						<div class="centerAlign">X</div><br>
					</c:otherwise>
				</c:choose>
				<br>			
			</div>
			<div class="form-box4">
				<br>
				<div class="leftAlign">세부정보</div><br>
				<c:forEach var="vo" items="${getAdInfoInfo}">
					<div class="centerAlign">${vo.adInfo_date } - ${vo.adInfo_chance }% - <fmt:formatNumber value="${vo.adInfo_price }" pattern="#,###" />&#8361;
					 <c:choose>
					 	<c:when test="${vo.adInfo_status=='4' }">
					 		<img alt='환불됨' src='<c:url value='/resources/adminImages/refunded.png'/>'>
					 	</c:when>
					 	<c:otherwise>
					 		<a href="#"><input type="hidden" value="${vo.adInfo_num }"><img name="refund" alt='부분환불' src='<c:url value='/resources/adminImages/refund.png'/>'><input type="hidden" value="${vo.adInfo_price }"></a>
					 	</c:otherwise>
					 </c:choose>
					</div><br>
				</c:forEach>
				<br>
			</div>
			<div class="form-box2">
				<br>광고 이미지<br><br>
				<img id="adImage" alt="광고 이미지" src="<c:url value='/resources/adImage/${getAdInfoImage.adImg_saveImg }'/>"><br><br>
				${getAdInfoImage.adImg_orgImg }<br><br>
			</div>
		</div>
		<div class="tableDiv">
			<div class="form-box3">
				<a id="allRefundBtn" class="btn" href="#">일괄 환불</a>
					<input type="hidden" id="refundAd_num" value="${getAdInfo.ad_num }">
					<input type="hidden" id="refundAd_tid" value="${getAdInfo.ad_tid }">
					<input type="hidden" id="refundCancel_amount" value="${getAdInfo.ad_price }">
					<input type="hidden" id="refundCancel_tax_free_amount" value="0">
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>