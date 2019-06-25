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
		style="background: url(../resources/images/buddy02.jpg)"
		data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
		data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">여행후기</h2>
			<p style="color: #D8D8D8">여행의 추억을 공유해보세요!</p>
		</div>
	</div>
</section>   
<div class="container">
<div>
<h1>여행 리뷰 수정</h1>
<form method="post" action="${pageContext.request.contextPath }/reviewUpdate" enctype="multipart/form-data">
	글번호<input class="form-control"  type="text" readonly="readonly" name="review_num" value="${vo.review_num }"><br>
	
	<p>국가<input class="form-control" type="text" name="review_country" value="${vo.review_country }"></p>
	<p>도시<input class="form-control" type="text" name="review_city" value="${vo.review_city }"></p>
	<p>제목<input class="form-control" type="text" name="review_title" value="${vo.review_title }"></p>
	 <br> 후기<textarea id="summernote" rows="5" cols="50" name="review_content">${vo.review_content }</textarea><br>
	<p>대표이미지<input type="file" name="file1"></p>
	<p><div class="text-right">
	<input type="submit" class="genric-btn primary circle small" value="저장">
	<input type="button" class="genric-btn primary circle small" value="취소">
	</div></p>
</form>
</div>
</div>