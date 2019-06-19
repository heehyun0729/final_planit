<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================style Area =================-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/linericon/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value='/resources/royal/css/responsive.css'/>">

<style>
	.active { color: #fff !important; background-color: #337ab7 !important; border-color: #2e6da4 !important;}
	.mg_p { margin:20px 0px; }
	.page-liner{padding-bottom: 9px;margin: 20px 0 20px;border-bottom: 1px solid #eee;}
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style="background : url(resources/images/buddy01.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">동행 추천</h2>
            <p style="color:#D8D8D8">나와 같은 도시를 여행하는 동행을 추천해드립니다!</p>
        </div>
    </div>
</section>

<!--================body Area =================-->
<div class="container">
	<br>
	<div class="facilities_item">
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">아이디</div><div class="serial">시작날짜</div><div class="serial">끝날짜</div><div class="serial">희망성별</div><div class="serial">희망나이</div><div class="serial">도시</div><div class="serial">쪽지하기</div><div class="serial">동행요청</div>
				</div>
				<c:forEach var="list" items="${list}">
					<div class="table-head">
						<div class="serial">${list.mem_id }</div>
						<div class="serial">${list.buddy_indate }</div>
						<div class="serial">${list.buddy_outdate }</div>
						<c:choose>
							<c:when test="${list.buddy_gender =='X'}">
								<div class="serial">상관없음</div>
							</c:when>
							<c:when test="${list.buddy_gender =='M'}">
								<div class="serial">남자</div>
							</c:when>
							<c:when test="${list.buddy_gender =='W'}">
								<div class="serial">여자</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${list.buddy_birthyear==0 }">
								<div class="serial">상관없음</div>
							</c:when>
							<c:otherwise>
								<div class="serial">${list.buddy_birthyear }대</div>
							</c:otherwise>
						</c:choose>
						<div class="serial">${list.buddy_city }</div>
						<div class="serial"><a href="<c:url value='/msgSendPopupForm?id=${list.mem_id }'/>" class="btn btn-success msgBtn">쪽지하기</a></div>
						<div class="serial"><input type="button" value="동행요청하기" onclick="apply_buddy('${list.buddy_num}')" class="btn btn-success msgBtn"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="localurl" value="<c:url value='/'/>">

<!--================ script =================-->
<script type="text/javascript">

	var localurl=$('#localurl').val();
	//동행요청
	function apply_buddy(buddy_num){
		var result = confirm('동행을 요청하시겠습니까?');
		if(result) {
			alert("신청되었습니다.");
			window.location.href=localurl+"buddyApplyBuddy_pop?buddy_num="+buddy_num;
		}else{
			
		}
	}
</script>
<script src="<c:url value='/resources/royal/vendors/owl-carousel/owl.carousel.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/jquery.ajaxchimp.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/mail-script.js'/>"></script>
<script src="<c:url value='/resources/royal/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/vendors/nice-select/js/jquery.nice-select.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/stellar.js'/>"></script>
<script src= "<c:url value='/resources/royal/vendors/lightbox/simpleLightbox.min.js'/>"></script>
<script src= "<c:url value='/resources/royal/js/custom.js'/>"></script>