<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Planit 회원가입</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/members/MemberScript.js'/>"></script>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear">
		<fmt:formatDate value="${now}" pattern="yyyy" />
	</c:set>
	<h1>회원가입</h1>
	<form method="post" action="<c:url value='/join'/>">
		<label for="mem_id">아이디</label> <input type="text" id="mem_id" name="mem_id"><input type="button" id="idcheck" name="idcheck" value="중복검사"> <span id="idcheckresult"></span>
		<br>
		<label for="mem_pwd">비밀번호</label> <input type="password" id="mem_pwd" name="mem_pwd"><span id="pwdresult"></span>
		<br>
		<label for="mem_pwdck">비밀번호 확인</label> <input type="password" id="mem_pwdck" name="mem_pwdck"><span id="pwdckresult"></span>
		<br>
		<label for="mem_nickname">닉네임</label> <input type="text" id="mem_nickname" name="mem_nickname"><input type="button" id="nickcheck" name="nickcheck" value="중복검사"><span id="nickckresult"></span>
		<br>
		<label for="mem_email">이메일</label> <input type="email" id="mem_email" name="mem_email">
		<br>
		<label for="mem_gender">성별</label><select id="mem_gender" name="mem_gender">
			<option value="m">남(man)</option>
			<option value="w">녀(woman)</option>
		</select>
		<br>
		<label for="mem_birthyear">생일</label><input type="number" id="mem_birthyear" name="mem_birthyear" value="${sysYear}">
		<!-- onclick,onchange로 해보기 -->
		<br>
		<input type="submit" value="가입">
	</form>
</body>
</html>