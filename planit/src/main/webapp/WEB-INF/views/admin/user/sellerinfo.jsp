<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<style type="text/css">
	
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#sellerapproval").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url : $('#localurl').val()+"admin/user/sellerapproval",
			type : "post",
			data : {'mem_id':$("#mem_id1").val()},
			success : function(data) {
				if (data >0) {
					alert("변경성공!");
				} else {
					alert("변경실패!");
				}
			}
		});
	});
});
</script>
<div>
<header>
</header>
<section>
	<article>
		<div class="container">
			<div class="row ">
				<div class="col mt-5 text-center">
					<table class="table table-hover ">
							<tr>
								<th scope="col">회사명</th>
								<td>${map.SELL_COMPANY }</td>
							</tr>
							<tr>
								<th scope="col">아이디</th>
								<td>${map.MEM_ID }</td>
							</tr>
							<tr>
								<th scope="col">주소</th>
								<td>
									우편번호 : ${map.SELL_POSTCODE }<br>
									주소 : ${map.SELL_ADDR }
								</td>
							</tr>
							<tr>
								<th scope="col">전화번호</th>
								<td>${map.SELL_TEL }</td>
							</tr>
							<tr>
								<th>승인</th>
								<td>
									<c:choose>
										<c:when test="${map.MEM_STAT<2 }">
											승인됨
										</c:when>
										<c:otherwise>
											<form method="post" action="<c:url value='/admin/user/sellerapproval'/>" id="sellerapproval">
												<input type="hidden" id="mem_id1" name="mem_id1" value="${map.MEM_ID }">
												<input type="hidden" id="localurl" value="<c:url value='/'/>">
												<input type="submit" value="승인">
											</form>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
									<%--<tr>
										<td>${map.SELL_COMPANY }</td>
									</tr>
									<tr>
								<td>${map.MEM_ID }</td>
									</tr>
									<tr>
								<td>${map.SELL_ADDR }</td>
									</tr>
									<tr>
								<td>${map.SELL_TEL }</td>
									</tr>
									<tr>
										<td><a href="<c:url value='/admin/user/sellerinfo?mem_id=${map.MEM_ID }'/>">상세보기</a></td>
									</tr>
										<!-- <td>
											<form method="post" action="<c:url value='/admin/user/sellerapproval'/>" id="sellerapproval">
												<input type="hidden" id="mem_id1" name="mem_id1" value="${map.MEM_ID }">
												<input type="hidden" id="localurl" value="<c:url value='/'/>">
												<input type="submit" value="승인" <c:if test="${map.MEM_STAT<2 }">disabled="disabled"</c:if>>
											</form>
										</td>-->
									</tr>
								</c:forEach>
							<c:otherwise>
								<tr>
									<td scope="row" colspan="8">해당 요청이 없습니다.</td>
								</tr>
							</c:otherwise> --%>
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${map.startPageNum!=1 }">
								<li class="page-item"><a class="page-link" href="<c:url value='/admin/user/sellerlist?info=${map.info }&pageNum=${pu.startPageNum-1}&field=${param.field}&keyword=${param.keyword}'/>">◀</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNum }" end="${map.endPageNum }">
								<c:choose>
									<c:when test="${map.pageNum==i }">
										<li class="page-item active"><a class="page-link" href="<c:url value='/admin/user/sellerlist?info=list&pageNum=${i}&field=${param.field}&keyword=${param.keyword}'/>">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="<c:url value='/admin/user/sellerlist?info=list&pageNum=${i}&field=${param.field}&keyword=${param.keyword}'/>">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.totalPageCount!=pu.endPageNum }">
								<li class="page-item"><a class="page-link" href="<c:url value='/admin/user/sellerlist?info=${map.info }&pageNum=${pu.endPageNum+1}&field=${param.field}&keyword=${param.keyword}'/>">▶</a></li>
							</c:if>
						</ul>
					</div>
					<form id="form" class="form-inline d-flex justify-content-center" method="post" action="<c:url value='/admin/user/sellerlist'/>">
						<input type="hidden" name="${map.info }">
						<select id="field" name="field" class="custom-select">
							<option value="mem_id" <c:if test="${param.field=='mem_id' }">selected="selected"</c:if>>회사명</option>
							<option value="mem_nickname" <c:if test="${param.field=='mem_nickname' }">selected="selected"</c:if>>아이디</option>
							<option value="mem_email" <c:if test="${param.field=='mem_email' }">selected="selected"</c:if>>주소</option>
						</select>
							<div id="searchinput">
								<input class="form-control mr-sm-2" value="${param.keyword }" name="keyword" type="search" placeholder="검색" aria-label="Search">
							</div>
							<button class="btn btn-outline-primary my-2 my-sm-0" type="submit" id="searchsubmit">검색</button>
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