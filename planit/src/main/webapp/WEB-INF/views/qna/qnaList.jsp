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
    <div class="overlay bg-parallax" style="background : url(resources/images/qna1.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">여행 문의</h2>
            <p style="color:#D8D8D8">자유롭게 의견을 나눌 수 있는 공간</p>
        </div>
    </div>
</section>
<div id="list">
	<h1>자유문의게시판</h1>
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
		<br>
		<div id="page">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i }">
					<%--current page --%>
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
		</div>
		<c:choose>
			<c:when test="${sessionScope.mem_id!=null }">
			<div class="button">
				<a class="genric-btn danger circle" href="<c:url value='/qna/insertQna'/>">글쓰기</a>
			</div>
			</c:when>
		</c:choose>		
</div>