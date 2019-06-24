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
			<select class="form-control" id="qna_cate" name="qna_cate" id="qna_cate">
				<option value="카테고리">카테고리선택</option>
				<option value="관광지">관광지</option>
				<option value="맛집">맛집</option>
			</select>
			<div style="padding-top: 100px">
			제목<input class="form-control" type="text" name="qna_title">
			</div>
			<div style="padding-top: 20px">
			내용<textarea id="summernote" name="qna_content"></textarea>
			<div style="margin:auto;">
			<input style="margin:auto;" class="genric-btn danger radius" type="submit" value="등록">
			</div>	
			</div>
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

