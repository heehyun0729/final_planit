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
</head>
<body>
	<div class="container">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-left">
					<h1>숙소등록</h1>
					<form method="post" id="form3" action="<c:url value='/admin/accommInsert' />"
						enctype="multipart/form-data">
						<input type="hidden" name="mem_id" value="${sessionScope.mem_id}"><br />
						숙소이름 <br /> <input type="text" name="accom_name"><br />
						숙소주소<br /> <input type="text" id="accom_addr" name="accom_addr"><br />
						숙소설명 <br />
						<textarea rows="5" cols="50" name="accom_comm"></textarea>
						<br /> 국가<br /> <input type="text" name="accom_country"><br />
						도시<br /> <input type="text" name="accom_city"><br /> 첨부파일<br />
						<input type="file" name="file1" class="genric-btn info circle"><br />
						<br /> <a href="#" style="margin-right: 100px;"
							onclick="$('#form3').submit();"><i class="fas fa-thumbs-up"
							style="color: #339af0;">등록하기</i></a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







