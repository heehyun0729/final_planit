<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
<h1>여행 리뷰 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/reviewUpdate" enctype="multipart/form-data">
	<!--  <input type="hidden" name="mem_id" value="${vo.mem_id }">
	아이디${vo.mem_id }<br>-->
	<input type="hidden" name="review_num" value="${vo.review_num }">
	글번호${vo.review_num }<br>
	국가<input type="text" name="review_country" value="${vo.review_country }"><br>
	도시<input type="text" name="review_city" value="${vo.review_city }"><br>
	제목<input type="text" name="review_title" value="${vo.review_title }"><br>
	  내용<textarea id="summernote" rows="5" cols="50" name="review_content">${vo.review_content }</textarea><br>
	<!--내용<div name="review_content" id="summernote" value="${vo.review_content }"></div><br>-->
	수정할파일<input type="file" name="file1"><br>
	<input type="submit" value="저장">
	<input type="button" value="취소">
</form>
</div>