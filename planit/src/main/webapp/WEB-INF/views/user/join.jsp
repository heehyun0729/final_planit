<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="joinForm">
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear">
		<fmt:formatDate value="${now}" pattern="yyyy" />
	</c:set>
	<form method="post" action="<c:url value='nomaljoin'/>" id="joinForm">
		<div class="userstop">
			<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
		</div>
		<input type="hidden" id="localurl" value="<c:url value='/'/>">
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fa fa-user-circle"></span></span>
			</div>
			<input type="text" id="mem_id" name="mem_id" value="${mem_id }" value="${vo.mem_id }" class="form-control" placeholder="아이디(5~14 사이의 소문자 영문과 숫자 조합)" required><input type="button" id="idcheck" name="idcheck" value="중복검사" disabled="disabled">
			<div id="idcheckresult" class="resultMsg"></div>
		</div>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-lock"></span></span>
			</div>
			<input type="password" id="mem_pwd" name="mem_pwd" class="form-control" placeholder="비밀번호(10~20 사이의 특수문자를 포함한 영문(대소문자 구분)과 숫자 조합)" required>
			<div id="pwdresult" class="resultMsg"></div>
		</div>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-lock"></span></span>
			</div>
			<input type="password" id="mem_pwdck" name="mem_pwdck" onpaste="return false;" class="form-control" placeholder="비밀번호 확인" required>
			<div id="pwdckresult" class="resultMsg"></div>
		</div>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fa fa-user-circle"></span></span>
			</div>
			<input type="text" id="mem_nickname" name="mem_nickname" value="${vo.mem_nickname }" class="form-control" placeholder="닉네임(3~10자리 한글,영문,숫자)" required><input type="button" id="nickcheck" name="nickcheck" value="중복검사" disabled="disabled">
			<div id="nickckresult" class="resultMsg"></div>
		</div>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="material-icons" style="font-size:20px">email</i></span>
			</div>
			<input type="text" id="mem_email" name="mem_email" class="form-control" placeholder="email@email.com (변경불가! 등록된 이메일로 인증코드가 갑니다.)" required><input type="button" id="emailcheck" name="emailcheck" value="중복검사" disabled="disabled">
			<div id="emailcheckresult" class="resultMsg"></div>
		</div>
		<div class="input-group mb-3 form-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fa fa-venus-mars"></span></span>
			</div>
			<select class="form-control" id="mem_gender" name="mem_gender">
				<option value="m">남(Male)</option>
				<option value="f">녀(Female)</option>
			</select>
			<div class="input-group-prepend">
				<span class="input-group-text"><span class="fas fa-birthday-cake"></span></span>
			</div>
			<select id="mem_birthyear" name="mem_birthyear" class="form-control">
				<c:forEach var="i" begin="0" end="${sysYear-1900 }">
					<option value="${sysYear-i }">${sysYear-i }</option>
				</c:forEach>
			</select>
		</div>
		<div class="errMsg"></div>
		<input type="submit" class="btn btn-primary btn-block" value="가입">
	</form>
</div>