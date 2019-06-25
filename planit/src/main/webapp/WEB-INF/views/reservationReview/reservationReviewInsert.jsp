<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<style>
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}

</style>
<!--================style Area =================-->
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
			<h2 class="page-cover-tittle f_48">숙소후기 등록</h2>
			<p style="color: #D8D8D8">숙소후기 글을 등록해 보세요!!</p>
		</div>
	</div>
</section>

<div>
	<div class="container">
		
					<form method="post" action="${pageContext.request.contextPath }/reservationReview/reservationReviewInsert" >
							<input class="form-control" type="hidden" readonly="readonly" name="accom_num" value="${param.accom_num }">
							<br>예약번호<input class="form-control" type="text" readonly="readonly" name="rsvn_num" value="${param.rsvn_num }"> <br>
							<p> 아이디<input class="form-control" type="text" readonly="readonly" name="mem_id" value="${sessionScope.mem_id }"><br></p>
							<p> 제목<input class="form-control" type="text" name="resReview_title" placeholder="입력해주세요"><br></p>
							 내용<textarea rows="5" cols="50" name="resReview_content" id="summernote"></textarea><br>
						<div id="resReview_star"> 
								별점 <input type="radio" name="resReview_star" id="star5" value="5" checked="checked"/><label id="full" for="star5">★★★★★</label>
								<label id="full" for="star4"><input type="radio" name="resReview_star" id="star4" value="4">★★★★</label>
								<input type="radio" name="resReview_star" id="star3" value="3"><label id="full" for="star3">★★★</label>
								<input type="radio" name="resReview_star" id="star2" value="2"><label id="full" for="star2">★★</label>
								<input type="radio" name="resReview_star" id="star1" value="1"><label id="full" for="star1">★</label>
							</div>
							<input type="submit" class="genric-btn primary circle small" value="숙소 후기 등록">
								<input type="button" class="genric-btn primary circle small" value="숙소 후기 취소">
						
						</form>	
						
					<br>
						<script>
						 $("#summernote").summernote({
							 height: 300,
							 minHeight: null,
						      maxHeight: null
						});
						 $( ".star_rating a" ).click(function() {
						     $(this).parent().children("a").removeClass("on");
						     $(this).addClass("on").prevAll("a").addClass("on");
						     return false;
						});


						
						</script>
			</div>
		</div>
		<!--  -->