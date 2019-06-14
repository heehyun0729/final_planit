<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>수정하기</h1>
<form method="post" action="adminAccomUpdate" enctype="multipart/form-data">
	<input type="hidden" name="accom_num" value="${vo.accom_num }">
	숙소번호 ${vo.accom_num }<br/>
	판매자번호 ${vo.sell_num }<br/>
	숙소명 <input type="text" name="accom_name" value="${vo.accom_name }"><br/>
	숙소주소 ${vo.accom_addr }<br/>
	숙소평 <textarea rows="5" cols="50" name="accom_comm">${vo.accom_comm }</textarea><br/>
	국가 ${vo.accom_country}<br/>
	도시 ${vo.accom_city}<br/>
	파일명 ${vo.accommImg_orgImg }<br/>
	수정할파일 <input type="file" name="file1"><br/>
	<input type="submit" value="저장">
</form>








