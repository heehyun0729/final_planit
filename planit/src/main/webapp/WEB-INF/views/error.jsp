<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class = "container">
	<div class = "row text-center" style = "margin-top: 200px;">
		<span style = "color:#ff5252"><i class="fas fa-exclamation-circle fa-7x"></i></span>
		<h1 class = "title-color">ERROR</h1>
		<p>오류가 발생하여 요청을 처리하지 못했습니다.</p>
		<div>
			<input type = "button" class = "genric-btn success-border circle arrow" value = "뒤로가기" onclick = "javascript:history.back();">
		</div>
	</div>
</div>