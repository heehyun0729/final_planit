<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="withdrawalForm">
	<form method="post" action="<c:url value='/user/withdrawal'/>" id="withdrawal">
		<div class="userstop">
			<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
		</div>
		<h1 style="text-align: center">회원탈퇴</h1>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-lock"></span></span>
			</div>
			<input type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="비밀번호" required>
		</div>
		<input type="submit" class="btn btn-primary btn-block" value="비밀번호 확인">
		<div class="errMsg">${errMsg }</div>
	</form>
</div>