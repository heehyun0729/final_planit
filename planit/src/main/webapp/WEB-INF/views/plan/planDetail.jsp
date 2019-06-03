<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }&callback=initDetailMap"></script>

<div id = "planDetail">
	<input type ="hidden" id = "plan_num" value="${vo.plan_num }">
	<div>
		<h2>${vo.plan_title }</h2>
		<div>${vo.mem_id }</div>
	</div>
	<div id = "detailMap"></div>
	<div id = "planStays"><div><span>${vo.plan_stays }</span>일</div></div>
	<div id = "planCalendar"></div>
</div>