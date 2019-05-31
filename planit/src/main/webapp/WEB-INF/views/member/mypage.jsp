<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="mypage">
	<div id="mypage_profile">
		<div class="mypage_profile_imagediv1">
			<div class="mypage_profile_imagediv2">
				<span class="mypage_profile_imagspan"><img class="_6q-tv" src="<c:url value='${img_saveImg }'/>" alt="${mem_nickname }님의 프로필 사진"></span>
			</div>
		</div>
		<section class="zwlfE">
			<div class="nZSzR">
				<h1 class="mypage_profile_nickname">${mem_nickname }</h1>
				<a class="mypage_follow" rel="nofollow" href="#"><button class="mypage_followbtn" type="button">팔로우</button></a>
			</div>
			<ul class="mypage">
				<li class="Y8-fY "><a class="-nal3 " href="#">게시물<span class="g47SY ">0</span></a></li>
				<li class="Y8-fY "><a class="-nal3 " href="#">팔로워<span class="g47SY " title="600,542">0</span></a></li>
				<li class="Y8-fY "><a class="-nal3 " href="#">팔로우<span class="g47SY ">0</span></a></li>
			</ul>
			<div class="-vDIg">
				<span>소개글</span>
			</div>
		</section>
	</div>
	<div id="mypage_menu">
		<ul>
			<li><a href="<c:url value='/member/mypage/${mem_id }/travel'/>">다녀온 여행지</a></li>
			<li><a href="<c:url value='/member/mypage/${mem_id }/review'/>">후기글</a></li>
			<li><a href="<c:url value='/member/mypage/${mem_id }/qna'/>">질문글</a></li>
			<li><a href="<c:url value='/member/mypage/${mem_id }/comments'/>">댓글 모음</a></li>
			<li><a href="<c:url value='/member/mypage/${mem_id }/book'/>">예약목록</a></li>
			<li><a href="<c:url value="/msgReceiveList?memId=${mem_id }&msgType=RECEIVE"/>">쪽지함</a></li>
			<li><a href="<c:url value='/member/mypage/${mem_id }/user'/>">회원정보수정</a></li>
		</ul>
	</div>
	<div id="mypage_content">
		${content }
		${content }
	</div>
</div>
<script type="text/javascript" src="<c:url value='/resources/js/members/mypageScript.js'/>"></script>