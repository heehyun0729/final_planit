<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="position: absolute;">
	<header style="border: 1px solid black; margin: 2px; ">
		<h1>관리자페이지</h1>
	</header>
	<aside style="float: left;  text-align: left;  border: 1px solid black; margin: 2px; ">
		메인페이지
		<ul>관리
			<li>회원 관리</li>
			<li>게시판 관리</li>
			<li><a href="<c:url value='/admin/adminAdManagement/approvedAdList'/>">광고 관리</a></li>
			<li><a href="<c:url value='/adminAdRequestInfo'/>">광고 신청</a></li>
		</ul>
		<ul>
			<li>매출 분석</li>
		</ul>
	</aside>
	<section style="float: left;" >
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; ">
			<strong>새로운 쪽지</strong><br>
			<span>0</span>
		</article>
		<article style="float: left; text-align: center; border: 1px solid black; margin: 2px;">
			<strong>광고 신청</strong><br>
			<span>0</span>
		</article>
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; ">
			<strong>신고 게시물</strong><br>
			<span>0</span>
		</article>
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; ">
			<strong>금일 광고 수주율</strong><br>
			<span>0&percnt;</span>
		</article>
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; ">
			<strong>현재 접속자</strong><br>
			<span>0</span>
		</article>
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; ">
			<strong>금일 신규 가입자</strong><br>
			<span>0</span>
		</article>
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; ">
			<strong>금일 접속자</strong><br>
			<span>0</span>
		</article>
		<div style="clear: both;"></div>
		<article style="float: left;  text-align: center;  border: 1px solid black; margin: 2px; width: 100%; height: 500px;">
			<strong>신규 게시글</strong><br>
			<span>0</span>
		</article>
	</section>
</div>