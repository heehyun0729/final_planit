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
		
	});
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
						<img src="<c:url value='/resources/adImage/${vo.adImg_changeSaveImg }'/>" width="1000" height="400" class="d-block w-100" alt="수정 이미지">
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<a class="btn btn-info" href="<c:url value='/admin/adminAdManagement/requestChangeAdImageApprove?adImg_num=${vo.adImg_num }'/>">승인</a>
					<a class="btn btn-info ml-3" href="<c:url value='/admin/adminAdManagement/requestChangeAdImageDecline?adImg_num=${vo.adImg_num }'/>">반려</a>
				</div>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>
</body>
</html>