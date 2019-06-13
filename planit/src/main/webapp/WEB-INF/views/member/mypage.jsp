<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="mypage">
	<input type="hidden" value="${profilemap.FOLLOW_GRADE }" id="hidden_fg"> <input type="hidden" value="${sessionScope.mem_id }" id="hidden_id">
	<div id="mypage_profile">
		<div class="mypage_profile_imagediv1">
			<div class="mypage_profile_imagediv2">
				<span class="mypage_profile_imagspan"><img class="_6q-tv" src="<c:url value='${profilemap.IMG_SAVEIMG }'/>" alt="${profilemap.MEM_NICKNAME }님의 프로필 사진"></span>
			</div>
		</div>
		<section class="zwlfE">
			<div class="nZSzR">
				<h1 class="mypage_profile_nickname">${profilemap.MEM_NICKNAME }</h1>
				<button id="mypage_followbtn" <c:choose>
					<c:when test="${mem_tf }">disabled="disabled">환영합니다.</c:when>
					<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE>0 }">>팔로우 됨</c:when>
					<c:otherwise>>팔로우</c:otherwise>
				</c:choose></button>
			</div>
			<ul class="mypage">
				<li class="Y8-fY "><a class="-nal3 " href="<c:url value='/member/mypage/${mem_id }/postslist'/>">게시물<span id="postcnt">?</span></a></li>
				<li class="Y8-fY "><a class="-nal3 " href="<c:url value='/member/mypage/${mem_id }/followedlist'/>">팔로워<span id="followedcnt">${profilemap.FOLLOWER }</span></a></li>
				<li class="Y8-fY "><a class="-nal3 " href="<c:url value='/member/mypage/${mem_id }/followlist'/>">팔로우<span id="followcnt">${profilemap.FOLLOW }</span></a></li>
				<c:if test="${mem_tf }">
					<li><a href="<c:url value="/msgReceiveList?memId=${mem_id }&msgType=RECEIVE"/>">쪽지함</a></li>
					<li><a href="<c:url value='/user/edit/sellerapply'/>">판매자 신청</a></li>
					<li><a href="<c:url value='/user/edit/editprofile'/>">프로필 수정</a></li>
					<li><a href="<c:url value='/user/edit/pwdChange'/>">비밀번호 수정</a></li>
					<li><a href="<c:url value='/user/edit/withdrawal'/>">회원탈퇴</a></li>
				</c:if>
			</ul>
			<div class="-vDIg">
				<pre>${profilemap.PROFILE_COMM }</pre>
			</div>
		</section>
	</div>
	<c:if test="${mem_tf }">
		<div id="mypage_menu">
			<ul>
				<li><a href="<c:url value='/member/mypage/${mem_id }/travel'/>">다녀온 여행지</a></li>
				<li><a href="<c:url value='/member/mypage/${mem_id }/postslist'/>">글목록</a></li>
				<li><a href="<c:url value='/member/mypage/${mem_id }/comments'/>">댓글 모음</a></li>
				<li><a href="<c:url value='/member/mypage/${mem_id }/reservation/list'/>">예약목록</a></li>
				<li><a href="<c:url value='/member/mypage/ad/${mem_id }/myAdList'/>">광고목록</a></li>
			</ul>
		</div>
	</c:if>
	<div id="mypage_content">${content }</div>
</div>
<script type="text/javascript" src="<c:url value='/resources/js/members/mypageScript.js'/>"></script>
