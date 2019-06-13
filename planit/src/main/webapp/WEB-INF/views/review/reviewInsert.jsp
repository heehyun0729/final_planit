<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div id=ReviewInsert>
<h1></h1>
<form method="post" action="${pageContext.request.contextPath }/review/reviewInsert" enctype="multipart/form-data">
	<!--  아이디<input type="hidden" name="mem_id" value="${mem_id }"><br>-->
	아이디<input type="text" name="mem_id"><br>
	국가<input type="text" name="review_country"><br>
	도시<input type="text" name="review_city"><br>
	제목<input type="text" name="review_title"><br>
	내용<textarea rows="5" cols="50" name="review_content" id="summernote"></textarea><br>
	첨부파일1<input type="file" name="file1"><br>
	<input type="submit" value="등록">
	<input type="button" value="취소">
</form>

  <script>
	$("#summernote").summernote({
		  height: 300,
		  minHeight: null,
		  maxHeight: null
	});

</script>

</div>
