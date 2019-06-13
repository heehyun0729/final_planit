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
	<c:if test="${sessionScope.mem_id == vo.mem_id }">
		<div id="planMenu">
			<ul>
				<li>
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#startDateDialog">
					  출발일변경
					</button>
				</li>
				<li>
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#infoDialog"> 
					  정보수정
					</button>
				</li>
				<li>
					<a class="btn btn-default" href="<c:url value='/plan/planner?plan_num=${vo.plan_num }'/>">
					  루트수정
					</a>
				</li>
				<li>
					<button type="button" class="btn btn-default" onclick="javascript:deletePlan()">
					  일정삭제
					</button>
				</li>
			</ul>
		</div>
		<!-- 출발일 변경 dialog -->
		<div id = "startDateDialog" class="modal fade" role="dialog">
			<div class="modal-dialog ">
				<div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">출발일 변경</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <div id="startDatepicker"></div>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary" onclick="javascript:updateStartDate()">저장</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			      </div>
			    </div>
		    </div>
		</div>
		<!-- 정보수정 dialog -->
		<div id = "infoDialog" class="modal fade " tabindex="-1" role="dialog">
			<div class="modal-dialog ">
				<div class="modal-content ">
			      <div class="modal-header">
			        <h5 class="modal-title">플래너 정보 수정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <div>
					<p>
						<label for="infoTitle">제목</label><br>
						<input type = "text" value="${vo.plan_title }" id = "infoTitle">
					</p>
					<p>
						<label for="infoTitle">공개여부</label><br>
						<input type = "radio" name = "infoPublic" value = "0"
							<c:if test = "${vo.plan_public == 0 }"> checked = "checked" </c:if>
						>공개
						<input type = "radio" name = "infoPublic" value = "1"
							<c:if test = "${vo.plan_public == 1 }"> checked = "checked" </c:if>
						>비공개
					</p>
				</div>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary" onclick="javascript:updateInfo()">저장</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			      </div>
			    </div>
		    </div>
		</div>
		<!-- 세부일정 수정 dialog -->
		<div id = "scheduleDialog" class="modal fade" role="dialog">
			<div class="modal-dialog ">
				<div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">세부일정 수정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <div>
						<div>도시</div>
						<div id = "scheduleCity">
						
						</div>
						<div>날짜</div>
						<div id = "scheduleDate"></div>
						<label for="scheduleDetail">세부일정</label>
						<div>
							<textarea rows="10" cols="40" id = "scheduleDetail"></textarea>
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary" onclick="javascript:updateSchedule()">저장</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			      </div>
			    </div>
		    </div>
		</div>
	</c:if>
	<div id = "goList"><a href = "<c:url value='/plan/list?pageNum=${param.pageNum }&field=${param.field }&keyword=${param.keyword }'/>">목록</a></div>
	<!-- 지도 -->
	<div id="detailMap"></div>
	<div id="planStays">
		<div>
			<span>${vo.plan_stays }</span>일
		</div>
	</div>
	<!-- 달력 -->
	<div id="planCalendar"></div>
	<!-- 일정표 -->
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
						<td>${dvo.planDetail_city }, ${dvo.planDetail_country }</td>
						<td>${dvo.planDetail_inDate }~${dvo.planDetail_outDate } (${dvo.planDetail_stay }박)</td>
						<td>
							${dvo.planDetail_detail }
							<c:if test="${sessionScope.mem_id == vo.mem_id }">
								<br>
								<a href="javascript:openScheduleDialog('${dvo.planDetail_num }')" title="수정"><span style = "color:gray;"><i class="fas fa-edit"></i></span></a>
								<c:if test="${!empty dvo.planDetail_detail}">
									<a href="javascript:deleteSchedule('${dvo.planDetail_num }')" title="삭제"><span style = "color:gray;"><i class="fas fa-trash-alt"></i></span></a>
								</c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>