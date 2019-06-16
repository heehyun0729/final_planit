<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
<script>
	$(document).ready(function(){
		$(".table a").on("click", function(event){//모달 열기
			event.preventDefault();
			const src=$(event.target).parent().prop("href");
			$("#modalSrc").html('<iframe style="border: 0px; " src="' + src + '" width="1000px" height="820px"></iframe>');
			$("#clickMe").click();
		});
		$('#exampleModal').on('hidden.bs.modal', function () {//모달 닫힐때 새로고침
			  window.location.reload();
		});
	});
</script>
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
						<li class="nav-item"><a class="nav-link ${current =='requestChangeAdImageList' ? 'active': ''}" href="<c:url value='/admin/adminAdManagement/requestChangeAdImageList'/>" class="ui-tabs-anchor">이미지 수정요청</a></li>
						<li class="nav-item"><a class="nav-link ${current =='allAdList' ? 'active': ''}" href="<c:url value='/admin/adminAdManagement/allAdList'/>" class="ui-tabs-anchor">모든광고</a></li>
					</ul>
					<table class="table table-hover ">
						<thead>
						<tr>
							<th scope="col">이미지 번호</th><th scope="col">광고상세 번호</th><th scope="col">기존 이미지 이름</th><th scope="col">수정 이미지 이름</th><th scope="col">상세정보</th>
						</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${getAdImageList[0]!=null }">
								<c:forEach var="vo" items="${getAdImageList }">
									<tr>
										<td scope="row">${vo.adImg_num }</td>
										<td>${vo.adInfo_num }</td>
										<td>${vo.adImg_orgImg }</td>
										<td>${vo.adImg_changeOrgImg }</td>
										<td><a href="<c:url value='/admin/adminAdManagement/requestChangeAdImageInfo?adImg_num=${vo.adImg_num }'/>"><img name="getInfo" alt='상세보기' src='<c:url value='/resources/adminImages/chat.png'/>'></a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td scope="row" colspan="5">해당 요청이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>		
						</tbody>				
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${map.startPageNum!=1 }">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/requestChangeAdImageList?pageNum=${map.startPageNum-1}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">◀</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNum }" end="${map.endPageNum }">
								<c:choose>
									<c:when test="${map.pageNum==i }">
										<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/requestChangeAdImageList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/requestChangeAdImageList?pageNum=${i}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.totalPageCount!=map.endPageNum }">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/adminAdManagement/requestChangeAdImageList?pageNum=${map.endPageNum+1}&field=${param.field}&keyword=${param.keyword}&progress=${map.ad_progress}">▶</a></li>
							</c:if>
						</ul>
					</div>
					<form id="form" class="form-inline d-flex justify-content-center" method="post" action="<c:url value='/admin/adminAdManagement/requestChangeAdImageList'/>">
						<select name="field" class="custom-select">
							<option value="adImg_num" <c:if test="${param.field=='adImg_num' }">selected="selected"</c:if>>번호</option>
							<option value="adInfo_num" <c:if test="${param.field=='adInfo_num' }">selected="selected"</c:if>>상세 번호</option>
							<option value="adImg_orgImg" <c:if test="${param.field=='adImg_orgImg' }">selected="selected"</c:if>>기존 이미지 이름</option>
							<option value="adImg_changeOrgImg" <c:if test="${param.field=='adImg_changeOrgImg' }">selected="selected"</c:if>>수정 이미지 이름</option>
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