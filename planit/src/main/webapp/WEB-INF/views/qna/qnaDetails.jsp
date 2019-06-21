<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="breadcrumb_area">
	<div class="overlay bg-parallax"
		style="background: url(resources/images/qna2.png)"
		data-stellar-ratio="0.8" data-stellar-vertical-offset="0"
		data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">여행문의</h2>
			<p style="color: #D8D8D8">자유롭게 의견을 나눌 수 있는 공간</p>
		</div>
	</div>
</section>

<script type="text/javascript">
	$(function() {
		getList(1);
		$("#addBtn").click(function() {
			var mem_id = $("#mem_id").val();
			var qcomm_content = $("#qcomm_content").val();
			$.ajax({
				url : "<c:url value='/qnacomm/insert'/>",
				type : "post",
				data : {
					mem_id : '${vo.mem_id}',
					qna_num : '${vo.qna_num}',
					qcomm_content : qcomm_content
				},
				dataType : "xml",
				success : function(data) {
					var result = $(data).find("result").text();
					if (result == 'success') {
						getList(1);
						$("#mem_id").val("");
						$("#qcomm_content").val("");
					} else {
						alert("댓글등록실패");
					}
				}
			});
		});
	});
	function getList(pageNum) {
		$("#commList").empty();//기존댓글지우기
		console.log("ddd");
		$
				.ajax({
					url : "<c:url value='/comments/getList'/>",
					data : {
						pageNum : pageNum,
						qna_num : '${vo.qna_num}'
					},
					dataType : "xml",
					success : function(data) {
						console.log(data);
						$(data).find("list").each(
								function() {
									var mem_id = $(this).find("mem_id").text();
									var qcomm_content = $(this).find(
											"qcomm_content").text();
									var qcomm_date = $(this).find("qcomm_date")
											.text();
									var str = "<h5>" + mem_id + "</h5><small>"
											+ qcomm_date + "</small></h4>"
											+ "<p>" + qcomm_content
											+ "</p><br>";
									/*var str="<div class='comm'> " + mem_id + " "+ qcomm_date +  "<br>"+
									         "<div style='color:red'> " + qcomm_content + "</div></div>";*/

									$("#commList").append(str);
								});
						var pageHTML = "";
						var startPageNum = parseInt($(data)
								.find("startPageNum").text());
						var endPageNum = parseInt($(data).find("endPageNum")
								.text());
						var pageCount = parseInt($(data).find("pageCount")
								.text());

						if (startPageNum > 5) {
							pageHTML += "<a href='javascript:getList("
									+ (startPageNum - 1) + ")'>[이전]</a>";
						}
						for (var i = startPageNum; i <= endPageNum; i++) {
							if (i == pageNum) {//현재페이지인경우
								pageHTML += "<a href='javascript:getList(" + i
										+ ")'><span style='color:blue'>[" + i
										+ "]</span></a>";
							} else {
								pageHTML += "<a href='javascript:getList(" + i
										+ ")'><span style='color:gray'>[" + i
										+ "]</span></a>";
							}
						}
						if (endPageNum < pageCount) {
							pageHTML += "<a href='javascript:getList("
									+ (endPageNum + 1) + ")'>[다음]</a>";
						}
						$("#page").html(pageHTML);
					}

				});
	}
</script>
<!-- 
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
 -->
<!--<div class="container-fluid" style = "border:1px solid #aaa;border-radius: 5px;padding:30px 20px 30px 100px;"> -->


<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div style="text-align: center">
				<input type="hidden" value="${vo.qna_num }">
				<h1>${vo.qna_title}</h1>작성자 <small><a href="#">${vo.mem_id }</a>
					${vo.qna_date }</small> <br> <br>
				<div>
					<span style="font-size: 1.5em; color: gray">${vo.qna_content }</span>
				</div>
			</div>
			<br> <br>
			<div style="margin: auto; width: 500px;">
				<h4>댓글</h4>
				<div>
					<textarea id="qcomm_content" class="form-control" rows="2" required></textarea>
					<input type="button" class="genric-btn danger small" id="addBtn"
						value="확인">
				</div>
			</div>
		</div>
		<br> <br>
		<div class="row2">
			<div id="commList"></div>

			<!--  <p><span class="badge">1</span> Comment:</p><br> -->
			<div id="pageList">
				<div id="page"></div>
			</div>
		</div>
	</div>

</div>


<!--  </div>-->






