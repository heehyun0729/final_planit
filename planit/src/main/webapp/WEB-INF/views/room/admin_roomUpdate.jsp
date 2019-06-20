<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container" style="width: 1000px;">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-left">
					<h1>방정보수정</h1>
					<form method="post" id="form20" action="adminRoomUpdate"
						enctype="multipart/form-data">
						<input type="hidden" name="accom_num" value="${vo.accom_num }">
						숙소번호<br /> <input type="text" name="room_price"
							value="${vo.accom_num }" disabled="disabled"> <br /> <input
							type="hidden" name="room_num" value="${vo1.room_num }">
						방타입<br /> <input type="text" name="room_price"
							value="${vo1.room_type }" disabled="disabled"> <br />
						방가격<br /> <input type="text" name="room_price"
							value="${vo1.room_price}">원<br /> 숙소평<br />
						<textarea rows="5" cols="50" name="room_comm">${vo1.room_comm }</textarea>
						<br /> 방인원<br /> <input type="text" name="room_capa"
							value="${vo1.room_capa}">명<br />
							<label>수정할 이미지</label>
						<input type="file" name="file1" id="BSbtninfo">
						<a href="#" style="margin-right: 100px;"
							onclick="$('#form20').submit();"><i class="fas fa-thumbs-up"
							style="color: #339af0;">저장하기</i></a>
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



















