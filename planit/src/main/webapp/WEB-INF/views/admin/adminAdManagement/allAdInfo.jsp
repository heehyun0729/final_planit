<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<style type="text/css">
	.alert {
		height: 20px;
		line-height: 20px;
		padding: 0px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
<div>
<header>
</header>
<section>
	<article>
		<div class="container">
			<div class="row">
				<div class="col-sm-auto text-center">
					<br>
					<div class="alert alert-secondary"><span class="">회사명</span></div>
					<div>${getAdInfo.ad_company }</div><br>
					<div class="alert alert-secondary"><span class="">신청일</span></div>
					<div>${getAdInfo.ad_requestDate }</div><br>
					<div class="alert alert-secondary"><span class="">총 결제금액</span></div>
					<div><fmt:formatNumber value="${getAdInfo.ad_price }" pattern="#,###" />&#8361;</div><br>
					<div class="alert alert-secondary"><span class="">결제 번호</span></div>
					<div>${getAdInfo.ad_tid }</div><br>
					<div class="alert alert-secondary"><span class="">신청자 ID</span></div>
					<div>${getAdInfo.mem_id }</div><br>
					<div class="alert alert-secondary"><span class="">URL</span></div>
					<div>${getAdInfo.ad_url }</div><br>
					<div class="alert alert-secondary"><span class="">결재일</span></div>
					<c:choose>
						<c:when test="${getAdInfo.ad_approveDate!=null }">
							<div>${getAdInfo.ad_approveDate }</div><br>
						</c:when>
						<c:otherwise>
							<div>X</div><br>
						</c:otherwise>
					</c:choose>
					<div class="alert alert-secondary"><span class="">결제 수단</span></div>
					<div>${getAdInfo.ad_payment }</div><br>
					<div class="alert alert-secondary"><span class="">진행 상황</span></div>
					<c:choose>
						<c:when test="${getAdInfo.ad_progress=='0' }">
							<div>승인 대기중</div><br>
						</c:when>
						<c:when test="${getAdInfo.ad_progress=='1' }">
							<div>승인됨</div><br>
						</c:when>
						<c:when test="${getAdInfo.ad_progress=='2' }">
							<div>반려됨</div><br>
						</c:when>
						<c:when test="${getAdInfo.ad_progress=='3' }">
							<div>환불 요청됨</div><br>
						</c:when>
						<c:when test="${getAdInfo.ad_progress=='4' }">
							<div>부분 환불됨</div><br>
						</c:when>
						<c:when test="${getAdInfo.ad_progress=='5' }">
							<div>환불 완료됨</div><br>
						</c:when>
						<c:otherwise>
							<div>X</div><br>
						</c:otherwise>
					</c:choose>	
				</div>
				<div class="col text-center">
					<br>
					<div class="alert alert-secondary"><span>세부정보</span></div><br>
					<c:forEach var="vo" items="${getAdInfoInfo}">
						<div>${vo.adInfo_date } - ${vo.adInfo_chance }% - <fmt:formatNumber value="${vo.adInfo_price }" pattern="#,###" />&#8361;
							<c:if test="${vo.adInfo_status=='4' }">
							 	<img alt='환불됨' src='<c:url value='/resources/adminImages/refunded.png'/>'>
							</c:if>
						 </div><br>
					</c:forEach>
					<br>
				</div>
				<div class="col-sm-auto text-center">
					<br><div class="alert alert-secondary"><span>광고 이미지</span></div><br>
					<img style="width:100px; height: 500px;" id="adImage" alt="광고 이미지" src="<c:url value='/resources/adImage/${getAdInfoImage.adImg_saveImg }'/>"><br><br>
					${getAdInfoImage.adImg_orgImg }<br><br>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<a class="btn btn-info" href="<c:url value='/adAnalytics?ad_num=${getAdInfo.ad_num }'/>">통계 보기</a>
				</div>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>