<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
<h1>숙소 리뷰 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/resReviewUpdate">
	<input type="hidden" name="resReview_num" value="${vo.resReview_num }">
	글번호${vo.resReview_num }<br>
	제목<input type="text" name="resReview_title" value="${vo.resReview_title }"><br>
	  내용<textarea id="summernote" rows="5" cols="50" name="resReview_content">${vo.resReview_content }</textarea><br>
	별점<input type="text" name="resReview_star" value="${vo.resReview_star }">
	<input type="hidden" name="accom_num" value="${accom_num }">
	예약번호${accom_num }<br>
	<input type="submit" value="저장">
	<input type="button" value="취소">
</form>
</div>