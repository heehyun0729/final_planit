<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id = "box">
	<h1>header</h1>
	<ul>
		<li><a href = "<c:url value='/'/>">홈</a></li>
		<li><a href = "<c:url value='/plan/list'/>">플래너</a></li>
		<li><a href = "<c:url value='/buddyList'/>">동행찾기</a></li>
		<li><a href = "<c:url value='/adminHome'/>">관리자페이지</a></li>
		<li><a href = "<c:url value='/qnaList'/>">여행문의</a></li>
		<li><a href = "<c:url value='/acommQna'/>">숙소문의</a></li>
		
	</ul>
	<ul>
		<c:choose>
			<c:when test="${sessionScope.mem_id!=null }">
				<li><a href="<c:url value="/member/mypage/${sessionScope.mem_id}"/>">마이페이지</a></li>
				<li><a href="<c:url value="/msgReceiveList?memId=${mem_id }&msgType=RECEIVE"/>"><img style="width:20px"src='<c:url value='/resources/msgImage/message.png'/>'/><span id = "mul"></span></a></li>
				<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
				
				<script>
				var xhr = null;
				//var cnum=setInterval(countList);
				function countList() {
					xhrList = new XMLHttpRequest();
					xhrList.onreadystatechange = countListOk;
					xhrList.open('get', '${pageContext.request.contextPath }/mem/readCheck?memId=${sessionScope.mem_id}', true);
					xhrList.send();
				}
				function countListOk() {
					if(xhrList.readyState == 4 && xhrList.status == 200){
						var data = xhrList.responseXML;
						var mul = document.getElementById("mul");
						var result=data.getElementsByTagName("result")[0];
						var comm = result.getElementsByTagName("comm")[0];
						var c = comm.getElementsByTagName("c")[0].firstChild.nodeValue;
					    mul.innerHTML=  c;
					}
				}
				</script>
			</c:when>
			<c:otherwise>
				<li><a href="<c:url value='/login'/>">로그인</a></li>
				<li><a href="<c:url value='/join'/>">회원가입</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>