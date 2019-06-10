<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"	crossorigin="anonymous"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<title>PlanIt::관리자::</title>
		<style type="text/css">
			.bd-placeholder-img {
				font-size: 1.125rem;
				text-anchor: middle;
				-webkit-user-select: none;
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
			}
			@media (min-width: 768px) {
				.bd-placeholder-img-lg {
					font-size: 3.5rem;
				}
			}
			html,
			body {
			  height: 100%;
			}
			body {
			  display: -ms-flexbox;
			  display: flex;
			  -ms-flex-align: center;
			  align-items: center;
			  padding-top: 40px;
			  padding-bottom: 40px;
			  background-color: #f5f5f5;
			}
			.form-signin {
			  width: 100%;
			  max-width: 420px;
			  padding: 15px;
			  margin: auto;
			}
			.form-label-group {
			  position: relative;
			  margin-bottom: 1rem;
			}
			.form-label-group > input,
			.form-label-group > label {
			  height: 3.125rem;
			  padding: .75rem;
			}
			.form-label-group > label {
			  position: absolute;
			  top: 0;
			  left: 0;
			  display: block;
			  width: 100%;
			  margin-bottom: 0; /* Override default `<label>` margin */
			  line-height: 1.5;
			  color: #495057;
			  pointer-events: none;
			  cursor: text; /* Match the input under the label */
			  border: 1px solid transparent;
			  border-radius: .25rem;
			  transition: all .1s ease-in-out;
			}
			.form-label-group input::-webkit-input-placeholder {
			  color: transparent;
			}
			.form-label-group input:-ms-input-placeholder {
			  color: transparent;
			}
			.form-label-group input::-ms-input-placeholder {
			  color: transparent;
			}
			.form-label-group input::-moz-placeholder {
			  color: transparent;
			}
			.form-label-group input::placeholder {
			  color: transparent;
			}
			.form-label-group input:not(:placeholder-shown) {
			  padding-top: 1.25rem;
			  padding-bottom: .25rem;
			}
			.form-label-group input:not(:placeholder-shown) ~ label {
			  padding-top: .25rem;
			  padding-bottom: .25rem;
			  font-size: 12px;
			  color: #777;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function () {
				
			});
		</script>		
	</head>
	<body>
		<form method="post" action="<c:url value='/adminLogin'/>" class="form-signin">
			<div class="text-center mb-4">			
				<img class="mb-4" src="<c:url value='/resources/adminImages/logo.svg'/>" alt="" width="72" height="72">
				<h1 class="h3 mb-3 font-weight-normal">PlanIt Admin</h1>
				<p>회원쪽 정리되는대로 업데이트 예정.</p>
				<p><code>아무거나 입력 후 로그인 누르면 이동됩니다.</code></p>
			</div>
	
			<div class="form-label-group">
				<input type="text" id="inputEmail" class="form-control" placeholder="아이디" required="" autofocus="">
				<label for="inputId">아이디</label>
			</div>
	
			<div class="form-label-group">
				<input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required="">
				<label for="inputPassword">비밀번호</label>
			</div>
			<br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted text-center"></p>
		</form>
	</body>
</html>