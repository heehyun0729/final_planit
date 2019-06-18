<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
<section>
	<article>
		<div class="container">
			<div class="row">
				<div class="col mt-5 text-center">
			<h1>여행문의</h1>
			<form method="post" action="<c:url value = ''/>" id = "qnaDelete">
			<div style ="float:left;">
				<input type="button" onclick="#" value="삭제" class = "btn btn-primary">
			</div>
			<table class="table table-hover">
				<thead>
				<tr>
					<th scope="col"><input type = "checkbox" id= qnaChakAll></th>
					<th scope="col">글번호</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">상세보기</th>
					<th scope="col">답변여부</th>
				</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td scope="row" colspan="7">조회된 결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var = "vo" items = "${list }">
						<tr>
							<td><input type = "checkbox" class = "qnaChk" value = "${vo.qna_num }" name = "qna_num"></td>
							
							<td>${vo.qna_num }</td>
							<td>${vo.mem_id }</td>
							<td>${vo.qna_title}</td>
							<td>
								<c:choose>
									<c:when test="${vo.qna_stat == 0}">
										미답변
									</c:when>
									<c:otherwise>
										답변완료
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<input type="button" class="btn btn-primary" value = "상세보기" onclick="javascript:openPlanDetailModal(${vo.qna_num})">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table></form>
				</div>
			</div>
		</div>
	</article>
</section>
</div>
