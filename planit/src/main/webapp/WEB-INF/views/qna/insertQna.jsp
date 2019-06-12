<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="QnaInsert">
<form method="post" action="<c:url value="/qna/insertQna"/>">
	<input type="hidden" name="mem_id" value="${mem_id }">
		분류<select id="qna_cate" name="qna_cate" id="qna_cate">
		<option value="여행">여행</option>
		<option value="관광지">관광지</option>
	</select><br>
	제목<input type="text" name="qna_title"><br>
	<textarea id="summernote" name="qna_content"></textarea>
	<!--<textarea rows="10" cols="50" name="qna_content"></textarea><br>  -->
	<input type="submit" value="등록">
</form>
</div>