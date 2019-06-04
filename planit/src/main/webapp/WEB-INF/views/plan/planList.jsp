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
					<a href = "<c:url value = '/plan/detail?plan_num=${vo.plan_num }'/>"><img src = "${vo.plan_img }"></a>
				</div>
				<div class = "planTitle">
					<a href = "<c:url value = '/plan/detail?plan_num=${vo.plan_num }'/>">${vo.plan_title }</a>
				</div>
				<div class = "planId">
					${vo.mem_id }
				</div>
			</div>
		</c:forEach>
	</div>
	<div id = "planPage">
		<c:if test="${startPage > 1 }">
			<a href = "<c:url value = '/plan/list?pageNum=${startPage - 1 }'/>"><span style = "color:skyblue;">[이전]</span></a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:choose>
				<c:when test="${i == pageNum }">
					<a href = "<c:url value = '/plan/list?pageNum=${i }'/>"><span style = "color:skyblue;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "<c:url value = '/plan/list?pageNum=${i }'/>"><span style = "color:gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href = "<c:url value = '/plan/list?pageNum=${endPage + 1 }'/>"><span style = "color:skyblue;">[다음]</span></a>
		</c:if>
	</div>
</div>
