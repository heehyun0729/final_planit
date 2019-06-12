<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>등록된 내 동행</h2>
<table id="buddyTable" style="width: 80%">
	<tr>
		<th>글번호</th>
		<th>여행자</th>
		<th>여행날짜</th>
		<th>희망성별</th>
		<th>희망나이</th>
		<th>여행 소개</th>
		<th>여행할 도시</th>
		<th>삭제하기</th>
	</tr>
	<c:forEach var="buddy" items="${buddyList}">	
		<tr>
			<td>${buddy.buddy_num}</td>
			<td>${buddy.mem_id }</td>
			<td>${buddy.buddy_indate } ~ ${buddy.buddy_outdate }</td>
			<c:choose>
				<c:when test="${buddy.buddy_gender =='X'}">
					<td>상관없음</td>
				</c:when>
				<c:when test="${buddy.buddy_gender =='M'}">
					<td>남자</td>
				</c:when>
				<c:when test="${buddy.buddy_gender =='W'}">
					<td>여자</td>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${buddy.buddy_birthyear==0 }">
					<td>상관없음</td>
				</c:when>
				<c:otherwise>
					<td>${buddy.buddy_birthyear }대</td>
				</c:otherwise>
			</c:choose>
			<td>${buddy.buddy_msg }</td>
			<td>${buddy.buddy_city }</td>
			<td><input type="button" value="삭제하기" onclick="del_buddy('${buddy.buddy_num}')"></td>
		</tr>
	</c:forEach>
</table>
<br><br>
<h2>동행 요청</h2>

<script type="text/javascript">
	function del_buddy(buddy_num){
		var result = confirm('해당 글을 삭제하시겠습니까?');
		if(result) { 
			alert("삭제되었습니다.");
			window.location.href="<c:url value='/buddyDelete?buddy_num="+buddy_num+"' />";
		}else{
			
		}
	}
</script>