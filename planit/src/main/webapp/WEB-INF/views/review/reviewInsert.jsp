<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!--================style Area =================-->
<style>
	.active { color: #fff !important; background-color: #337ab7 !important; border-color: #2e6da4 !important;}
	.mg_p { margin:20px 0px; }
	.page-liner{padding-bottom: 9px;margin: 20px 0 20px;border-bottom: 1px solid #eee;}
	
	.ui-datepicker{ font-size: 20px; width: 350px; }
	.ui-datepicker select.ui-datepicker-month{ width:60px; font-size: 20px; }
	.ui-datepicker select.ui-datepicker-year{ width:80px; font-size: 20px; }
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(resources/images/buddy02.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">동행 등록</h2>
            <p style="color:#D8D8D8">나와 함께 여행할 동행을 찾기 위해 글을 등록해 보세요!!</p>
        </div>
    </div>
</section>
<div id=ReviewInsert>
<h1></h1>
<form method="post" action="${pageContext.request.contextPath }/review/reviewInsert" enctype="multipart/form-data">
	  아이디<input type="text" readonly="readonly" name="mem_id" value="${sessionScope.mem_id }"><br>
	국가<input type="text" name="review_country"><br>
	도시<input type="text" name="review_city"><br>
	제목<input type="text" name="review_title"><br>
	내용<textarea rows="5" cols="50" name="review_content" id="summernote"></textarea><br>
	첨부파일1<input type="file" name="file1"><br>
	<input type="submit" value="등록">
	<input type="button" value="취소">
</form>

  <script>
	$("#summernote").summernote({
		  height: 300,
		  minHeight: null,
		  maxHeight: null
	});

</script>

</div>
