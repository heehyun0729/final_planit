<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="result">
	<c:choose>
		<c:when test="${result == 'success' }">
			<h1>요청작업을 성공적으로 수행했습니다.</h1>
		</c:when>
		<c:otherwise>
			<h1>오류로 인해 요청작업을 실패했습니다.</h1>
		</c:otherwise>
	</c:choose>
<a href="${pageContext.request.contextPath }/accomDetail?accom_num=${vo.accom_num}">돌아가기</a>
</div>