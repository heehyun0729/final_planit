<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="login-form">
		<form method="post" action="<c:url value='/user/login'/>" id="formLogin">
			<div id="logintop">
				<a href="<c:url value='/'/>"><img id="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
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
			<!-- <label for="mem_id">ID</label><input type="text" id="mem_id" name="mem_id" value="${mem_id }"><br> 
			<label for="mem_pwd">PW</label><input type="password" id="mem_pwd" name="mem_pwd"><br>
			<div id="errMsg">${errMsg }</div>
			<input type="submit" value="로그인">-->
		</form>
	</div>

<%--<div class="login-form">
    <form action="/examples/actions/confirmation.php" method="post">
        <h2 class="text-center">Sign in</h2>   
        <div class="form-group">
        	<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="username" placeholder="Username" required="required">				
            </div>
        </div>
		<div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="password" placeholder="Password" required="required">				
            </div>
        </div>        
        <div class="form-group">
            <button type="submit" class="btn btn-primary login-btn btn-block">Sign in</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="#" class="pull-right">Forgot Password?</a>
        </div>
		<div class="or-seperator"><i>or</i></div>
        <p class="text-center">Login with your social media account</p>
        <div class="text-center social-btn">
            <a href="#" class="btn btn-primary"><i class="fa fa-facebook"></i>&nbsp; Facebook</a>
            <a href="#" class="btn btn-info"><i class="fa fa-twitter"></i>&nbsp; Twitter</a>
			<a href="#" class="btn btn-danger"><i class="fa fa-google"></i>&nbsp; Google</a>
        </div>
    </form>
    <p class="text-center text-muted small">Don't have an account? <a href="#">Sign up here!</a></p>
</div>--%>