<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/royal/css/responsive.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
<style type="text/css">
.btn-info {
	color: #fff;
	background-color: #339af0;
	border-color: #17a2b8;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-left">
					<h1>방정보등록</h1>

					<form method="post" id="form10"
						action="<c:url value='/admin/roomInsert'/>"
						enctype="multipart/form-data">
						<input type="hidden" name="accom_num" value="${param.accom_num}"><br />
						방타입<br /> <input type="text" name="room_type"><br /> 가격<br />
						<input type="text" name="room_price">원<br /> 방설명<br />
						<textarea rows="5" cols="50" name="room_comm"></textarea>
						<br /> 방인원<br /> <input type="text" name="room_capa">명<br />
						<label>방이미지</label>
						<input type="file" name="file1" id="BSbtninfo"><a
							href="#" style="margin-right: 100px;"
							onclick="$('#form10').submit();"><i class="fas fa-thumbs-up"
							style="color: #339af0;">등록하기</i></a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#BSbtninfo').filestyle({
			buttonName : 'btn-info',
			buttonText : 'File selection'
		});
	</script>
</body>
</html>







