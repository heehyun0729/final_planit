<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
</section>
<section class="user_result_area" style="width: 100%; font-size: 25px; font-weight: bold; text-align:center;">
	<div id="userResult" class="row" style="width: 100%; margin: 50px auto;">
		<c:choose>
			<c:when test="${empty authMsg }">
			요청이 만료되었습니다.
		</c:when>
			<c:otherwise>
				${authMsg }
			</c:otherwise>
		</c:choose>
	</div>
</section>