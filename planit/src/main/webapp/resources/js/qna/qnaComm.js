	$(function)(){
		$("#addBtn").click(function(){
			var qcomm_content=$("#qcomm_content").val();
			$.ajax({
				url:"<c:url value='/qnacomm/insert'/>",
				type:"post",
				data:{qcomm_num:qccom_num,qcomm:qcomm_content,qna_num:${qna_num},mem_id:${mem_id}},
				dataType:"xml",
				success:function(data){
					var result=$(data).find("result").text();
					if(reult=='success'){
						getList(1);
						$("#qcomm_content").val("");
					}else{
						alert("댓글등록실패");
					}
				}
			});
		});
	}
	function getList(pageNum){
		$("#commList").empty();//기존댓글지우기
		$.ajax({
			url:"<c:url value='/comments/getList'/>",
			data:{pageNum:pageNum,qna_num:${qna_num}},
			dataType:"xml",


			$(data).find("list").each(function(){
					var cnum=$(this).find("cnum").text();
					var writer=$(this).find("writer").text();
					var comments=$(this).find("comments").text();
					var str="<div class='comm'>[작성자] " + writer + "<br>"+
					         "[내용] " + comments + "</div>";
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
	});