<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<script>

</script>
<h1>상세 화면</h1>
<table border="1" style="width:700px;">
	<tr>
		<td>글번호</td>
		<td>${vo.resReview_num }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${vo.mem_id }</td>
	</tr>
	<tr>
		<td>글제목</td>
		<td>${vo.resReview_title }</td>
	</tr>
	<tr>
		<td>사진/글 내용</td>
		<td><div>${vo.resReview_content }</div></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${vo.resReview_date }</td>
	</tr>

	<tr>
		<td>이전글</td>
		<td><a href="<c:url value='/reservationReview/reservationReviewDetail.do?review_num=${prev.resReview_num }'/>">${prev.resReview_title }</a></td>
	</tr>
	
	<tr>
		<td>다음글</td>
		<td><a href="<c:url value='/reservationReview/reservationReviewDetail.do?review_num=${next.resReview_num }'/>">${next.resReview_title }</a></td>
	</tr>	
</table>
<a href="${pageContext.request.contextPath }/reservationReview/reservationReviewList.do">전체글보기</a>
<a href="${pageContext.request.contextPath }/reservationReview/reservationReviewUpdate?resReview_num=${vo.resReview_num}">글수정</a>
</div>