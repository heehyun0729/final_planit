<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>파일올리기</h1>
<form method="post" action="<c:url value='/accommInsert' />" enctype="multipart/form-data">
	<input type="hidden" name="mem_id" value="${sessionScope.mem_id}"><br/>
	숙소이름 <input type="text" name="accom_name"><br/>
	숙소주소 <input type="text" name="accom_addr"><br/>
	숙소설명 <textarea rows="5" cols="50" name="accom_comm"></textarea><br/>
	국가 <input type="text" name="accom_country"><br/>
	도시 <input type="text" name="accom_city"><br/>
	첨부파일 <input type="file" name="file1"><br/>
	<input type="submit" value="등록">
</form>
</body>
</html>








