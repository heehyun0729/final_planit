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
			<h2 class="page-cover-tittle f_48">숙소후기 수정</h2>
			<p style="color: #D8D8D8">숙소 후기 글을 수정해 주세요!!</p>
		</div>
	</div>
</section>
<div class="container">

		<div>
		<h1>숙소 리뷰 수정</h1>
		<form method="post" action="${pageContext.request.contextPath }/resReviewUpdate">
				예약번호<input class="form-control" type="text" name="accom_num" value="${accom_num }" readonly="readonly">
			<br>
			<p>글번호<input class="form-control" type="text" name="resReview_num" readonly="readonly" value="${vo.resReview_num }"></p>
			<br>
			<p>제목<input class="form-control" type="text" name="resReview_title" value="${vo.resReview_title }"><br></p>
			 <p> 내용<textarea id="summernote" rows="5" cols="50" name="resReview_content">${vo.resReview_content }</textarea><br></p>
			<div id="resReview_star"> 
								별점 <input type="radio" name="resReview_star" id="star5" value="5" checked="checked"/><label id="full" for="star5">★★★★★</label>
								<label id="full" for="star4"><input type="radio" name="resReview_star" id="star4" value="4">★★★★</label>
								<input type="radio" name="resReview_star" id="star3" value="3"><label id="full" for="star3">★★★</label>
								<input type="radio" name="resReview_star" id="star2" value="2"><label id="full" for="star2">★★</label>
								<input type="radio" name="resReview_star" id="star1" value="1"><label id="full" for="star1">★</label>
							</div>
									</form>
								</div> 
								<p><div class="text-right">
								<input type="submit" class="genric-btn primary circle small" value="숙소 후기 수정">
								<input type="button" class="genric-btn primary circle small" value="숙소 후기  수정 취소">
				       			
				</div>
		
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