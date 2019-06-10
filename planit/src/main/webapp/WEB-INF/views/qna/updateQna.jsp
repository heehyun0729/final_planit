<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="update">
<form method="post" action="${pageContext.request.contextPath }/qna/updateQna">
	<input type="hidden" name="qna_num" value=${vo.qna_num }>${vo.qna_num }
		제목<input type="text" name="qna_title" value=${vo.qna_title }>
		<!-- value=${vo.qna_title } -->
		<textarea id="summernote" name="qna_content">${vo.qna_content }</textarea>
		<!-- <div name="qna_content" id="summernote" value=${vo.qna_content }></div> -->
	<div>
	</div>
	<input type="submit" value="저장">
</form>
<script>
	$("#summernote").summernote({
		  height: 300,
		  minHeight: null,
		  maxHeight: null,
		  focus: true
	});
	

</script>
</div>