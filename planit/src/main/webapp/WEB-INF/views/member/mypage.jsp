<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">마이페이지</h2>
		</div>
	</div>
</section>

<section class="mypage">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="row d-flex justify-content-start">
			<div class="col-sm-3" id="mypage">
				<input type="hidden" value="${profilemap.FOLLOW_GRADE }" id="hidden_fg"><input type="hidden" value="${sessionScope.mem_id }" id="hidden_id"> <input type="hidden" value="${profilemap.PROFILE_OPEN }" id="hidden_po">
				<div id="mypage_profile">
						<div class="mypage_profile_imagediv2">
							<span class="mypage_profile_imagspan"><img class="card-img-top rounded-circle" src="<c:url value='${profilemap.IMG_SAVEIMG }'/>" alt="${profilemap.MEM_NICKNAME }님의 프로필 사진"></span>
						</div>
						<div>
							<h1 class="card-title text-center">${profilemap.MEM_NICKNAME }</h1>
						</div>
						<div class="nZSzR">
							<c:choose>
								<c:when test="${mem_tf }"></c:when>
								<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE>0 }">
									<button class="btn btn-outline-light text-dark" id="mypage_followbtn">팔로우 됨</button>
								</c:when>
								<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE==0 }">
									<button class="btn btn-outline-light text-dark" id="mypage_followbtn">팔로우</button>
								</c:when>
							</c:choose>
						</div>
					<div class="list-group list-group-flush">
						<a href="<c:url value='/member/mypage/${mem_id }/postslist'/>" class="list-group-item list-group-item-action profileurl ${current == 'postslist' ? 'active':'' }">
							게시물<span class="badge badge-primary badge-pill" id="postcnt">${profilemap.WRITE_CNT }</span>
						</a>
						<a href="<c:url value='/member/mypage/${mem_id }/followedlist'/>" class="list-group-item list-group-item-action profileurl ${current == 'followedlist' ? 'active':'' }">
							팔로워<span class="badge badge-primary badge-pill" id="followedcnt">${profilemap.FOLLOWER }</span>
						</a>
						<a href="<c:url value='/member/mypage/${mem_id }/followlist'/>" class="list-group-item list-group-item-action ${current == 'followlist' ? 'active':'' }">
							팔로우<span class="badge badge-primary badge-pill" id="followcnt">${profilemap.FOLLOW }</span>
						</a>
						<c:if test="${mem_tf }">
							<a href="<c:url value='/user/edit/sellerapply'/>" class="list-group-item list-group-item-action">판매자 신청</a>
							<a href="<c:url value='/user/edit/editprofile'/>" class="list-group-item list-group-item-action">프로필 수정</a>
							<a href="<c:url value='/user/edit/pwdChange'/>" class="list-group-item list-group-item-action">비밀번호 수정</a>
							<a href="<c:url value='/user/edit/withdrawal'/>" class="list-group-item list-group-item-action">회원탈퇴</a>
						</c:if>
					</div>
				</div>
			</div>