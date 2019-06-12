<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
<section>
	<article>
		<div class="container">
			<div class="row ">
				<div class="col mt-5 text-center">
					<h1>일정 게시판</h1>
					<table class="table table-hover ">
						<thead>
						<tr>
							<th scope="col">번호</th><th scope="col">작성자</th><th scope="col">제목</th><th scope="col">공개여부</th>
						</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
								<tr>
									<td scope="row" colspan="7">조회된 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var = "vo" items = "${list }">
								<tr>
									<td>${vo.plan_num }</td>
									<td>${vo.mem_id }</td>
									<td>${vo.plan_title }</td>
									<td>
										<c:choose>
											<c:when test="${vo.plan_public == 0 }">
												공개
											</c:when>
											<c:otherwise>
												비공개
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${startPage > 1 }">
								<li class="page-item"><a class="page-link" href="<c:url value = '/admin/plan/list?pageNum=${startPage - 1 }&field=${field }&keyword=${keyword }'/>">◀</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:choose>
									<c:when test="${i == pageNum }">
										<li class="page-item active"><a class="page-link" href="<c:url value = '/admin/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="<c:url value = '/admin/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${endPage < pageCnt }">
								<li class="page-item"><a class="page-link" href="<c:url value = '/plan/list?pageNum=${endPage + 1 }&field=${field }&keyword=${keyword }'/>">▶</a></li>
							</c:if>
						</ul>
					</div>
					<form id="form" class="form-inline d-flex justify-content-center" method="post" action="<c:url value = '/admin/plan/list'/>">
						<input type = "hidden" value = "${pageNum }" name = "pageNum">
						<select name="field" class="custom-select">
							<option value = "plan_title"
								<c:if test = "${field == 'plan_title' }">selected = "selected"</c:if>
							>제목</option>
							<option value = "mem_id"
								<c:if test = "${field == 'mem_id' }">selected = "selected"</c:if>
							>작성자</option>
						</select>
							<input class="form-control mr-sm-2" value="${keyword }" name="keyword" type="search">
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
</div>