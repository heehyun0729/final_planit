<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id = "box">
	<div id = "planTop">
		<h2>Planit과 함께 여행을 즐겨보세요.</h2>
		<span>
			<a href = "<c:url value = '/plan/planner'/>">플래너 시작</a>
		</span>
	</div>
	<div id = "list">
		<h1>다른 여행자들의 플래너</h1>
		<c:forEach var = "vo" items="${list }">
			<div class = "userPlan">
				<div>
					<img src = "${vo.plan_img }">
				</div>
				<div class = "planTitle">
					${vo.plan_title }
				</div>
				<div class = "planId">
					${vo.mem_id }
				</div>
			</div>
		</c:forEach>
	</div>
</div>
