<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.active {
	color: #fff !important;
	background-color: #337ab7 !important;
	border-color: #2e6da4 !important;
}

.mg_p {
	margin: 20px 0px;
}

.page-liner {
	padding-bottom: 9px;
	margin: 20px 0 20px;
	border-bottom: 1px solid #eee;
}

.ui-datepicker {
	font-size: 20px;
	width: 350px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 60px;
	font-size: 20px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 80px;
	font-size: 20px;
}
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax"
		style="background: url(resources/images/buddy02.jpg)"
		data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
		data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">페이지 이동</h2>
			<p style="color: #D8D8D8">해당 리스트 이동해  글을 등록해 보세요!!</p>
		</div>
	</div>
</section>

<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/royal/css/responsive.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
</head>
<body>
<p><div class="text-bottom">
<h1>요청작업 완료!</h1>
<a href="${pageContext.request.contextPath }/">메인페이지</a><br>
</div>
</body>