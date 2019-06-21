<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--================body Area =================-->
<br>

<div class="facilities_item">
	<h2 class="typo-list">내가 쓴 글</h2>
	
	<div class="page-liner"></div>
	
	<c:if test="${empty buddyList}">
		<br><p class="text-center">내가 쓴 글이 없습니다.</p>
	</c:if>
	
	<c:if test="${!empty buddyList}">
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">시작날짜</div>
					<div class="serial">종료날짜</div>
					<div class="serial">희망성별</div>
					<div class="serial">희망나이</div>
					<div class="serial">여행 소개</div>
					<div class="serial">도시</div>
					<div class="serial">내 동행</div>
					<div class="serial">삭제</div>
				</div>
				<c:forEach var="buddy" items="${buddyList}">	
					<div class="table-row">
						<div class="serial">${buddy.buddy_indate }</div>
						<div class="serial">${buddy.buddy_outdate }</div>
						<c:choose>
							<c:when test="${buddy.buddy_gender =='X'}">
								<div class="serial">상관없음</div>
							</c:when>
							<c:when test="${buddy.buddy_gender =='M'}">
								<div class="serial">남자</div>
							</c:when>
							<c:when test="${buddy.buddy_gender =='W'}">
								<div class="serial">여자</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${buddy.buddy_birthyear==0 }">
								<div class="serial">상관없음</div>
							</c:when>
							<c:otherwise>
								<div class="serial">${buddy.buddy_birthyear }대</div>
							</c:otherwise>
						</c:choose>
						<div class="serial">${buddy.buddy_msg }</div>
						<div class="serial">${buddy.buddy_city }</div>
						<c:if test="${not empty mybuddy}">
							<div class="serial">
								<c:forEach var="mybuddy" items="${mybuddy}">
									<c:if test="${buddy.buddy_num==mybuddy.buddy_num}">
										${mybuddy.mem_id}
									</c:if>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty mybuddy}">
							<div class="serial">동행이<br>없습니다.</div>
						</c:if>
						<div class="serial"><input type="button" class="btn btn-danger" value="삭제" onclick="del_buddy('${buddy.buddy_num}')"></div>
					</div>
				</c:forEach>
			</div>
		</div>	
	</c:if>
</div>

<div class="facilities_item">
	<h2>내가 받은 동행 요청</h2>
	
	<div class="page-liner"></div>
	
	<c:if test="${empty applyList}">
		<br><p class="text-center">받은 동행요청이 없습니다.</p>
	</c:if>
	
	<c:if test="${!empty applyList}">
		<div class="progress-table">
			<div class="table-head">
				<div class="serial">아이디</div>
				<div class="serial">상태</div>
				<div class="serial">수락</div>
				<div class="serial">거절</div>
				<div class="serial">쪽지</div>
			</div>
			<c:forEach var="apply" items="${applyList}">	
				<div class="table-row">
					<div class="serial">${apply.mem_id}</div>
					<c:choose>
						<c:when test="${apply.apply_state==0}">
							<div class="serial">대기중</div>
						</c:when>
						<c:when test="${apply.apply_state==1}">
							<div class="serial">수락</div>
						</c:when>
						<c:when test="${apply.apply_state==2}">
							<div class="serial">거절</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${apply.apply_state==0}">
							<div class="serial"><a href="<c:url value='/buddyAccept?apply_num=${apply.apply_num}' />" class="btn btn-primary">수락</a></div>
							<div class="serial"><a href="<c:url value='/buddyRefuse?apply_num=${apply.apply_num}' />" class="btn btn-danger">거절</a></div>
						</c:when>
						<c:otherwise>
							<div class="serial">-</div>
							<div class="serial">-</div>
						</c:otherwise>
					</c:choose>
					<div class="serial"><input type="button" class="btn btn-success msgBtn" value="쪽지하기" onclick="messagePopupFunc('${apply.mem_id}')"></div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>

<div class="facilities_item">
	<h2>내가 신청한 동행 요청</h2>
	
	<div class="page-liner"></div>
	
	<c:if test="${empty applyCk}">
		<br><p class="text-center">신청한 동행요청이 없습니다.</p>
	</c:if>
	
	<c:if test="${!empty applyCk}">
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">여행자</div>
					<div class="serial">시작날짜</div>
					<div class="serial">종료날짜</div>
					<div class="serial">희망성별</div>
					<div class="serial">희망나이</div>
					<div class="serial">여행 소개</div>
					<div class="serial">도시</div>
					<div class="serial">상태</div>
					<div class="serial">취소</div>
				</div>
				<c:forEach var="ck" items="${applyCk}">	
					<div class="table-row">
						<div class="serial">${ck.mem_id }</div>
						<div class="serial">${ck.buddy_indate }</div>
						<div class="serial">${ck.buddy_outdate }</div>
						<c:choose>
							<c:when test="${ck.buddy_gender =='X'}">
								<div class="serial">상관없음</div>
							</c:when>
							<c:when test="${ck.buddy_gender =='M'}">
								<div class="serial">남자</div>
							</c:when>
							<c:when test="${ck.buddy_gender =='W'}">
								<div class="serial">여자</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${ck.buddy_birthyear==0 }">
								<div class="serial">상관없음</div>
							</c:when>
							<c:otherwise>
								<div class="serial">${ck.buddy_birthyear }대</div>
							</c:otherwise>
						</c:choose>
						<div class="serial">${ck.buddy_msg }</div>
						<div class="serial">${ck.buddy_city }</div>
						<c:choose>
							<c:when test="${ck.apply_state==0}">
								<div class="serial">대기중</div>
							</c:when>
							<c:when test="${ck.apply_state==1}">
								<div class="serial">수락</div>
							</c:when>
							<c:when test="${ck.apply_state==2}">
								<div class="serial">거절</div>
							</c:when>
						</c:choose>
						<div class="serial"><input type="button" class="btn btn-danger" value="취소" onclick="cancle_apply('${ck.buddy_num}')"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>
</div>
<!-- 
	*******************************************
	modal  : 쪽지하기
	*******************************************	
-->
<div class="modal fade" id="msgModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"></h4>
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

<input type="hidden" id="localurl" value="<c:url value='/'/>">

<!--================ script =================-->
<script type="text/javascript">
	var localurl=$('#localurl').val();
	
	//글 삭제
	function del_buddy(buddy_num){
		var result = confirm('해당 글을 삭제하시겠습니까?');
		if(result) { 
			alert("삭제되었습니다.");
			window.location.href=localurl+"buddyDelete?buddy_num="+buddy_num;
		}else{
			
		}
	}
	
	//동행 요청 취소
	function cancle_apply(buddy_num){
		var result = confirm('동행 요청을 취소하시겠습니까?');
		if(result) { 
			alert("취소되었습니다.");
			window.location.href=localurl+"applyCancle?buddy_num="+buddy_num;
		}else{
			
		}
	}
	
	/*
		쪽지하기 팝업 클릭 이벤트
		- .msgBtn : 버튼 class 명
		- #msgModal : 팝업 id 명
	*/
	function messagePopupFunc(msg_id) {
			if('${mem_id}'!=null && '${mem_id}'!=""){
			$(".msgBtn").click(function(){
				$("#recipient-name").val(msg_id);
				$("#msgModal").modal();
			});
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
				$('#msgModal').modal('hide');
				$("#recipient-name").val("");
				$("#message-text").val("");
			} else {
				document.location="${pageContext.request.contextPath}/msgSendList?memId=${sessionScope.mem_id }&msgType=SEND&errMsg=오류가 발생했습니다.";
			}
		}
	}
</script>