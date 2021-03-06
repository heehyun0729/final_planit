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
	<div class="container" style="width: 1500px; margin: auto;">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-center">
					<h1>관리자 등록양식</h1>
					<ul>
						<li><a style="color: #339af0;"
							href="${pageContext.request.contextPath}/admin/accommInsert">숙소추가</a></li>
						<li><a style="color: #339af0;"
							href="${pageContext.request.contextPath}/admin/accommList">방추가</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>