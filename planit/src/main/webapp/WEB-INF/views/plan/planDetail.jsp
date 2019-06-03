<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }&callback=initDetailMap"></script>

<div id="planDetail">
	<input type="hidden" id="plan_num" value="${vo.plan_num }">
	<div id="planTitle">
		<h2>${vo.plan_title }</h2>
		<div>${vo.mem_id }</div>
	</div>
	<div id="planMenu">
		<ul>
			<li><a href="#">출발일변경</a></li>
			<li><a href="#">정보수정(제목, 공개여부)</a></li>
			<li><a href="#">루트수정</a></li>
			<li><a href="#">일정삭제</a></li>
		</ul>
	</div>
	<div id="detailMap"></div>
	<div id="planStays">
		<div>
			<span>${vo.plan_stays }</span>일
		</div>
	</div>
	<div id="planCalendar"></div>
	<div id="planSchedule">
		<h2>일정표</h2>
		<div>
			<table border = "1">
				<tr>
					<th>순서</th>
					<th>도시</th>
					<th>날짜</th>
					<th>일정</th>
				</tr>
				<c:forEach var="dvo" items="${dlist }">
					<tr>
						<td>${dvo.planDetail_order + 1}</td>
						<td>${dvo.planDetail_city },${dvo.planDetail_country }</td>
						<td>${dvo.planDetail_inDate }~${dvo.planDetail_outDate }</td>
						<td>
							${dvo.planDetail_detail }<br>
							<a href="javascript:openScheduleDialog('${dvo.planDetail_num }')" title="수정"><span style = "color:gray;"><i class="fas fa-edit"></i></span></a>
							<c:if test="${!empty dvo.planDetail_detail}">
								<a href="javascript:deleteSchedule('${dvo.planDetail_num }')" title="삭제"><span style = "color:gray;"><i class="fas fa-trash-alt"></i></span></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id = "scheduleDialog" title = "세부일정 수정">
		<div>
			<p>도시</p>
			<div id = "scheduleCity"></div>
			<p>날짜</p>
			<div id = "scheduleDate"></div>
			<p>세부일정</p>
			<div>
				<textarea rows="10" cols="40" id = "scheduleDetail"></textarea>
			</div>
		</div>
	</div>
</div>