<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<link rel="icon" href="<c:url value = '/resources/images/logo1.png'/>" type="image/png">
<title>Plan it!</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery.qtip.css'/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/fullcalendar.css'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/linericon/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/responsive.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">

<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-ui.min.js'/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/map.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/detail.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/jquery.qtip.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/moment.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/locale-all.js'/>"></script>
<script type="text/javascript" src = "<c:url value='/resources/js/buddy/list.js'/>"></script>
<script type="text/javascript" src = "<c:url value='/resources/js/buddy/insert.js'/>"></script>
<script type="text/javascript" src = "<c:url value='/resources/js/buddy/buddyMg.js'/>"></script>
<script type="text/javascript" src = "<c:url value='/resources/js/buddy/buddySg.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/reservation/list.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/reservation/detail.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/reservation/pay.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/accom/PlacePicker.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/accom/insert.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/qna/insert.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/qna/update.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/members/myRsvn.js'/>"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/members/mypageScript.js'/>"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">마이페이지</h2>
			<p style="color: #D8D8D8">나를 소개해보세요!</p>
		</div>
	</div>
</section>
	<section class="mypage mt-3">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="row d-flex justify-content-start">
				<tiles:insertAttribute name="profile" />
				<div id="mypage_menu" class="col-sm-9">
					<div class="row">
						<div class="col-sm-12">
							<tiles:insertAttribute name="profiletopmenu" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<tiles:insertAttribute name="profilecontent" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<tiles:insertAttribute name="footer" />
<script src="<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/jquery.ajaxchimp.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/mail-script.js'/>"></script>
<script src="<c:url value='/resources/royal/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/vendors/nice-select/js/jquery.nice-select.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/stellar.js'/>"></script>
<script src= "<c:url value='/resources/royal/vendors/lightbox/simpleLightbox.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/custom.js'/>"></script>
</body>
</html>