<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="userResult">
	<c:choose>
		<c:when test="${empty authMsg }">
		요청이 만료되었습니다.
	</c:when>
		<c:otherwise>
			${authMsg }
		</c:otherwise>
	</c:choose>
</div>