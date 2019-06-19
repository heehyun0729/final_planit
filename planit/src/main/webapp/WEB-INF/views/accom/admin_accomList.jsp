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
					<h1>숙소리스트</h1>
					<table class="table">
						<tr>
							<th>숙소번호</th>
							<th>판매자번호</th>
							<th>국가</th>
							<th>도시</th>
							<th>숙소이름</th>
						</tr>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.accom_num }</td>
								<td>${vo.sell_num}</td>
								<td>${vo.accom_country }</td>
								<td>${vo.accom_city }</td>
								<td><a
									href="${pageContext.request.contextPath }/admin/accomDetail?accom_num=${vo.accom_num}">${vo.accom_name }</a></td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<li class="page-item"><c:choose>
										<c:when test="${pu.startPageNum  > 5 }">
											<a
												href="${pageContext.request.contextPath }/admin/accommList?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}&sell_num=${sell_num}"
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
												href="${pageContext.request.contextPath }/admin/accommList?pageNum=${i}&sell_num=${sell_num}"
												class="page-link"> ${i}</a></li>

										</c:when>
										<c:otherwise>
											<li class="page-item "><a
												href="${pageContext.request.contextPath }/admin/accommList?pageNum=${i}&sell_num=${sell_num}"
												class="page-link"> ${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li class="page-item"><c:choose>
										<c:when test="${pu.endPageNum < pu.totalPageCount}">
											<a
												href="${pageContext.request.contextPath }/admin/accommList?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}&sell_num=${sell_num}"
												class="page-link" aria-label="Next"> <span
												aria-hidden="true"> <span
													class="lnr lnr-chevron-right"></span>
											</span>
											</a>
										</c:when>
									</c:choose></li>
							</ul>
						</nav>
					</div>
					<div>
						<form method="post" id="form4"
							action="<c:url value='/admin/accommList'/>">
							<select name="field">
								<option value="sell_num"
									<c:if test="${field=='sell_num'}">selected="selected"</c:if>>판매자번호</option>
								<option value="accom_country"
									<c:if test="${field=='accom_country'}">selected="selected"</c:if>>국가</option>
								<option value="accom_city"
									<c:if test="${field=='accom_city'}">selected="selected"</c:if>>도시</option>
							</select> <input type="text" name="keyword" value="${keyword }"> <a
								href="#" style="margin-right: 100px;"
								onclick="$('#form4').submit();"><i class="fas fa-search"
								style="color: #339af0;"></i></a>
						</form>
					</div>
					<br/><br/>
					<a href="${pageContext.request.contextPath }/adminHome"
						class="genric-btn info circle">관리자페이지</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>