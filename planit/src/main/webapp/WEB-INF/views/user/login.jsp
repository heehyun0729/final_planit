<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="login-form">
		<form method="post" action="<c:url value='/user/login'/>" id="formLogin">
			<input type = "hidden" value = "${referer }" name = "referer">
			<div class="userstop">
				<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
			</div>
			<div class="input-group mb-3 form-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><span class="fa fa-user-circle"></span>
					</span>
				</div>
				<input type="text" id="mem_id" name="mem_id" value="${mem_id }" class="form-control" placeholder="아이디(ID)" required>
			</div>
			<div class="input-group mb-3 form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <span class="fas fa-lock"></span>
					</span>
				</div>
				<input type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="비밀번호(PASSWORD)" required>
			</div>
			<div class="errMsg">${errMsg }</div>
			<input type="submit" class="btn btn-primary login-btn btn-block" value="로그인">
			<div id="loginbottom">
				<a href="<c:url value='/user/join'/>">회원가입</a> | <a href="<c:url value='/user/idsearch'/>">아이디</a>/<a href="<c:url value='/user/pwdsearch'/>">비밀번호</a> 찾기
			</div>
		</form>
	</div>