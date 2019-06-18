<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/admin.css'/>">
<style type="text/css">
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle"></h2>
		</div>
	</div>
</section>
<div class="container mt-5 h-100">
    <div class="row align-items-center h-100">
        <div class="col mx-auto">
            <div class="jumbotron text-center">
                <h1 class="display-4">광고 신청이 완료되었습니다</h1>
                <p class="lead">광고 신청 진행사항 및 광고 통계 등 상세사항은 마이페이지 -> 광고 를 참고하세요.</p>
                <p class="lead">기타 문의사항은 관리자에게 쪽지로 문의주시기 바랍니다.</p>
                <p class="lead">
                    <a class="btn btn-primary btn-lg" href="<c:url value='/member/mypage/ad/${mem_id}/myAdList'/>" role="button">마이페이지</a>
                </p>
            </div>
        </div>
    </div>
</div>