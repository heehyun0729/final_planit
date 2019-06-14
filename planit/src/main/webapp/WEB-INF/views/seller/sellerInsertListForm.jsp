<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<h1>판매자 등록양식</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath}/accommInsert">숙소추가</a></li>
		<li><a href="${pageContext.request.contextPath}/accommList">방추가</a></li>
		<li><a href="<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }'/>" onclick = "setCalendar()">예약 목록</a></li>
	</ul>