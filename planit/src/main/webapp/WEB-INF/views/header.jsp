<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header_area">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <h1><a class="navbar-brand logo_h" href="<c:url value='/'/>">Plan it!</a></h1>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                <ul class="nav navbar-nav menu_nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/'/>">홈</a></li> 
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/plan/list'/>">계획짜기</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/buddyList'/>">동행찾기</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/reservation/accomList'/>">숙소예약</a></li>
                    <li class="nav-item submenu dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티 <i class="fas fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li class="nav-item"><a class="nav-link" href="<c:url value='/review/reviewList'/>">여행후기</a></li>
                            <li class="nav-item"><a class="nav-link" href="<c:url value='/qnaList'/>">여행문의</a></li>
                        </ul>
                    </li> 
                    <li class="nav-item"><a class="nav-link disable" href="elements.html">&nbsp;</a></li>
                    <c:choose>
						<c:when test="${sessionScope.mem_id!=null }">
							<li class="nav-item"><a href="<c:url value="/msgReceiveList?memId=${mem_id }&msgType=RECEIVE"/>" class="nav-link" title = "쪽지"><i class="far fa-envelope"></i><span id="messageBadge" class="badge badge-pill badge-primary ml-2"></span></a></li>
							<li class="nav-item"><a href="<c:url value="/member/mypage/${sessionScope.mem_id}"/>" class="nav-link" title = "마이페이지"><i class="fas fa-user-circle"></i></a></li>
							<li class="nav-item"><a href="<c:url value='/user/logout'/>" class="nav-link" title = "로그아웃"><i class="fas fa-sign-out-alt"></i></a></li>
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
									var messageBadge = document.getElementById("messageBadge");
									var result=data.getElementsByTagName("result")[0];
									var comm = result.getElementsByTagName("comm")[0];
									var c = comm.getElementsByTagName("c")[0].firstChild.nodeValue;
									if(c!=0){
										messageBadge.innerHTML=  c;
								    }
								}
							}
							</script>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a href="<c:url value='/user/login'/>" class="nav-link" title = "로그인"><i class="fas fa-sign-in-alt"></i></a></li>
							<li class="nav-item"><a href="<c:url value='/user/join'/>" class="nav-link" title = "회원가입"><i class="fas fa-user-plus"></i></a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div> 
        </nav>
    </div>
</header>