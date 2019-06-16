<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
<div id="table">
<c:forEach var="contentmap" items="${contentmap }">
<div class="row">
<span class="cell col1"><a href="<c:url value='/member/mypage/${contentmap.MEM_ID }'/>"><img src="<c:url value='${contentmap.IMG_SAVEIMG }'/>" alt="${contentmap.MEM_NICKNAME }님의 프로필 사진"></a></span>
<span class="cell col2"><a href="<c:url value='/member/mypage/${contentmap.MEM_ID }'/>">${contentmap.MEM_NICKNAME }</a></span>
</div>
</c:forEach>
</div>
팔로우리스트
</div>