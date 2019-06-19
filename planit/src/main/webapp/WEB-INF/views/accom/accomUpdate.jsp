<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/royal/css/style.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/royal/css/responsive.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/royal/vendors/nice-select/css/nice-select.css'/>">
</head>
<body>
	<div class="container">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-left">
					<h1>숙소수정</h1>
					<form method="post" id="form5" action="accomUpdate"
						enctype="multipart/form-data">
						<input type="hidden" name="accom_num" value="${vo.accom_num }">
						숙소번호<br /> <input type="text" name="accom_num"
							value="${vo.accom_num }" disabled="disabled"><br /> 
						판매자번호<br />
						<input type="text" name="sell_num" value="${vo.sell_num }"
							disabled="disabled"><br /> 
						숙소명<br /> <input type="text"
							name="accom_name" value="${vo.accom_name }"><br /> 
						숙소주소<br />
						<textarea rows="1" cols="50" name="accom_addr" disabled="disabled">${vo.accom_addr }</textarea>
						<br /> 
						숙소평<br />
						<textarea rows="5" cols="50" name="accom_comm">${vo.accom_comm }</textarea>
						<br /> 
						국가<br /> <input type="text" name="accom_country"
							value="${vo.accom_country }" disabled="disabled"><br />
						도시<br /> <input type="text" name="accom_city"
							value="${vo.accom_city }" disabled="disabled"><br /> 
						파일명<br />
						<input type="text" name="accom_city"
							value="${vo.accommImg_orgImg }" disabled="disabled"><br />
						수정할파일<br /> <input type="file" name="file1" class="genric-btn info circle"><br />
						<br /> 
						<a href="#" style="margin-right: 100px;"
							onclick="$('#form5').submit();"><i class="fas fa-thumbs-up"
							style="color: #339af0;">저장하기</i></a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>








