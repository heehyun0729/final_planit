<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<style type="text/css">
	.alert {
		height: 20px;
		line-height: 20px;
		padding: 0px;
	}	
	.cursor{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#addFile").on('click', function(){//파일 추가 이벤트
			$("#none").empty();
			$("#none").append("<input type='file' id='newFile' name='file' onchange='moveFile(this);'>");
			$("#newFile").click();
		});
	});
	function moveFile(name){//이미지 파일 미리보기
		$("#file").empty();
		$("#file").append($("#newFile"));//파일 Form으로 이동
		const fileList=name.files;
		const reader=new FileReader();//파일리더 객체 생성
		reader.readAsDataURL(fileList[0]);//파일 읽기
		reader.onload=function(){
			const tempImage=new Image();//이미지 객체 생성
			tempImage.src=reader.result;//url 주입
			tempImage.onload=function(){
				const canvas=document.createElement('canvas');//리사이즈를 위해 캔버스 객체 생성
				const canvasContext=canvas.getContext("2d");
				const width=canvas.width=1000;//캔버스 크기 설정
				const height=canvas.height=400;
				canvasContext.drawImage(this, 0, 0, width, height);//캔버스에 이미지 그리기
				const dataURL=canvas.toDataURL("image/jpeg");//이미지를 url로 변환
				$("#preview").addClass("d-block");
				$("#preview").addClass("w-100");
				$("#preview").attr("src", dataURL);
				$("#preview").attr("alt", fileList[0].name);
				$("#imageInfo").text(fileList[0].name);
				$("#preview").show();
			};
		};		
	};
</script>
</head>
<body>
<div>
<header>
</header>
<section>
	<article>
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="col-sm-auto text-center">
						<div class="alert alert-secondary"><span>현재 이미지</span></div>
						<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="1000" height="400" class="d-block w-100" alt="현재 이미지">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<div class="col-sm-auto text-center">
						<br>
						<div class="alert alert-secondary"><span>수정 이미지</span></div>
						<img id="preview" src="" alt=""><br><br>
						<span id="imageInfo">이미지를 추가해주세요.<br>(1000 * 400)</span><br><br>
						<img id="addFile" class="cursor" alt="이미지추가" src="<c:url value='/resources/adminImages/paper-clip.png'/>">
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<form method="post" action="<c:url value='/requestChangeAdImage'/>" enctype="multipart/form-data">
						<div id="file" style="display: none;"></div>
						<input type="hidden" name="ad_num" value="${ad_num }">
						<input type="hidden" name="adImg_num" value="${adImg_num }">
						<input type="submit" class="btn btn-info" value="수정요청">
						<a class="btn btn-info ml-3" href="javascript:history.go(-1);">뒤로</a>
					</form>
				</div>
			</div>
		</div>
	</article>
</section>
<div id="none" style="display: none;"></div>
<!-- 결제에 필요한 값 -->
<input type="hidden" id="refundAd_num" value="${getAdInfo.ad_num }">
<input type="hidden" id="refundAd_tid" value="${getAdInfo.ad_tid }">
<input type="hidden" id="refundCancel_amount" value="${getAdInfo.ad_price }">
<input type="hidden" id="refundCancel_tax_free_amount" value="0">	
<footer>
</footer>
</div>
</body>
</html>