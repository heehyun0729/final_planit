<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<script>
	$(document).ready(function(){
		$("#btn1").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/review/reviewLike.do?mem_id=${vo.mem_id}&review_num=${vo.review_num }",
				dataType:"xml",
				success:function(data){
					console.log('success');
					//xml로 응답된 좋아요 수를 span에 보이기
					var review_like=$(data).find("review_like").text();
						$("#review_like").html(review_like);
				}
			});
		});
		$("#addBtn").click(function(){
			//getList(1);
			var mem_id='${vo.mem_id }';
			var rcomm_content=$("#rcomm_content").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/reviewComm/insert?mem_id=${vo.mem_id}&review_num=${vo.review_num}",
				type:"post",
				data:{rcomm_content:rcomm_content},
				dataType:"xml",
				success:function(data){
				
					var result=$(data).find("result").text();
					if(result=='success'){
						getList(1);
						$("#mem_id").val("");
						$("#rcomm_content").val("");
					}else{
						alert("댓글등록실패!");
					}
				}
			});
		});
	});
	function del(rcomm_num, pageNum){
		if(confirm("해당 댓글을 삭제 하시겠습니까?")){
			console.log("?????1111111111");
			$.ajax({
				dataType:"xml",
				data:{rcomm_num:rcomm_num ,review_num:'${vo.review_num}'},
				url:"${pageContext.request.contextPath}/reviewCommDelete",
				success: function(data){
					console.log("?????2222222222222");
					consol.log(data)
					if(result=="success"){
						getList(pageNum);
						alert(rcomm_num,pageNum);
					}
				}
			});
		}
	}	
	function getList(pageNum){
		$("#commList").empty();
		$.ajax({
			url:"${pageContext.request.contextPath}/reviewCommVo/getList",
			data:{pageNum:pageNum,review_num:${vo.review_num}},
			dataType:"xml",
			success:function(data){
				
				$(data).find("list").each(function(){
					var mem_id=$(this).find("mem_id").text();
					var rcomm_num=$(this).find("rcomm_num").text();
					var rcomm_content=$(this).find("rcomm_content").text();
					var rcomm_date=$(this).find("rcomm_date").text();
					
					var str="<div class='comm'>[작성자] " +mem_id + "<br>" + "[내용]" + rcomm_content +  "[날짜]" +rcomm_date+
					"<input type='button' value='댓글삭제' onclick='del(" + rcomm_num+","+pageNum + ")'>"
					"</div>";
					
					
					$("#commList").append(str);
					
				});
				var pageHTML="";
				var startPageNum=parseInt($(data).find("startPageNum").text());
				var endPageNum=parseInt($(data).find("endPageNum").text());
				var pageCount=parseInt($(data).find("pageCount").text());
				
				if(startPageNum>5){
					pageHTML +="<a href='javascript:getList("+(startPageNum-1) +")'>[이전]</a>";

				}
				
				for(var i=startPageNum; i<=endPageNum;i++){
					if(i==pageNum){ 
						pageHTML += "<a href='javascript:getList("+ i +")'><span style='color:blue'>["+ i +"]</span></a>";
						
					}else{
						pageHTML +="<a href='javascript:getList("+ i +")'><span style='color:gray'>[" + i + "]</span></a>";
						}
					}
				if(endPageNum<pageCount){
					pageHTML +="<a href='javascript:getList("+(endPageNum+1)+")'>[다음]</a>";
				}
				$("#page").html(pageHTML);
				}
		});
	}
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
		<td>국가</td>
		<td>${vo.review_country }</td>
	</tr>
	
	<tr>
		<td>도시</td>
		<td>${vo.review_city }</td>
	</tr>
	
	<tr>
		<td>글제목</td>
		<td>${vo.review_title }</td>
	</tr>
	
	<tr>
		<td>대표이미지</td>
		<td>
		<img src="<c:url value='/resources/uploadReview/${vo2.reviewImge_saveImg }'/>">
		</td>
	</tr>
	
	<tr>
		<td>사진/글 내용</td>
		<td><div>${vo.review_content }</div></td>
		<!--  <td><textarea rows="3" cols="40" readonly="readonly"><div>${vo.review_content }</div></textarea>-->
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
<a href="${pageContext.request.contextPath }/review/reviewUpdate?review_num=${vo.review_num}">글수정</a>
<div id="movieComment">
	<div id="commAdd">
<table border="1" style="width:700px;">
	<tr>
		<td>아이디</td>
		<td>${vo.mem_id }</td>
	</tr>
	<tr>
		<td>댓글입력 </td>
		<td><textarea rows="3" cols="40" id="rcomm_content"></textarea>
		<input type="button" value="등록" id="addBtn">
		</td>
	</tr>
</table>
	<div id="commList"><!-- 댓글목록 -->
	</div>
		<div id="pageList"><!-- 페이징 div -->
		<div id="page"></div>
		</div>
	</div>
</div>
</div>