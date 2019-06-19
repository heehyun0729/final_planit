<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style="background : url(resources/images/qna2.png)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">여행문의</h2>
            <p style="color:#D8D8D8">자유롭게 의견을 나눌 수 있는 공간</p>
        </div>
    </div>
</section>

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
						var str="<div class='comm'> " + mem_id + " "+ qcomm_date +  "<br>"+
						         "<div style='color:red'> " + qcomm_content + "</div></div>";
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
<style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    .col-lg-2 {width:80%;}
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">

    <div class="col-md-10">
      <hr>
      <h1>${vo.qna_title}</h1>
      <br>작성자 <small><a href ="#">${vo.mem_id }</a>  <span class="glyphicon glyphicon-time"></span> ${vo.qna_date }</small>
      
      <br><br>
      <div>
      <span style="font-size:1.5em;color:gray">${vo.qna_content }</span>
      </div>
      <br><br>

      <h4>댓글 달기</h4>
      <form role="form">
        <div class="form-group">
          <textarea class="form-control" rows="3" required></textarea>
        </div>
        <button type="submit" class="genric-btn danger small" style="text-align:center"><h6>확인</h6></button>
      </form>
      <br><br>
      
      <p><span class="badge">2</span> Comments:</p><br>
      
      <div class="row">
        <div class="col-sm-2 text-center">
          <img src="bandmember.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>Anja <small>Sep 29, 2015, 9:12 PM</small></h4>
          <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
        </div>
        <div class="col-sm-2 text-center">
          <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>John Row <small>Sep 25, 2015, 8:25 PM</small></h4>
          <p>I am so happy for you man! Finally. I am looking forward to read about your trendy life. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
          <p><span class="badge">1</span> Comment:</p><br>
          <div class="row">
            <div class="col-sm-2 text-center">
              <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
            </div>
            <div class="col-xs-10">
              <h4>Nested Bro <small>Sep 25, 2015, 8:28 PM</small></h4>
              <p>Me too! WOW!</p>
              <br>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>






