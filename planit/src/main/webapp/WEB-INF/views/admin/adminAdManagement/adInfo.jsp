<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	.flex-father{
		display: flex;
	}
	.form-box{/* 겹치니 나중에 삭제 */
		background: #fff;
		margin: 5px;
		width: 320px;
		box-shadow: 0 3px 6px 0px rgba(0,0,0,0.16), 0 3px 6px 0px rgba(0,0,0,0.23);
		text-align: center;
		border-radius: 25px;
	}
	.form-box2{/* 겹치니 나중에 삭제 */
		background: #fff;
		margin: 5px;
		width: 320px;
		box-shadow: 0 3px 6px 0px rgba(0,0,0,0.16), 0 3px 6px 0px rgba(0,0,0,0.23);
		text-align: center;
		border-radius: 25px;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
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
				번호<br>
				${getAdInfo.ad_num }<br>
				신청자 ID<br>
				${getAdInfo.mem_id }<br>
				회사명<br>
				${getAdInfo.ad_company }<br>
				URL<br>
				${getAdInfo.ad_url }<br>
				신청일<br>
				${getAdInfo.ad_requestDate }<br>
				승인일<br>
				<c:choose>
					<c:when test="${getAdInfo.ad_approveDate!=null }">
						${getAdInfo.ad_approveDate }<br>
					</c:when>
					<c:otherwise>
						X<br>
					</c:otherwise>
				</c:choose>
				총 결제금액<br>
				<fmt:formatNumber value="${getAdInfo.ad_price }" pattern="#,###" /><br>
				결제 수단<br>
				${getAdInfo.ad_payment }<br>
				결제 번호<br>
				${getAdInfo.ad_tid }<br>
				진행 상황<br>
				<c:choose>
					<c:when test="${getAdInfo.progress=='0' }">
						승인 대기중<br>
					</c:when>
					<c:when test="${getAdInfo.progress=='1' }">
						승인됨<br>
					</c:when>
					<c:when test="${getAdInfo.progress=='2' }">
						거절됨<br>
					</c:when>
					<c:when test="${getAdInfo.progress=='3' }">
						환불 요청됨<br>
					</c:when>
					<c:when test="${getAdInfo.progress=='4' }">
						환불 완료됨<br>
					</c:when>
					<c:otherwise>
						X<br>
					</c:otherwise>
				</c:choose>
				세부정보<br>
				<c:forEach var="vo" items="${getAdInfoInfo}">
					광고일:${vo.adInfo_date } 확률:${vo.adInfo_chance } 가격:<fmt:formatNumber value="${vo.adInfo_price }" pattern="#,###" /><br>
				</c:forEach>
				<br>			
			</div>
			<div class="form-box2">
				<br>광고 이미지<br>
				<img id="adImage" alt="광고 이미지" src="<c:url value='/resources/adImage/${getAdInfoImage.adImg_saveImg }'/>"><br>
				${getAdInfoImage.adImg_orgImg }<br>
			</div>
		</div>
		<div>
			<div>
			</div>
			<div>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>