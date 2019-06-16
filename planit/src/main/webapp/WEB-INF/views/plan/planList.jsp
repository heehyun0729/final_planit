<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$("#showMsgPopup").click(function(e) {
		e.preventDefault();
	});
});
function ppp(mem_id){
	var popUrl = "<c:url value='/msgSendForm?id=" + mem_id + "'/>";
	var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"쪽지보내기",popOption);
}
</script>
<div id = "box">
	<div id = "planTop">
		<h2>Planit과 함께 여행을 즐겨보세요.</h2>
		<span>
			<a href = "<c:url value = '/plan/planner'/>">플래너 시작</a>
		</span>
	</div>
	<h1>다른 여행자들의 플래너</h1>
	<div id = "search">
		<form method="post" action="<c:url value = '/plan/list'/>">
			<input type = "hidden" value = "${pageNum }" name = "pageNum">
			<select name = "field">
				<option value = "country"
					<c:if test = "${field == 'country' }">selected = "selected"</c:if>
				>국가</option>
				<option value = "city"
					<c:if test = "${field == 'city' }">selected = "selected"</c:if>
				>도시</option>
				<option value = "plan_title"
					<c:if test = "${field == 'plan_title' }">selected = "selected"</c:if>
				>제목</option>
				<option value = "mem_id"
					<c:if test = "${field == 'mem_id' }">selected = "selected"</c:if>
				>작성자</option>
			</select>
			<input type = "text" name = "keyword" value = "${keyword }">
			<input type = "submit" value = "검색">
		</form>
	</div>
	<div id = "list">
		<c:if test="${empty list }">
			<div>조회된 결과가 없습니다.</div>
		</c:if>
		<c:forEach var = "vo" items="${list }">
			<div class = "userPlan">
				<div>
					<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><img src = "${vo.plan_img }"></a>
				</div>
				<div class = "planTitle">
					<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>">${vo.plan_title }</a>
				</div>
				<div class = "planId">
					<img src = "<c:url value = '${vo.img_saveImg }'/>" style = "width: 50px;height: 50px;float: left;">
					<ul>
						<li>${vo.mem_id }</li>
						<li><a href = "<c:url value = '/member/mypage/${vo.mem_id}'/>" target = "_blank">프로필 보기</a></li>
						<li><a href = "#" onclick="javascript:ppp('${vo.mem_id}')" id = "showMsgPopup">쪽지 보내기</a></li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id = "planPage">
		<c:if test="${startPage > 1 }">
			<a href = "<c:url value = '/plan/list?pageNum=${startPage - 1 }&field=${field }&keyword=${keyword }'/>"><span style = "color:skyblue;">[이전]</span></a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:choose>
				<c:when test="${i == pageNum }">
					<a href = "<c:url value = '/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style = "color:skyblue;">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href = "<c:url value = '/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style = "color:gray;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href = "<c:url value = '/plan/list?pageNum=${endPage + 1 }&field=${field }&keyword=${keyword }'/>"><span style = "color:skyblue;">[다음]</span></a>
		</c:if>
	</div>
</div>
