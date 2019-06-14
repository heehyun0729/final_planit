<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>
	동행 추천
</h1>
<table>
	<tr>
		<th>아이디</th><th>시작날짜</th><th>끝날짜</th><th>희망성별</th><th>희망나이</th><th>도시</th><th>쪽지하기</th><th>동행요청</th>
	</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<th>${list.mem_id }</th>
			<th>${list.buddy_indate }</th>
			<th>${list.buddy_outdate }</th>
			<c:choose>
				<c:when test="${list.buddy_gender =='X'}">
					<th>상관없음</th>
				</c:when>
				<c:when test="${list.buddy_gender =='M'}">
					<th>남자</th>
				</c:when>
				<c:when test="${list.buddy_gender =='W'}">
					<th>여자</th>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${list.buddy_birthyear==0 }">
					<th>상관없음</th>
				</c:when>
				<c:otherwise>
					<th>${list.buddy_birthyear }대</th>
				</c:otherwise>
			</c:choose>
			<th>${list.buddy_city }</th>
			<th><a href="<c:url value='/msgSendPopupForm?id=${list.mem_id }'/>">쪽지하기</a></th>
			<td><input type="button" value="동행요청하기" onclick="apply_buddy('${list.buddy_num}')"></td>
		</tr>
	</c:forEach>
</table>
<script type="text/javascript">
//동행요청
function apply_buddy(buddy_num){
	var result = confirm('동행을 요청하시겠습니까?');
	if(result) {
		alert("신청되었습니다.");
		window.location.href="<c:url value='/buddyApplyBuddy_pop?buddy_num="+buddy_num+"' />";
	}else{
		
	}
}
</script>