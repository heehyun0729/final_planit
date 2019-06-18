<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }&callback=initDetailMap"></script>
<script>
	$(function(){
		$("#showMsgPopup").click(function(e) {
			e.preventDefault();
		});
	});
	function ppp(mem_id){
		var popUrl = "<c:url value='/msgSendForm?id=" + mem_id + "'/>";
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"쪽지보내기",popOption);
	}
</script>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(../resources/images/map.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">계획짜기</h2>
            <ol class="breadcrumb">
                <li><a href="<c:url value = '/'/>">홈</a></li>
                <li class="active">계획짜기</li>
            </ol>
        </div>
    </div>
</section>
<!--================Breadcrumb Area =================-->
<input type="hidden" id="plan_num" value="${vo.plan_num }">
 <section class="contact_area section_gap">
    <div class="container">
        <div class="row" style = "margin-bottom: 40px;">
        	<div class = "col-md-9">
        		<div class = "row">
					<h2 style = "display:inline-block;float:left;">${vo.plan_title }</h2>
					<img src = "<c:url value = '${img }'/>" class="img-circle avatar" style = "display: inline-block;float:left;margin-right: 10px;margin-top:5px;margin-left:50px;">
					<div class="dropdown show" style = "display: inline-block;float:left;padding-top: 10px;">
					  <a href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${vo.mem_id }</a>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					  	<a class="dropdown-item" href = "<c:url value = '/member/mypage/${vo.mem_id}'/>" target = "_blank">프로필 보기</a>
						<a class="dropdown-item" href = "#" onclick="javascript:ppp('${vo.mem_id}')" id = "showMsgPopup">쪽지 보내기</a>
					  </div>
					</div>
				</div>
			</div>
			<div class = "col-md-3" style = "text-align: right;">
				<c:if test="${sessionScope.mem_id == vo.mem_id }">
					<div class="dropdown show" style = "display: inline-block;margin-right:20px;">
					  <a href="#" class = "genric-btn primary circle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class = "lnr lnr-cog"></i>&nbsp;&nbsp; 관리&nbsp; <i class="fas fa-angle-down"></i></a>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					  	<a href = "#" class="dropdown-item" data-toggle="modal" data-target="#startDateDialog">출발일변경</a>
					  	<a href = "#" class="dropdown-item" data-toggle="modal" data-target="#infoDialog">정보수정</a>
					  	<a href = "<c:url value='/plan/planner?plan_num=${vo.plan_num }'/>" class="dropdown-item">루트수정</a>
					  	<a href = "#" class="dropdown-item" onclick="javascript:deletePlan()">일정삭제</a>
					  </div>
					</div>
				</c:if>
				<a href = "<c:url value='/plan/list?pageNum=${param.pageNum }&field=${param.field }&keyword=${param.keyword }'/>" class="genric-btn success-border circle">목록</a>
			</div>
        </div>
        <div class="row" style = "height: 500px;margin-bottom: 40px;">
        	<!-- 지도 -->
            <div class="col-md-7" style = "padding: 0px;">
                <div id="detailMap" style = "height: 100%;"></div>
				<div id="planStays">
					<div>
						<span>${vo.plan_stays }</span>일
					</div>
				</div>
            </div>
            <div class="col-md-5">
                <!-- 달력 -->
				<div id="planCalendar"></div>
            </div>
        </div>
        <div class = "row text-center">
        	<!-- 일정표 -->
			<div id="planSchedule" class="progress-table-wrap" style = "width: 80%;margin-left:10%;margin-right:10%;">
				<h2>일정표</h2>
				<div>
					<div class = "progress-table">
						<div class="table-head">
							<div style = "width: ">순서</div>
							<div style = "width: ">도시</div>
							<div style = "width: ">날짜</div>
							<div style = "width: ">일정</div>
						</div>
						<c:forEach var="dvo" items="${dlist }">
							<tr>
								<td>${dvo.planDetail_order + 1}</td>
								<td>${dvo.planDetail_city }, ${dvo.planDetail_country }</td>
								<td>${dvo.planDetail_inDate } ~ ${dvo.planDetail_outDate } (${dvo.planDetail_stay }박)</td>
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
					</div>
				</div>
			</div>
        </div>
    </div>
</section>



<div id="planDetail">
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
	<!-- 지도 -->
	
	
</div>