<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"	crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
		<link rel="stylesheet" href="<c:url value='/resources/css/admin/admin.css'/>">
		<link rel="stylesheet" href="<c:url value='/resources/css/plan/fullcalendar.css'/>">
		<link rel="stylesheet" href="<c:url value='/resources/css/plan/jquery.qtip.css'/>">
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/admin/chartjs-plugin-labels.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/admin/plan.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/admin/reservation.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/plan/moment.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/plan/jquery.qtip.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/plan/fullcalendar.min.js'/>"></script>
		<title>PlanIt::관리자::</title>
	</head>
	<style>
		
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".table a").on("click", function(event){//모달 열기
				event.preventDefault();
				const src=$(event.target).parent().prop("href");
				$("#modalSrc").html('<iframe style="border: 0px; " src="' + src + '" width="100%" height="820px"></iframe>');
				$("#clickMe").click();
			});
			$('#exampleModal').on('hidden.bs.modal', function () {//모달 닫힐때 새로고침
				  window.location.reload();
			});
			var nowPage="";//사이드바 자동 열기
			if(${current=='approvedAdList' || current=='requestRefundAdList' || current=='allAdList' || current=='requestChangeAdImageList' || current=='adCalendar'}){
				nowPage="ad";
			}
			if(nowPage=="ad"){
				$("#ad").collapse('show');
			}
			var adBadge=0;//새로운 뱃지 요청 검사
			var approveAdBadge=0;
			var requestRefundAdBadge=0;
			$.getJSON("<c:url value='/adminAdBadges'/>", function(data) {
				if(data!=null){
					approveAdBadge=data["approveAdBadge"];
					requestRefundAdBadge=data["requestRefundAdBadge"];
					requestChangeAdImageBadge=data["requestChangeAdImageBadge"];
					adBadge=approveAdBadge+requestRefundAdBadge+requestChangeAdImageBadge;
					if(approveAdBadge!=0) $("#approveAdBadge").text(approveAdBadge);
					if(requestRefundAdBadge!=0) $("#requestRefundAdBadge").text(requestRefundAdBadge);
					if(requestChangeAdImageBadge!=0) $("#requestChangeAdImageBadge").text(requestChangeAdImageBadge);
					if(adBadge!=0) $("#adBadge").text(adBadge);
				}
			});
		});		
	</script>
	<body>
		<tiles:insertAttribute name = "adminNav"/>
		<div class="row" id="body-row">
			<tiles:insertAttribute name = "adminSideBar"/>
			<div class="col">
				<tiles:insertAttribute name = "adminBody"/>
			</div>
		</div>
	</body>
</html>