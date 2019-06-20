<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.table {
		    margin: 0 auto;
		    width: 80%;
			}
	.tag{color:#EE4141}
	.button{text-align:center;}
</style>

<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style="background : url(resources/images/qna2.png)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">여행문의</h2>
            <p style="color:#D8D8D8">자유롭게 의견을 나눌 수 있는 공간</p>
        </div>
    </div>
</section>

<div id="list">
	<div class="container">
		<table class="table table-hover">
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.qna_num }</td>
					<td>${vo.qna_cate }</td>
					<td ><a href='<c:url value='/qnaDetails?qna_num=${vo.qna_num }'/>'>${vo.qna_title }</a></td>
					<td>${vo.mem_id }</td>
					<td>${vo.qna_date }</td>
				</tr>
			</c:forEach>
		</table>
</div>

	<!-- <div id="page">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i }">
						<a href="${pageContext.request.contextPath }/qnaList?pageNum=${i }&field=${field }&keyword=${keyword }">
							<span style='color:blue'>[${i }]</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/qnaList?pageNum=${i }&field=${field }&keyword=${keyword }">
						<span style='color:gray'>[${i }]</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>-->
		<br>
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
	</div>
		<!-- <div id="page">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i }">
						<a href="${pageContext.request.contextPath }/qnaList?pageNum=${i }&field=${field }&keyword=${keyword }">
							<span style='color:blue'>[${i }]</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/qnaList?pageNum=${i }&field=${field }&keyword=${keyword }">
						<span style='color:gray'>[${i }]</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>-->
		<c:choose>
			<c:when test="${sessionScope.mem_id!=null }">
			<div class="button">
				<a class="genric-btn danger radius" href="<c:url value='/qna/insertQna'/>">글쓰기</a>
			</div>
			</c:when>
		</c:choose>		
</div>