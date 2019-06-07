<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/review/reviewLike.do?mem_id=test123&review_num=${vo.review_num }",
				dataType:"xml",
				success:function(data){
					console.log('success');
					//xml로 응답된 좋아요 수를 span에 보이기
					var review_like=$(data).find("review_like").text();
						$("#review_like").html(review_like);
				}
			});
		});
	});

</script>
<h1>상세 화면</h1>
<table border="1" style="width:700px;">
	<tr>
		<td>글번호</td>
		<td>${vo.review_num }</td>
	</tr>
	
	<tr>
		<td>아이디</td>
		<td>${vo.mem_id }</td>
	</tr>
	
	<tr>
		<td>글제목</td>
		<td>${vo.review_title }</td>
	</tr>
	
	<tr>
		<td>이미지</td>
		<td>
		<img src="<c:url value='/resources/uploadReview/${vo2.reviewImge_saveImg }'/>">
		</td>
	</tr>
	
	<tr>
		<td>글내용</td>
		<td><textarea rows="3" cols="40" readonly="readonly">${vo.review_content }</textarea>
	</tr>
	
	<tr>
		<td>조회수</td>
		<td>${vo.review_hit }</td>
	</tr>
	
	<tr>
		<td>작성일</td>
		<td>${vo.review_date }</td>
	</tr>
	<tr>
	<td><input type="button" value="좋아요" id="btn1">
	<%-- <a href="<c:url value='/review/reviewLike.do?mem_id=test123&review_num=${vo.review_num }'/>"><input type="button" value="좋아요"></a></td> --%>
	<%-- <td><a href="<c:url value='/review/reviewLike.do?mem_id=${sessionScope.mem_id }&review_num=${vo.review_num }'/>"><input type="button" value="좋아요"></a></td>--%>
		
		<td><span id="review_like" name="review_like">${review_like }</span></td>
	</tr>
	<tr>
		<td>이전글</td>
		<td><a href="<c:url value='/review/reviewDetail.do?review_num=${prev.review_num }'/>">${prev.review_title }</a></td>
	</tr>
	
	<tr>
		<td>다음글</td>
		<td><a href="<c:url value='/review/reviewDetail.do?review_num=${next.review_num }'/>">${next.review_title }</a></td>
	</tr>
	
	<%-- <tr>
	<td><a href="${pageContext.request.contextPath }/review/reviewDelete?reviewNum=${vo.reviewNum }">삭제</a></td>
	</tr>--%>
</table>
<a href="${pageContext.request.contextPath }/review/reviewList.do">전체글보기</a>
</div>