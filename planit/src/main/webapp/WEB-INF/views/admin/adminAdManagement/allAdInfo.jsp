<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
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
				<a class="btn" href="<c:url value='/adAnalytics?ad_num=${getAdInfo.ad_num }'/>">통계 보기</a>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>