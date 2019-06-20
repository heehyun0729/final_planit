<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
			<h2 class="page-cover-tittle f_48">여행후기 등록</h2>
			<p style="color: #D8D8D8">여행후기 글을 등록해 보세요!!</p>
		</div>
	</div>
</section>
<br>
	<div class="container">
		<div id=ReviewInsert>
			<h1>여행후기 글등록</h1>
			<form method="post"action="${pageContext.request.contextPath }/review/reviewInsert"enctype="multipart/form-data">
			
				I D<input class="form-control" type="text" readonly="readonly" name="mem_id"value="${sessionScope.mem_id }"><br>
				
				
				국 가<input class="form-control" type="text" name="review_country" placeholder="입력해주세요"><br>
			
				
				<p>도 시<input class="form-control" type="text" name="review_city" placeholder="입력해주세요"></p>
			
				
				<p>제 목<input class="form-control" type="text" name="review_title" placeholder="입력해주세요"></p>
				
				 <br>후기<textarea rows="5" cols="50" name="review_content" id="summernote" ></textarea><br>
				
				
				<p>대표이미지<input  type="file" name="file1"></p>
				 
				<p><div class="text-right">
					<input type="submit" class="genric-btn primary circle small" value="여행 후기 등록"> 
					<input type="button" class="genric-btn primary circle small"  value="여행 후기 취소">
				</div>	</p>
			</form>
	
			<script>
				$("#summernote").summernote({
					height : 300,
					minHeight : null,
					maxHeight : null
				});
			</script>
	</div>
</div>