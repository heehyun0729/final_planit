<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		getList(1);
		$("#addBtn").click(function(){
			var mem_id=$("#mem_id").val();
			var qcomm_content=$("#qcomm_content").val();
			$.ajax({
				url:"<c:url value='/qnacomm/insert'/>",
				type:"post",
				data:{mem_id:'${vo.mem_id}',qna_num:'${vo.qna_num}',qcomm_content:qcomm_content},
				dataType:"xml",
				success:function(data){
					var result=$(data).find("result").text();
					if(result=='success'){
						getList(1);
						$("#mem_id").val("");
						$("#qcomm_content").val("");
					}else{
						alert("댓글등록실패");
					}
				}
			});
		});
	});
	function getList(pageNum){
		$("#commList").empty();//기존댓글지우기
		console.log("ddd");
		$.ajax({
			url:"<c:url value='/comments/getList'/>",
			data:{pageNum:pageNum,qna_num:'${vo.qna_num}'},
			dataType:"xml",
			success:function(data){
				console.log(data);
				$(data).find("list").each(function(){
						var mem_id=$(this).find("mem_id").text();
						var qcomm_content=$(this).find("qcomm_content").text();
						var qcomm_date=$(this).find("qcomm_date").text();
						var str="<div class='comm'>[작성자] " + mem_id + "<br>"+
						         "[내용] " + qcomm_content + "[날짜]" + qcomm_date + "</div>";
						$("#commList").append(str);
					});
					var pageHTML="";
					var startPageNum=parseInt($(data).find("startPageNum").text());
					var endPageNum=parseInt($(data).find("endPageNum").text());
					var pageCount=parseInt($(data).find("pageCount").text());
					
					if(startPageNum>5){
						pageHTML += "<a href='javascript:getList(" + (startPageNum-1) +")'>[이전]</a>";
					}	
					for(var i=startPageNum;i<=endPageNum;i++){
						if(i==pageNum){//현재페이지인경우
							pageHTML += 
							"<a href='javascript:getList("+ i + ")'><span style='color:blue'>["+ i +"]</span></a>";
						}else{
							pageHTML += 
							"<a href='javascript:getList("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
						}
					}
					if(endPageNum<pageCount){
						pageHTML += "<a href='javascript:getList(" + (endPageNum+1) +")'>[다음]</a>";
					}
					$("#page").html(pageHTML);
			}
					
		});
	}
</script>
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
                            

 <div id="comments">
	<div id="commList">
	</div>
	<div id="pageList">
		<div id="page"></div>
	</div>
	<div id="commAdd">
		내용<textarea rows="3" cols="40" name="qcomm_content" id="qcomm_content"></textarea><br>
		<input type="button" value="등록" id="addBtn">
	</div>
</div>


