<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="accomQna">
<form method="post" action="<c:url value="/accomQna/insertAccomQna"/>">
	<input type="hidden" name="mem_id" value="${mem_id }">
	제목<input type="text" name="accomQna_title"><br>
 	내용<textarea rows="10" cols="50" name="accomQna_content"></textarea><br>
	<input type="submit" value="등록">
</form>
</div>