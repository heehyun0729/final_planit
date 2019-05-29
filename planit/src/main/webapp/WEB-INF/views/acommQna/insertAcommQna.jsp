<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="acommInsert">
<form method="post" action="<c:url value="/acommQna/insertAcommQna"/>">
	내용<textarea rows="10" cols="50" name="content"></textarea><br>
	<input type="submit" value="등록">
</form>
</div>