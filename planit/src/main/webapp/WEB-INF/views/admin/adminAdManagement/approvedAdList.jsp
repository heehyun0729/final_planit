<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
<style type="text/css">
</style>
<script type="text/javascript">
	
</script>
<div>
<header>
</header>
<section>
	<article>
		<div class="container">
			<div class="row ">
				<div class="col mt-5 text-center">
					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link ${current =='approvedAdList' ? 'active': ''}" href="<c:url value='/admin/adminAdManagement/approvedAdList'/>" class="ui-tabs-anchor">승인요청</a></li>
						<li class="nav-item"><a class="nav-link ${current =='requestRefundAdList' ? 'active': ''}" href="<c:url value='/admin/adminAdManagement/requestRefundAdList'/>" class="ui-tabs-anchor">환불요청</a></li>
						<li class="nav-item"><a class="nav-link ${current =='allAdList' ? 'active': ''}" href="<c:url value='/admin/adminAdManagement/allAdList'/>" class="ui-tabs-anchor">모든광고</a></li>
					</ul>
					<table class="table table-hover ">
						<thead>
						<tr>
							<th scope="col">번호</th><th scope="col">신청자</th><th scope="col">회사명</th><th scope="col">신청일</th><th scope="col">결제금액</th><th scope="col">상세정보</th>
						</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${getAdList[0]!=null }">
								<c:forEach var="vo" items="${getAdList }">
									<tr>
										<td>${vo.ad_num }</td>
										<td>${vo.mem_id }</td>
										<td>${vo.ad_company }</td>
										<td>${vo.ad_requestDate }</td>
										<td><fmt:formatNumber value="${vo.ad_price}" pattern="#,###" /></td>
										<td><a href="<c:url value='/admin/adminAdManagement/approvedAdInfo?ad_num=${vo.ad_num }'/>"><img name="getInfo" alt='상세보기' src='<c:url value='/resources/adminImages/chat.png'/>'></a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td scope="row" colspan="6">해당 요청이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${map.startPageNum!=1 }">
								<li class="page-item"><a class="page-link" href='${pageContext.request.contextPath }/?pageNum=${pu.startPageNum-1}'>◀</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNum }" end="${map.endPageNum }">
								<c:choose>
									<c:when test="${map.pageNum==i }">
										<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/approvedAdList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/approvedAdList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.totalPageCount!=pu.endPageNum }">
								<li class="page-item"><a class="page-link" href='${pageContext.request.contextPath }/?pageNum=${pu.endPageNum+1}'>▶</a></li>
							</c:if>
						</ul>
					</div>
					<form id="form" class="form-inline d-flex justify-content-center" method="post" action="<c:url value='/admin/adminAdManagement/approvedAdList'/>">
						<select name="field" class="custom-select">
							<option value="ad_num" <c:if test="${param.field=='ad_num' }">selected="selected"</c:if>>번호</option>
							<option value="mem_id" <c:if test="${param.field=='mem_id' }">selected="selected"</c:if>>신청자</option>
							<option value="ad_company" <c:if test="${param.field=='ad_company' }">selected="selected"</c:if>>회사명</option>
							<option value="ad_requestDate" <c:if test="${param.field=='ad_requestDate' }">selected="selected"</c:if>>신청일</option>
							<option value="ad_price" <c:if test="${param.field=='ad_price' }">selected="selected"</c:if>>결제금액</option>
						</select>
							<input class="form-control mr-sm-2" value="${param.keyword }" name="keyword" type="search" placeholder="검색" aria-label="Search">
							<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
					</form>
				</div>
			</div>
		</div>
	</article>
	<!-- 모달 -->
	<input id="clickMe" type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세정보</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalSrc">
					
				</div>
			</div>
		</div>
	</div>
</section>
<footer>
</footer>
</div>