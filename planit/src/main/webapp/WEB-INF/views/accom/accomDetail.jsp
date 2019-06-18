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
</head>
<body>
	<div class="container" style="width: 1500px; margin: auto;">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-center">
				<h1> 숙소 상세 보기 </h1>
				<br/><br/>
					<table class="table">
						<tr>
							<th>숙소이름</th>
							<td>${vo.accom_name }</td>
						</tr>

						<tr>
							<th>숙소주소</th>
							<td>${vo.accom_addr }</td>
						</tr>
						<tr>
							<th>숙소설명</th>
							<td>${vo.accom_comm }</td>
						</tr>
						<tr>
							<th>숙소수정</th>
							<td><a
								href="${pageContext.request.contextPath }/accomUpdate?accom_num=${vo.accom_num}"><i
									class="fas fa-tools" style="color: #339af0;"></i></a>
						</tr>
						<tr>
							<th>숙소삭제</th>
							<td><a
								href="${pageContext.request.contextPath }/accomDelete?accom_num=${vo.accom_num}"><i
									class="fas fa-trash" style="color: #339af0;"></i></a></td>
						</tr>
						<tr>
							<th>방정보</th>
							<td><a
								href="<c:url value='/roomList?accom_num=${vo.accom_num }'/>"><i
									class="fas fa-door-open" style="color: #339af0;"></i></a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>














