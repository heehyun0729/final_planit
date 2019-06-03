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
	.tableContentWrapper{
		width: 100%;
		height: 800px;
		margin: auto;
	}
	.tableContentDiv{
		width: 80%;
		height: 80%;
		margin: 80px auto;
		text-align: center;
	}
	.table{
		border-bottom: 1px solid gray;
		width: 80%;
		margin: 20px auto;
		text-align: center;
	}
	.ui-tabs .ui-tabs-nav li.ui-tabs-active .ui-tabs-anchor, .ui-tabs .ui-tabs-nav li.ui-state-disabled .ui-tabs-anchor, .ui-tabs .ui-tabs-nav li.ui-tabs-loading .ui-tabs-anchor {
    cursor: default;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
</script>
<div>
<header>
</header>
<section>
	<article>
		<div class="tableContentWrapper">
			<div class="tableContentDiv">
				<div class="ui-tabs ui-corner-all ui-widget ui-widget-content">
					<ul class="ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
						<li class="ui-tabs-tab ui-corner-top ui-state-default ui-tab"><a href="<c:url value='/admin/adminAdManagement/approvedAdList'/>" class="ui-tabs-anchor">게재신청</a></li>
						<li class="ui-tabs-tab ui-corner-top ui-state-default ui-tab"><a href="<c:url value='/admin/adminAdManagement/requestRefundAdList'/>" class="ui-tabs-anchor">환불신청</a></li>
						<li class="ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active"><a href="<c:url value='/admin/adminAdManagement/allAdList'/>" class="ui-tabs-anchor">ALL</a></li>
					</ul>
					<table class="table">
						<tr>
							<th>번호</th><th>신청자</th><th>회사명</th><th>신청일</th><th>결제금액</th><th>상세정보</th>
						</tr>
						<c:choose>
							<c:when test="${getAdList[0]!=null }">
								<c:forEach var="vo" items="${getAdList }">
									<tr>
										<td>${vo.ad_num }</td>
										<td>${vo.mem_id }</td>
										<td>${vo.ad_company }</td>
										<td>${vo.ad_requestDate }</td>
										<td><fmt:formatNumber value="${vo.ad_price}" pattern="#,###" /></td>
										<td><a href="">보기</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="6">해당 요청이 없습니다.</td>
								</tr>
								<tr>
									<td colspan="6">&nbsp;</td>
								</tr>
							</c:otherwise>
						</c:choose>						
					</table>
					<c:forEach var="i" begin="${map.startPageNum }" end="${map.endPageNum }">
						<c:choose>
							<c:when test="${map.pageNum==i }">
								<a href="${pageContext.request.contextPath }/admin/adminAdManagement/allAdList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}"><span style="color:blue">[${i }]</span></a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/admin/adminAdManagement/allAdList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}"><span style="color:red">[${i }]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<form method="post" action="<c:url value='/admin/adminAdManagement/allAdList'/>">
						<select name="field">
							<option value="ad_num" <c:if test="${param.field=='ad_num' }">selected="selected"</c:if>>번호</option>
							<option value="mem_id" <c:if test="${param.field=='mem_id' }">selected="selected"</c:if>>신청자</option>
							<option value="ad_company" <c:if test="${param.field=='ad_company' }">selected="selected"</c:if>>회사명</option>
							<option value="ad_requestDate" <c:if test="${param.field=='ad_requestDate' }">selected="selected"</c:if>>신청일</option>
							<option value="ad_price" <c:if test="${param.field=='ad_price' }">selected="selected"</c:if>>결제금액</option>
						</select>
						<input type="text" name="keyword" value="${param.keyword }"> <input type="submit" value="검색">
					</form>
				</div>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>