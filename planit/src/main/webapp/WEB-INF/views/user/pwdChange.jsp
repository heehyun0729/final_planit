<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pwdchangeForm">
	<form method="post" action="<c:url value='/user/pwdchange'/>" id="changePwd">
		<div class="userstop">
			<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
		</div>
		<input type="hidden" id="localurl" value="<c:url value='/'/>">
		<input type="hidden" name="forgot" value="${forgot }">
		<input type="hidden" name="mem_id" value="${mem_id }">
		<c:if test="${!forgot }">
			<div class="input-group mb-4 form-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><span class="fas fa-lock"></span></span>
				</div>
				<input type="password" id="before_mem_pwd" name="before_mem_pwd" class="form-control" placeholder="현재 비밀번호" required>
				<div class="resultMsg"></div>
			</div>
		</c:if>
		<div class="input-group mb-4 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-lock"></span></span>
			</div>
			<input type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="변경할 비밀번호(10~20 사이의 특수문자를 포함한 영문(대소문자 구분)과 숫자 조합)" required>
			<div id="pwdresult" class="resultMsg"></div>
		</div>
		<div class="input-group mb-4 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-lock"></span></span>
			</div>
			<input type="password" id="mem_pwdck" name="mem_pwdck" onpaste="return false;" class="form-control" placeholder="변경할 비밀번호 확인" required>
			<div id="pwdckresult" class="resultMsg"></div>
		</div>
		<input type="submit" class="btn btn-primary btn-block" value="비밀번호 변경">
	<div class="errMsg">${errMsg }</div>
	</form>
</div>