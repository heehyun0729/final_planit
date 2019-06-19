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
	<div class="container" style="width: 1000px;">
		<div class="row ">
			<div class="col mt-5 d-flex justify-content-center">
				<div class="text-left">
					<h1>방 상세</h1>
					<table class="table">
						<tr>
							<td>타입</td>
							<td>${vo.room_type}</td>
						</tr>
						<tr>
							<td>가격</td>
							<td>${vo.room_price}원</td>
						</tr>
						<tr>
							<td>설명</td>
							<td>${vo.room_comm}</td>
						</tr>
						<tr>
							<td>방이미지</td>
							<td>
						<c:forEach var="vo1" items="${vo1}">	
						<img src="<c:url value='/resources/uploadRoom/${vo1.roomImg_saveImg}'/>" width="100" height="100" />
						</c:forEach>
						</td>
						</tr>
						<tr>
							<td>방인원</td>
							<td>${vo.room_capa}명</td>
						</tr>
						<tr>
							<th>방수정</th>
							<td><a href="${pageContext.request.contextPath }/roomUpdate?accom_num=${accom_num}&room_num=${vo.room_num }"><i
									class="fas fa-tools" style="color: #339af0;"></i></a>
						</tr>
						<tr>
							<th>방삭제</th>
							<td><a href="${pageContext.request.contextPath }/roomDelete?accom_num=${accom_num}&room_num=${vo.room_num }"><i
									class="fas fa-trash" style="color: #339af0;"></i></a></td>
						</tr>
					</table>
					<a href="<c:url value='/roomList?accom_num=${vo.accom_num }'/>"class="genric-btn info circle">방정보</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







