<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="list">
	<h1>자유문의게시판</h1>
		<table border="1" style="word-break:break-all">
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
					<td><a href='<c:url value='/qnaDetails?qna_num=${vo.qna_num }'/>'>${vo.qna_title }</a></td>
					<td>${vo.mem_id }</td>
					<td>${vo.qna_date }</td>
				</tr>
			</c:forEach>
		</table>
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
				<a href="<c:url value='/qna/insertQna'/>">글쓰기</a>
			</c:when>
		</c:choose>		
</div>