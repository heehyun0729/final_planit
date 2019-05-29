<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="insert">
<form method="post" action="<c:url value="/qna/insertQna"/>">
	제목<input type="text" name="writer"><br>
	내용<textarea rows="10" cols="50" name="content"></textarea><br>
	첨부파일<input type="file" name="file1"><br>
	<input type="submit" value="등록">
</form>
</div>