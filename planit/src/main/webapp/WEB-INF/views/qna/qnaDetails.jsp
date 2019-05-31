<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="detail">
	<table border="1">
		<tr>
			<td>글번호</td><td>${vo.qna_num }</td>
		</tr>
		<tr>
			<td>작성자</td><td>${vo.mem_id }</td>
		</tr>
		<tr>
			<td>카테고리</td><td>${vo.qna_cate }</td>
		</tr>
		<tr>
			<td>제목</td><td>${vo.qna_title }</td>
		</tr>
		<tr>
			<td>내용</td><td><textarea cols="50" rows="8">${vo.qna_content }</textarea></td>
		</tr>
		<tr>
		
			<td>작성일자</td><td>${vo.qna_date }</td>
		</tr>
	</table>
</div>
