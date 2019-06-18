<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />
			<c:if test="${mem_tf }">
				<ul class="nav nav-pills nav-justified">
					<li class="nav-item">
						<a class="nav-link ${current == 'a' ? 'active':'' }" href="<c:url value='/member/mypage/${mem_id }/plan/list'/>">플래너</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${current == 'a' ? 'active':'' }" href="<c:url value='/member/mypage/${mem_id }/postslist'/>">글목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${current == 'a' ? 'active':'' }" href="<c:url value='/member/mypage/${mem_id }/comments'/>">댓글 모음</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${current == 'a' ? 'active':'' }" href="<c:url value='/member/mypage/${mem_id }/reservation/list'/>">예약목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${current == 'myAdList' ? 'active':'' }" href="<c:url value='/member/mypage/ad/${mem_id }/myAdList'/>">광고목록</a>
					</li>
				</ul>
			</c:if>