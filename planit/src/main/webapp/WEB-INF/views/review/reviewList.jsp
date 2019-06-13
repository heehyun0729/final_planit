<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<h1>후기</h1>
<a href="<c:url value='/review/reviewInsert'/>">글등록</a>
<div>
	<table border="1" width="700">	
		<tr>
			<td>글번호</td>
			<td>국가</td>
			<td>도시</td>
			<td>글제목</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>별점</td>
			<td>추천</td>
			<td>삭제</td>
			
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.review_num }</td>
				<td>${vo.review_country }</td>
				<td>${vo.review_city }</td>
				<td><a href="${pageContext.request.contextPath }/review/reviewDetail.do?review_num=${vo.review_num}&field=${field}&keyword=${keyword}&pageNum=${pageNum}">${vo.review_title }</a></td>
				<td>${vo.review_date }</td>
				<td>${vo.review_hit }</td>
				<td>${vo.review_star }</td>
				<td>${vo.review_like }</td> 
				<td><a href="${pageContext.request.contextPath }/reviewDelete?review_num=${vo.review_num}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div>
	<c:choose>
		<c:when test="${pu.startPageNum > 4 }">
			<a href = "${pageContext.request.contextPath }/review/reviewlist.do?pageNum=${pu.startPageNum - 1}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
		<c:forEach var = "i" begin="${pu.startPageNum }" end ="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum == i }">
					<a href = "${pageContext.request.contextPath }/review/reviewList.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color: bule;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "${pageContext.request.contextPath }/review/reviewList.do?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color: gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	<c:choose>
		<c:when test="${pu.endPageNum < pu.totalPageCount }">
			<a href = "${pageContext.request.contextPath }/review/reviewList.do?pageNum=${pu.endPageNum + 1}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
</div>
<div>
	<form method="post" action="<c:url value='/review/reviewList'/>">
		<select name="field">
			<option value="review_title" <c:if test="${field=='review_title' }">selected="selected"</c:if>>글제목</option>
			<option value="review_content" <c:if test="${field=='review_content' }">selected="selected"</c:if>>글내용</option>
			<option value="review_country" <c:if test="${field=='vo.review_country' }">selected="selected"</c:if>>국가</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
	<c:choose>
		<c:when test="${sessionScope.mem_id!=null }">
			<a href="<c:url value='/review/reviewInsert'/>">글쓰기</a>
		</c:when>
	</c:choose>
	<a href="<c:url value='/review/reviewList'/>">전체글목록</a>
	<a href="<c:url value='/'/>">메인페이지</a>
</div>