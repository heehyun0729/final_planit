<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.0.min.js"></script>
	<!-- $(function(){
		$("#addBtn").click(function(){
			//var mem_id=$("#mem_id").val();
			var comments=$("#comments").val();
			$.ajax({
				url:"<c:url value='/comments/insert'/>",
				type:"post",
				data:{mem_id:${mem_id},comments:comments,qna_num:${qna_num}},
				dataType:"xml",
				success:function(data){
					var result=$(data).find("result").text();
					if(result=='success'){
						$("#comments").val("");
					}else{
						alert("댓글등록실패");
					}
				}
			});
		});
	})-->
<div id="update">
	<table border="1">
		<tr>
			<td>글번호</td><td>${vo.qna_num }</td>
		</tr>
		<tr>
			<td>작성자</td><td>${vo.mem_id }</td>
		</tr>
		<tr>
			<td>카테고리</td><td>${vo.qna_cate }</td>
		</tr>
		<tr>
			<td>제목</td><td>${vo.qna_title }</td>
		</tr>
		<tr>
			<td>내용</td><td><div>${vo.qna_content }</div></td>
		</tr>
		<tr>
		
			<td>작성일자</td><td>${vo.qna_date }</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${sessionScope.mem_id == mem_id}">
			<a href="${pageContext.request.contextPath }/qna/updateQna?qna_num=${vo.qna_num}">글수정</a>
			<a href="${pageContext.request.contextPath }/qna/deleteQna?qna_num=${vo.qna_num}">글삭제</a>
		</c:when>	
	</c:choose>
</div>
                            

<!--  <div id="comments">
	<div id="commList">
	</div>
	<div id="commAdd">
		<input type="hidden" id="mem_id" value="mem_id"><br>
		내용<textarea rows="3" cols="40" id="comments"></textarea><br>
		<input type="button" value="등록" id="addBtn">
	</div>
</div>
	-->

