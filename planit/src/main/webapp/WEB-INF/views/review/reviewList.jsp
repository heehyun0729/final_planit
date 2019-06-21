<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--================style Area =================-->
<style>
.active {
	color: #fff !important;
	background-color: #337ab7 !important;
	border-color: #2e6da4 !important;
}

.mg_p {
	margin: 20px 0px;
}

.page-liner {
	padding-bottom: 9px;
	margin: 20px 0 20px;
	border-bottom: 1px solid #eee;
}

.ui-datepicker {
	font-size: 20px;
	width: 350px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 60px;
	font-size: 20px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 80px;
	font-size: 20px;
}
.blog-pagination {
    padding-top: 5px;
    padding-bottom: 15px;
}

</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax"
		style="background: url(resources/images/buddy01.jpg)"
		data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
		data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">여행후기</h2>
			<p style="color: #D8D8D8">여행후기를 글 목록!!!</p>
		</div>
	</div>
</section>

<div class="container">
	<h1>여행후기 리스트</h1>
		<c:choose>
		<c:when test="${sessionScope.mem_id!=null }">
			<a href="<c:url value='/review/reviewInsert'/>"style="color: #339af0;">글쓰기</a>
		</c:when>
	</c:choose>/
	<a href="<c:url value='/'/>"style="color: #FA58F4;">메인페이지</a>
	<div>
		<table class="table">
			<tr>
				<td>글번호</td>
				<td>국가</td>
				<td>도시</td>
				<td>글제목</td>
				<td>조회수</td>
				<td>작성일</td>
				<td>삭제</td>

			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.review_num }</td>
					<td>${vo.review_country }</td>
					<td>${vo.review_city }</td>
					<td><a style="color: #339af0;"
						href="${pageContext.request.contextPath }/review/reviewDetail.do?review_num=${vo.review_num}&field=${field}&keyword=${keyword}&pageNum=${pageNum}">${vo.review_title }</a></td>
					<td>${vo.review_hit }</td>
					<td>${vo.review_date }</td>
					<td><a
						href="${pageContext.request.contextPath }/reviewDelete?review_num=${vo.review_num}"><i
															class="fas fa-trash" style="color: #339af0;"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div >
		<nav class="blog-pagination justify-content-center d-flex" >
			<ul class="pagination">
				<li class="page-item"><c:choose>
						<c:when test="${pu.startPageNum > 4 }">
							<a
								href="${pageContext.request.contextPath }/review/reviewlist.do?pageNum=${pu.startPageNum - 1}"
								class="page-link" aria-label="Previous"> <span
								aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
							</span>
							</a>
						</c:when>
						<c:otherwise>
			◀
		</c:otherwise>
					</c:choose></li>
				<c:forEach var="i" begin="${pu.startPageNum }"
					end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum == i }">
							<li class="page-item active"><a
								href="${pageContext.request.contextPath }/review/reviewList.do?pageNum=${i}&field=${field}&keyword=${keyword}"
								class="page-link"> ${i}</a></li>

						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="${pageContext.request.contextPath }/review/reviewList.do?pageNum=${i}&field=${field}&keyword=${keyword}"
								class="page-link"> ${i}</a></li>

						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item"><c:choose>
						<c:when test="${pu.endPageNum < pu.totalPageCount }">
							<a
								href="${pageContext.request.contextPath }/review/reviewList.do?pageNum=${pu.endPageNum + 1}"
								class="page-link" aria-label="Next"> <span
								aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
							</span>
							</a>

						</c:when>
						<c:otherwise>
			▶
		</c:otherwise>
					</c:choose></li>
			</ul>
		</nav>
			<div class="blog-pagination justify-content-center d-flex">
		<form method="post" action="<c:url value='/review/reviewList'/>">
			<select name="field" class="custom-select" style="width: 100px;">
				<option value="review_title"
					<c:if test="${field=='review_title' }">selected="selected"</c:if>>글제목</option>
				<option value="review_content"
					<c:if test="${field=='review_content' }">selected="selected"</c:if>>글내용</option>
				<option value="review_country"
					<c:if test="${field=='vo.review_country' }">selected="selected"</c:if>>국가</option>
			</select> <input type="text" name="keyword" value="${keyword }" style="width:300px;height: 42px">
			<a
								href="#" onclick="$('#form9').submit();"><i
								class="fas fa-search" style="color: #339af0;"></i></a>
		</form>
	</div>
	</div>


</div>
