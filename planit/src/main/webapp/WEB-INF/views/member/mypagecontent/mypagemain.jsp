<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 70%; margin: 100px auto; overflow: visible; line-height: 50px;">
	<c:choose>
		<c:when test="${profilemap.PROFILE_OPEN==1 }">
			<c:choose>
				<c:when test="${!mem_tf }">비공개 프로필입니다.</c:when>
				<c:otherwise>
					<div style="word-break:break-all; word-wrap:break-word;">${profilemap.PROFILE_COMM }</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${profilemap.PROFILE_OPEN==2 }">
			<c:choose>
				<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE==1 }">서로 팔로우 되어 있는 사람만 볼 수 있는 프로필입니다.</c:when>
				<c:otherwise>
					<div style="word-break:break-all; word-wrap:break-word;">${profilemap.PROFILE_COMM }</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${profilemap.PROFILE_OPEN==3 }">
			<c:choose>
				<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE==2 }">팔로우 해야 볼 수 있는 프로필입니다.</c:when>
				<c:otherwise>
					<div style="word-break:break-all; word-wrap:break-word;">${profilemap.PROFILE_COMM }</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div style="word-break:break-all; word-wrap:break-word;">${profilemap.PROFILE_COMM }</div>
		</c:otherwise>
	</c:choose>
</div>