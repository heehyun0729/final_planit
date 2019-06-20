<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.comm{width:300px;height: 200px; text-align: center; }
</style>
<div>
<script>
	$(document).ready(function(){
		getList(1);
		$("#btn1").click(function(e){
			e.preventDefault();
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
				dataType:"text",
				data:{rcomm_num:rcomm_num ,review_num:'${vo.review_num}'},
				url:"${pageContext.request.contextPath}/reviewCommDelete",
				success: function(data){
					console.log("?????2222222222222");
		             getList(pageNum);

				
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
					
					var str="<div class='comm' >[작성자] <br>" +mem_id + "<br>" + "[내용]<br>" + rcomm_content +"<br>" + "[날짜]<br>" +rcomm_date+
					"<br>"+"<input type='button'  value='삭제' onclick='del(" + rcomm_num+","+pageNum + ")'>"
					"</div>";
					
					
					$("#commList").append(str);
					
				});
				var pageHTML="<div style='text-align:center'>";
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
				pageHTML +="</div>";
				$("#page").html(pageHTML);
				}
		});
	}
</script>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(../resources/images/map.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">여행후기</h2>
        </div>
    </div>
</section>


<div class="container">
<h1>여행후기 글</h1>

<a href="${pageContext.request.contextPath }/review/reviewList.do"><span style="color: #339af0;">여행후기 리스트</span></a> /
<a href="${pageContext.request.contextPath }/review/reviewUpdate?review_num=${vo.review_num}"><span style="color:#FA58F4">여행 글수정</span></a>
<table class="table">

	
	<tr>
		<th>글번호</th>
		<td style="text-align: center;">${vo.review_num }</td>
	</tr>
	
	<tr>
		<th>아이디</th>
		<td style="text-align: center;">${vo.mem_id }</td>
	</tr>
	
	<tr>
		<th>국가</th>
		<td style="text-align: center;">${vo.review_country }</td>
	</tr>
	
	<tr>
		<th>도시</th>
		<td style="text-align: center;">${vo.review_city }</td>
	</tr>
	
	<tr>
		<th>글제목</th>
		<td style="text-align: center;">${vo.review_title }</td>
	</tr>
	
	<tr>
		<th>대표이미지</th>
		<td style="text-align: center;">
		<img src="<c:url value='/resources/uploadReview/${vo2.reviewImge_saveImg }'/>">
		</td>
	</tr>
	
	<tr>
		<th>사진/글 내용</th>
		<td style="text-align: center;"><div>${vo.review_content }</div></td>
		<!--  <td><textarea rows="3" cols="40" readonly="readonly"><div>${vo.review_content }</div></textarea>-->
	</tr>
	
	<tr>
		<th>조회수</th>
		<td style="text-align: center;">${vo.review_hit }</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td style="text-align: center;">${vo.review_date }</td>
	</tr>
	<tr>
	<td>
	<a id="btn1" href="#" style="margin-right: 100px;"><i class="fas fa-thumbs-up" style="color: #339af0;">좋아요</i></a>
	<%-- <a href="<c:url value='/review/reviewLike.do?mem_id=test123&review_num=${vo.review_num }'/>"><input type="button" value="좋아요"></a></td> --%>
	<%-- <td><a href="<c:url value='/review/reviewLike.do?mem_id=${sessionScope.mem_id }&review_num=${vo.review_num }'/>"><input type="button" value="좋아요"></a></td>--%>
		
		<td style="text-align: center;"><span id="review_like" name="review_like">${review_like }</span></td>
	</tr>
	<tr>
		<th>이전글</th>
		<td style="text-align: center;"><a style="color: #339af0;" href="<c:url value='/review/reviewDetail.do?review_num=${prev.review_num }'/>">${prev.review_title }</a></td>
	</tr>
	
	<tr>
		<th>다음글</th>
		<td style="text-align: center;"><a style="color: #FA58F4;" href="<c:url value='/review/reviewDetail.do?review_num=${next.review_num }'/>">${next.review_title }</a></td>
	</tr>
	
	<%-- <tr>
	<td><a href="${pageContext.request.contextPath }/review/reviewDelete?reviewNum=${vo.reviewNum }">삭제</a></td>
	</tr>--%>
</table>


<div id="movieComment">
	<div id="commAdd">
<table class="table">
	<tr>
		<th>댓글입력 </th>
		<td style="text-align: center;"><textarea rows="3" cols="40" id="rcomm_content"></textarea><br>
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

</div>