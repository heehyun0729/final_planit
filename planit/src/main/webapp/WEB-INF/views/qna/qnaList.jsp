<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="qna">
	<div id="list">
		<h1>자유문의게시판</h1>
		<table border="1" width="500">
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach item="vo" items="${list }">
				<tr>
					<td>${vo.qna_num }</td>
					<td>${vo.qna_cate }</td>
					<td><a href='<c:url value='/qna/qnaDetails?qna_num=${vo.qna_num }'/>'>${vo.qna_title }</a></td>
					<td>${vo.mem_id }</td>
					<td>${vo.qna_date }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>