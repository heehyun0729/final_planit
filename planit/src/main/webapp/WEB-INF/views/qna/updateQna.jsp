<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="detail">
<form method="post" action="<c:url value='/qna/updateQna'/>">
	<input type="hidden" name="qna_num" value=${vo.qna_num }>
	<div>
		<select name="cate" id="cate">
			<option value="여행">여행
			<option value="관광지">관광지
		</select>
	</div>
		제목<input type="text" name="title" value=${vo.qna_title }>
	<div>
	</div>
		내용<input type="text" name="content" value=${vo.qna_content }>
	<div>
	</div>
	<input type="submit" value="저장">
</form>
</div>