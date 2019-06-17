<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
<div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
	<ul class="list-group">
		<li	class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
			<small></small>
		</li>
		<c:if test="${mem_stat==0 }">
		<!-- 관리자 전용 -->
			<a href="#ad" id="adBtn" data-toggle="collapse" aria-expanded="false" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-start align-items-center">
					<span class="far fa-eye fa-fw mr-3"></span>
					<span class="menu-collapsed">광고
						<span id="adBadge" class="badge badge-pill badge-primary ml-2"></span>
					</span>
					<span class="fas fa-caret-down ml-auto"></span>
				</div>
			</a>
			<div id='ad' class="collapse sidebar-submenu">
				<a href="<c:url value='/admin/adminAdManagement/approvedAdList'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">승인 요청
						<span id="approveAdBadge" class="badge badge-pill badge-primary ml-2"></span>
					</span>
				</a>
				<a href="<c:url value='/admin/adminAdManagement/requestRefundAdList'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">환불 요청
						<span id="requestRefundAdBadge" class="badge badge-pill badge-primary ml-2"></span>
					</span>
				</a>
				<a href="<c:url value='/admin/adminAdManagement/requestChangeAdImageList'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">이미지 수정요청
						<span id="requestChangeAdImageBadge" class="badge badge-pill badge-primary ml-2"></span>
					</span>
				</a>
				<a href="<c:url value='/admin/adminAdManagement/allAdList'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">모든 광고</span>
				</a>
				<a href="<c:url value='/adminAdCalendar'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">광고 달력</span>
				</a>
			</div>
			<!-- 관리자 전용, 숙소/예약 -->
			<a href="#sell" id="sellBtn" data-toggle="collapse" aria-expanded="false" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-start align-items-center">
					<span class="fas fa-bed fa-fw mr-3"></span>
					<span class="menu-collapsed">숙소/예약
						<span id="acBadge" class="badge badge-pill badge-primary ml-2"></span>
					</span>
					<span class="fas fa-caret-down ml-auto"></span>
				</div>
			</a>	
			<div id='sell' class="collapse sidebar-submenu">
				<a href="<c:url value='/admin/sellerInsertListForm'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">숙소 목록</span>
				</a>
				<a href="<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">예약 목록</span>
				</a>
			</div>
			<li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
				<small></small>
			</li>
		</c:if>
		<c:if test="${mem_stat==1 }">
			<!-- 판매자 전용, 숙소/예약 -->
			<a href="#sell" id="sellBtn" data-toggle="collapse" aria-expanded="false" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-start align-items-center">
					<span class="fas fa-bed fa-fw mr-3"></span>
					<span class="menu-collapsed">숙소/예약
						<span id="acBadge" class="badge badge-pill badge-primary ml-2"></span>
					</span>
					<span class="fas fa-caret-down ml-auto"></span>
				</div>
			</a>	
			<div id='sell' class="collapse sidebar-submenu">
				<a href="<c:url value='/admin/sellerInsertListForm'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">숙소 목록</span>
				</a>
				<a href="<c:url value = '/seller/reservation/list?mem_id=${sessionScope.mem_id }'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">예약 목록</span>
				</a>
			</div>
			<li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
				<small></small>
			</li>
		</c:if>
		<c:if test="${mem_stat==0 }">
			<a href="#member" id="memberBtn" data-toggle="collapse" aria-expanded="false" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-start align-items-center">
					<span class="fa fa-user fa-fw mr-3"></span>
					<span class="menu-collapsed">회원</span>
					<span class="fas fa-caret-down ml-auto"></span>
				</div>
			</a>
			<div id='member' class="collapse sidebar-submenu">
				<a href="<c:url value='/admin/user/userlist'/>"	class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">일반 회원</span>
				</a>
				<a href="<c:url value='/admin/user/sellerlist'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">사업자 회원</span>
				</a>
			</div>
			<li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
				<small></small>
			</li>
			<a href="#board" id="boardBtn" data-toggle="collapse" aria-expanded="false" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-start align-items-center">
					<span class="fas fa-list fa-fw mr-3"></span>
					<span class="menu-collapsed">게시판</span>
					<span class="fas fa-caret-down ml-auto"></span>
				</div>
			</a>
			<div id='board' class="collapse sidebar-submenu">
				<a href="#"	class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">질문 게시판</span>
				</a>
				<a href="#" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">후기 게시판</span>
				</a>
				<a href="<c:url value = '/admin/plan/list'/>" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">일정 게시판</span>
				</a>
				<a href="#" class="list-group-item list-group-item-action bg-dark text-white">
					<span class="menu-collapsed">동행 게시판</span>
				</a>
			</div>
			<li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
				<small></small>
			</li>
		</c:if>
		<a href="<c:url value="/admin/msgReceiveList?memId=${mem_id }&msgType=RECEIVE"/>" class="bg-dark list-group-item list-group-item-action">
			<div class="d-flex w-100 justify-content-start align-items-center">
				<span class="fa fa-envelope fa-fw mr-3"></span>
				<span class="menu-collapsed">쪽지
					<span id="messageBadge" class="badge badge-pill badge-primary ml-2"></span>
				</span>
			</div>
		</a>
		<script>
				var xhr = null;
				//var cnum=setInterval(countList);
				function countList() {
					xhrList = new XMLHttpRequest();
					xhrList.onreadystatechange = countListOk;
					xhrList.open('get', '${pageContext.request.contextPath }/mem/readCheck?memId=${sessionScope.mem_id}', true);
					xhrList.send();
					
				}
				function countListOk() {
					if(xhrList.readyState == 4 && xhrList.status == 200){
						var data = xhrList.responseXML;
						var messageBadge = document.getElementById("messageBadge");
						var result=data.getElementsByTagName("result")[0];
						var comm = result.getElementsByTagName("comm")[0];
						var c = comm.getElementsByTagName("c")[0].firstChild.nodeValue;
					    if(c!=0){
					    	messageBadge.innerHTML=  c;
					    }
						
					}
				}
				</script>
		<li class="list-group-item sidebar-separator menu-collapsed"></li>
		<a href="<c:url value="/adminAnalytics"/>" class="bg-dark list-group-item list-group-item-action">
			<div class="d-flex w-100 justify-content-start align-items-center">
				<span class="fas fa-chart-bar fa-fw mr-3"></span>
				<span class="menu-collapsed">통계</span>
			</div>
		</a>
		<a href="<c:url value='/admin/test'/>" class="bg-dark list-group-item list-group-item-action">
			<div class="d-flex w-100 justify-content-start align-items-center">
				<span class="fas fa-vial fa-fw mr-3"></span>
				<span class="menu-collapsed">테스트</span>
			</div>
		</a>
	</ul>
</div>