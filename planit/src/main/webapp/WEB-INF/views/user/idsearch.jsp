<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="userinfosearch">
	<form method="post" action="<c:url value=''/>" id="idsearch">
		<div class="userstop">
			<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
		</div>
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link active" href="<c:url value='/user/idsearch'/>">아이디 찾기</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/user/pwdsearch'/>">비밀번호 찾기</a></li>
		</ul>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="material-icons" style="font-size:20px">email</i></span>
			</div>
			<input type="text" id="mem_email" name="mem_email" class="form-control" placeholder="등록하신 이메일을 입력해 주세요" required>
		</div>
		<input type="submit" value="아이디 찾기" class="btn btn-primary btn-block">
	</form>
	<div class="errMsg">${errMsg }</div>
</div>