<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/admin.css'/>">
<style type="text/css">
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".go").on("click", function(){
			$(location).prop("href","<c:url value='/adminAdRequestForm'/>");
		});
	});
</script>
<body>
<div class="container-fluid">
	<div class="row mb-5 d-relative">
		<div class="col">
			<div id="adSlide" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="<c:url value='/resources/adminImages/graphs.jpg'/>" class="d-block w-100" alt="광고이미지1">
						<div class="go btn btn-primary"><span>광고신청하기</span></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row justify-content-md-center">
		<div class="col">
			<div class="card h-100 hover">
				<h5 class="card-header text-center bg-olive text-white">광고 신청</h5>
				<div class="card-body align-self-center">
					<p class="card-text">7일 이후의 광고를 신청합니다.</p>
					<p class="card-text">확률은 10%단위로 신청합니다.</p>
					<p class="card-text">이미지 크기는 100*500입니다.</p>
				</div>
			</div>
		</div>
		
		<div class="col-1 align-self-center text-center">
			<img alt="다음 단계" class="align-middle" src="<c:url value='/resources/adminImages/right-arrow.png'/>">
		</div>
		
		<div class="col">
			<div class="card h-100 hover">
				<h5 class="card-header text-center bg-olive text-white">광고 심의</h5>
				<div class="card-body align-self-center">
					<p class="card-text">불건전 내용 여부를 확인합니다.</p>
					<p class="card-text">심의에는 하루가 소요됩니다.</p>
				</div>
			</div>
		</div>
		
		<div class="col-1 align-self-center text-center">
			<img alt="다음 단계" class="align-middle" src="<c:url value='/resources/adminImages/right-arrow.png'/>">
		</div>
		
		<div class="col">
			<div class="card h-100 hover">
				<h5 class="card-header text-center bg-olive text-white">광고 게재</h5>
				<div class="card-body align-self-center">
					<p class="card-text">신청하신 날짜에 게재됩니다.</p>
					<p class="card-text">광고를 관리할 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<footer>
	<div id="footerWrapper">
	</div>
</footer>
</body>