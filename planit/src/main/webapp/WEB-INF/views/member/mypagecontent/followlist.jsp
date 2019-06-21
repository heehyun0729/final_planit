<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>
	<small>총 ${profilemap.FOLLOW }명</small>
</h2>
<ul class="list-group list-group-flush">
	<c:forEach var="contentmap" items="${contentmap }">
		<li class="list-group-item list-group-item-action">
			<span>
				<a href="<c:url value='/member/mypage/${contentmap.MEM_ID }'/>">
					<img style="width: 200px;height: 200px;border: 1px solid gray;" class="rounded-circle" src="<c:url value='${contentmap.IMG_SAVEIMG }'/>" alt="${contentmap.MEM_NICKNAME }님의 프로필 사진">
				</a>
			</span> 
			<span style="font-size: 40px; font-weight: bold; margin-left: 50px;">
				<a href="<c:url value='/member/mypage/${contentmap.MEM_ID }'/>">${contentmap.MEM_NICKNAME }</a>
			</span>
		</li>
	</c:forEach>
</ul>
