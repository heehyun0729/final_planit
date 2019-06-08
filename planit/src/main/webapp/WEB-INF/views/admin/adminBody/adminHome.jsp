<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container mt-5">
	<div class="row mt-5">
		<div class="col d-flex justify-content-start align-items-center text-center">
			<div class="card w-100 mr-5">
				<h4 class="card-header">금일 광고율</h4>
				<div class="card-body">
					<span>${map.chance }%</span>
				</div>
			</div>
			<div class="card w-100 mr-5">
				<h4 class="card-header">금일 수익</h4>
				<div class="card-body">
					<span><fmt:formatNumber value="${map.adProfit }" pattern="#,###" />&#8361;</span>
				</div>
			</div>
			<div class="card w-100 mr-5">
				<h4 class="card-header">신규 가입자</h4>
				<div class="card-body">
					<span>10명(개발필요)</span>
				</div>
			</div>
			<div class="card w-100 mr-5">
				<h4 class="card-header">현재 접속자</h4>
				<div class="card-body">
					<span>5명(개발필요)</span>
				</div>
			</div>						
		</div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<div class="card mr-5">
				<h4 class="card-header text-left">최근 거래내역(개발필요)</h4>
				<div class="card-body">
					<div class="container">
						<div class="row ">
							<div class="col mt-5 text-center">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/adminAdManagement/approvedAdList'/>" class="ui-tabs-anchor">게재신청</a></li>
									<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/adminAdManagement/requestRefundAdList'/>" class="ui-tabs-anchor">환불신청</a></li>
									<li class="nav-item"><a class="nav-link active" href="<c:url value='/admin/adminAdManagement/allAdList'/>" class="ui-tabs-anchor">ALL</a></li>
								</ul>
								<table class="table table-hover ">
									<thead>
									<tr>
										<th scope="col">번호</th><th scope="col">신청자</th><th scope="col">회사명</th><th scope="col">신청일</th><th scope="col">결재일</th><th scope="col">결제금액</th><th scope="col">상세정보</th>
									</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${getAdList[0]!=null }">
											<c:forEach var="vo" items="${getAdList }">
												<tr>
													<td scope="row">${vo.ad_num }</td>
													<td>${vo.mem_id }</td>
													<td>${vo.ad_company }</td>
													<td>${vo.ad_requestDate }</td>
													<c:choose>
														<c:when test="${vo.ad_requestDate!=null}">
															<td>${vo.ad_requestDate }</td>
														</c:when>
														<c:otherwise>
															<td>X</td>
														</c:otherwise>
													</c:choose>
													<td><fmt:formatNumber value="${vo.ad_price}" pattern="#,###" /></td>
													<td><a href="<c:url value='/admin/adminAdManagement/allAdInfo?ad_num=${vo.ad_num }'/>"><img name="getInfo" alt='상세보기' src='<c:url value='/resources/adminImages/chat.png'/>'></a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td scope="row" colspan="7">해당 요청이 없습니다.</td>
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
													<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/allAdList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/allAdList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${map.totalPageCount!=pu.endPageNum }">
											<li class="page-item"><a class="page-link" href='${pageContext.request.contextPath }/?pageNum=${pu.endPageNum+1}'>▶</a></li>
										</c:if>
									</ul>
								</div>
								<form id="form" class="form-inline d-flex justify-content-center" method="post" action="<c:url value='/admin/adminAdManagement/allAdList'/>">
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
				</div>
			</div>
		</div>
	</div>
</div>