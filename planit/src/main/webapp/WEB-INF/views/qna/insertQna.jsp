<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="breadcrumb_area">
	<div class="overlay bg-parallax"
		style="background: url(../resources/images/qna2.png)"
		data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
		data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">여행문의</h2>
			<p style="color: #D8D8D8">자유롭게 의견을 나눌 수 있는 공간</p>
		</div>
	</div>
</section>
<br>

<div class="container">
	<div class="row">
	<div id="insertQna" class="col-lg-12">
	<div>
		<form method="post" action="<c:url value="/qna/insertQna"/>" enctype="multipart/form-data">
			<input type="hidden" name="mem_id" value="${mem_id }"> 
			<select id="qna_cate" name="qna_cate" id="qna_cate">
				<option value="여행">여행</option>
				<option value="관광지">관광지</option>
			</select>
			<br>
			<input type="text" name="qna_title"><br>
			<textarea id="summernote" name="qna_content"></textarea>
			<input type="submit" value="등록">
		</form>
		</div>
		<br>
		<br><br>
		<div>
		<script>
			$("#summernote").summernote({
				height : 300px,
				minHeight : null,
				maxHeight : null
			});
		</script>
		</div>
	</div>
	</div>
</div>

