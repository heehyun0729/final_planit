<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<c:choose>
		<c:when test="${profilemap.FOLLOW_GRADE==0 && !mem_tf }"></c:when>
		<c:otherwise><pre>${profilemap.PROFILE_COMM }</pre></c:otherwise> 
	</c:choose>
</div>