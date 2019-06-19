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
					<h1>방리스트</h1>
					<table border="1">
						<tr>
							<td>번호</td>
							<td>타입</td>
							<td>이미지</td>
						</tr>
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td><a
									href="${pageContext.request.contextPath }/roomDetail?accom_num=${accom_num }&room_num=${vo.room_num}">${vo.room_type}</a></td>
								<td><c:forEach var="img" items="${vo.room_images}">
										<c:if test="${not empty img.roomImg_orgImg}">
											<img
												src="<c:url value='/resources/uploadRoom/${img.roomImg_saveImg}'/>"
												width="100" height="100" />
											<a
												href="${pageContext.request.contextPath }/roomImageDelete?accom_num=${accom_num}&roomImg_num=${img.roomImg_num }"><i
												class="fas fa-trash" style="color: #339af0;"></i></a>
										</c:if>
									</c:forEach>
									<form method="post" id="form12"
										action="<c:url value='/roomImageInsert'/>?accom_num=${accom_num}"
										enctype="multipart/form-data">
										<input type="hidden" name="room_num" value="${vo.room_num}">
										<br /> <input type="file" name="file1"
											class="genric-btn info circle"> <a href="#"
											style="margin-right: 100px;" onclick="$('#form12').submit();"><i
											class="fas fa-thumbs-up" style="color: #339af0;">등록</i></a>
									</form></td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<li class="page-item"><c:choose>
										<c:when test="${pu.startPageNum  > 5 }">
											<a
												href="${pageContext.request.contextPath }/roomList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}&accom_num=${accom_num}"
												class="page-link" aria-label="Previous"> <span
												aria-hidden="true"> <span
													class="lnr lnr-chevron-left"></span>
											</span>
											</a>
										</c:when>
									</c:choose></li>
								<c:forEach var="i" begin="${pu.startPageNum}"
									end="${pu.endPageNum }">
									<c:choose>
										<c:when test="${pu.pageNum==i }">
											<li class="page-item active"><a
												href="${pageContext.request.contextPath }/roomList?pageNum=${i}&accom_num=${param.accom_num}"
												class="page-link"> ${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item active"><a
												href="${pageContext.request.contextPath }/roomList?pageNum=${i}&accom_num=${param.accom_num}"
												class="page-link"> ${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li class="page-item"><c:choose>
										<c:when test="${pu.endPageNum < pu.totalPageCount}">
											<a
												href="${pageContext.request.contextPath }/roomList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}&accom_num=${accom_num}"
												class="page-link" aria-label="Next"> <span
												aria-hidden="true"> <span
													class="lnr lnr-chevron-right"></span>
											</span>
											</a>
										</c:when>
									</c:choose>
					</div>
					<div>
						<form method="post" id="form9"
							action="<c:url value='/roomList?accom_num=${param.accom_num}'/>">
							<select name="field" class="custom-select" style="width: 100px;">
								<option value="room_type"
									<c:if test="${field=='room_type'}">selected="selected"</c:if>>방타입</option>
							</select> <input type="text" name="keyword" value="${keyword }"> <a
								href="#" onclick="$('#form9').submit();"><i
								class="fas fa-search" style="color: #339af0;"></i></a>
						</form>
					</div>
					<br /> <a
						href="<c:url value='/roomInsert?accom_num=${param.accom_num }'/>"
						class="genric-btn info circle">방추가</a> <a
						href="<c:url value='/accommList'/>" class="genric-btn info circle">숙소리스트</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







