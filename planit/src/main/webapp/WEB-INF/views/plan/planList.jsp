<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$("#showMsgPopup").click(function(e) {
		e.preventDefault();
	});
});
function messagePopupFunc(msg_id) {
	if('${mem_id}'!=null && '${mem_id}'!=""){
		$("#recipient-name").val(msg_id);
		$("#planMsgModal").modal();
	}else{
		alert("로그인이 필요한 서비스 입니다.");
	}
}
//메세지 보내기
function sendMessage() {
	var memId = document.getElementById("recipient-name").value;
	var content = document.getElementById("message-text").value;
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=sendMessageResult;
	xhr.open("post","${pageContext.request.contextPath}/msgSendForm",true);	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("receiveMemId=${mem_id}&sendMemId=" + memId+"&msgContent="+content);
}
//메세지 대기
function sendMessageResult() {
	if(xhr.readyState==4 && xhr.status==200){
		var data=xhr.responseText;
		var result=eval("(" + data +")");
		if (result.code == "success") {			
			$('#planMsgModal').modal('hide');
			$("#recipient-name").val("");
			$("#message-text").val("");
		} else {
			document.location="${pageContext.request.contextPath}/msgSendList?memId=${sessionScope.mem_id }&msgType=SEND&errMsg=오류가 발생했습니다.";
		}
	}
}
</script>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(../resources/images/map.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">계획짜기</h2>
            <p style="color:#D8D8D8">플래너를 만들고 다른 여행자들과 공유해보세요!</p>
        </div>
    </div>
</section>
<!--================Breadcrumb Area =================-->
<section class="about_history_area section_gap">
    <div class="container">
        <div class="page-cover text-center">
           <h2 class="title title_color"><img src = "<c:url value='/resources/images/logo3-1.png'/>" style = "height:40px;padding-bottom: 8px;"> 과 함께 여행을 즐겨보세요.</h2>
           <a href="<c:url value = '/plan/planner'/>" class="button_hover theme_btn" style = "margin: 30px 0 50px 0;">플래너 시작</a>
        </div>
        <hr>
    </div>
</section>

<section class="latest_blog_area mb-30">
    <div class="container">
        <div class="section_title">
        	<div class = "row d-flex">
        		<div class = "p-2">
        			<h2>다른 여행자들의 플래너</h2>
        		</div>
        		<div class = "row ml-auto p-2">
        			<form method="post" action="<c:url value = '/plan/list'/>">
						<input type = "hidden" value = "${pageNum }" name = "pageNum">
						<div class = "form-inline">
							<select name = "field" class = "nice-select" style = "height: 39px;">
								<option value = "country"
									<c:if test = "${field == 'country' }">selected = "selected"</c:if>
								>국가</option>
								<option value = "city"
									<c:if test = "${field == 'city' }">selected = "selected"</c:if>
								>도시</option>
								<option value = "plan_title"
									<c:if test = "${field == 'plan_title' }">selected = "selected"</c:if>
								>제목</option>
								<option value = "mem_id"
									<c:if test = "${field == 'mem_id' }">selected = "selected"</c:if>
								>작성자</option>
							</select>
							<input type = "text" style = "margin:0 10px;" name = "keyword" value = "${keyword }" class = "form-control single-input">
							<input type = "submit" value = "검색" class = "genric-btn success-border circle">
						</div>
					</form>
        		</div>
        	</div>
        </div>
        <c:if test="${empty list }">
        	<div class = "row mb-30 text-center">
				<div class="col-lg-12 mb-30">
					<h5>조회된 결과가 없습니다.</h5>
				</div>
			</div>
		</c:if>
		<c:set var = "n" value = "0"/>
		<div class = "row mb-30 text-center">
		<c:forEach var = "vo" items="${list }">
			<c:if test="${n % 4 == 0 }">
				</div>
				<div class = "row mb-30 text-center">
			</c:if>
			<div class="col-lg-3 col-md-6 mb-30">
				<div class="single-recent-blog-post" style = "border: 1px solid #ddd; border-radius: 0 0 10px 10px;padding-bottom: 15px;">
					<div class="thumb" >
						<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><img src = "${vo.plan_img }" style = "height: 300px;"></a>
					</div>
					<div class = "details align-items-center">
						<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><h4 class="sec_h4">${vo.plan_title }</h4></a>
						<img src = "<c:url value = '${vo.img_saveImg }'/>" class="img-circle avatar" style = "margin-bottom: 5px;">
						<div class="dropdown show">
						  <a href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${vo.mem_id }</a>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						  	<a class="dropdown-item" href = "<c:url value = '/member/mypage/${vo.mem_id}'/>" target = "_blank">프로필 보기</a>
							<a class="dropdown-item" href = "#" onclick="javascript:messagePopupFunc('${vo.mem_id}')" id = "showMsgPopup">쪽지 보내기</a>
						  </div>
						</div>
					</div>
				</div>
			</div>
			<c:set var = "n" value = "${n + 1 }"/>
		</c:forEach>
		</div>
	 <nav class="blog-pagination justify-content-center d-flex">
           <ul class="pagination">
               <li class="page-item">
               	<c:if test="${startPage > 1 }">
					<a class="page-link" aria-label="이전" href = "<c:url value = '/plan/list?pageNum=${startPage - 1 }&field=${field }&keyword=${keyword }'/>">
						<span aria-hidden="true">
                           <span class="lnr lnr-chevron-left"></span>
                       </span>
					</a>
				</c:if>
               </li>
               <c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
					<c:choose>
						<c:when test="${i == pageNum }">
							<li class="page-item active"><a class="page-link" href = "<c:url value = '/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href = "<c:url value = '/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
               <li class="page-item">
               		<c:if test="${endPage < pageCnt }">
						<a class="page-link" aria-label="다음" href = "<c:url value = '/plan/list?pageNum=${endPage + 1 }&field=${field }&keyword=${keyword }'/>">
							<span aria-hidden="true">
	                           <span class="lnr lnr-chevron-right"></span>
	                       </span>
						</a>
					</c:if>
               </li>
           </ul>
       </nav>
</section>
<!-- 
	*******************************************
	modal  : 쪽지하기
	*******************************************	
-->
<div class="modal fade" id="planMsgModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">쪽지보내기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">받는사람 :</label>
						<input type="text" class="form-control" value="" id="recipient-name" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">메세지 :</label>
						<textarea class="form-control" id="message-text" style="height: 150px;"></textarea>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="genric-btn primary circle" onclick="sendMessage()">보내기</button>
				<button type="button" class="genric-btn primary circle" data-dismiss="modal">취소</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->