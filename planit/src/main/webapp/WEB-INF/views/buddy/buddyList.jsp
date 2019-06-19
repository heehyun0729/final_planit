<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--================style Area =================-->
<style>
	.active { color: #fff !important; background-color: #337ab7 !important; border-color: #2e6da4 !important;}
	.mg_p { margin:20px 0px; }
	.page-liner{padding-bottom: 9px;margin: 20px 0 20px;border-bottom: 1px solid #eee;}
	
	.ui-datepicker{ font-size: 20px; width: 320px; }
	.ui-datepicker select.ui-datepicker-month{ width:70px; font-size: 20px; }
	.ui-datepicker select.ui-datepicker-year{ width:80px; font-size: 20px; }
	
</style>

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style="background : url(resources/images/buddy01.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle f_48">동행 찾기</h2>
            <p style="color:#D8D8D8">나와 함께 여행할 동행을 찾아보세요!!</p>
        </div>
    </div>
</section>

<!--================body Area =================-->
<br>
<div class="container">
	<c:if test="${empty sglist}">
		<div class="row">
			<div class="col-lg-12">
				<div class="facilities_item">
					<form method="post" action="<c:url value='/buddyList'/>" onsubmit="return check()">
						<div class="row">
							<div class="col-md-6">
								<h3 class="typo-list">여행 시작</h3>
					            <input type="text" class="form-control" placeholder="Input date" id="buddy_indate" name="kw_indate">
				            </div>
				 			<div class="col-md-6">
				 				<h3 class="typo-list">여행 끝</h3>
					            <input type="text" class="form-control" placeholder="Input date" id="buddy_outdate" name="kw_outdate">
				 			</div>
				        </div>
						
						<br>
						
						<p>※ 게시판에 등록되어 있는 국가와 도시만 표시합니다. 글 등록 시 국가와 도시가 갱신됩니다.</p>
						<div class="page-liner"></div>
						
						<c:if test="${empty countryList}">
							<br><p class="text-center">※ 등록된 국가 혹은 도시가 없습니다.</p>
						</c:if>
						<c:forEach var="country" items="${countryList}">
							<div class="row">
								<div class="col-md-3">
									<h4 class="typo-list">${country }</h4>
								</div>
								
								<c:forEach var="city" items="${cityList}">
									<c:if test="${city.key==country }">
										<div class="col-md-9">
											<div class="btn-group-toggle" data-toggle="buttons">
												<c:forEach var="cityVal" items="${city.value}">
													<label class="btn btn default">
														<input type="checkbox" id="${cityVal }" value="${cityVal }" name="kw_city"> ${cityVal }
													</label>
												</c:forEach>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="page-liner"></div>
						</c:forEach>
						
						<div class="page-liner"></div>
						
						<div>
							<label>성별</label>
						</div>
						<div class="form-group">
							<select name="kw_gender" class="nice-select wide">
								<option value="X">상관없음</option>
								<option value="M">남자</option>
								<option value="W">여자</option>
							</select>
						</div>
						
						<br>
						<div class="page-liner"></div>
						
						<div>
							<label>연령대</label>
						</div>
						<div class="form-group">
							<select name="kw_birthYear" class="nice-select wide">
								<option value="0">상관없음</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대 이상</option>
							</select>
						</div>
						
						<div class="page-liner"></div>
						
						<div class="text-center">
							<input type="submit" class="genric-btn primary circle arrow" value="검색">
						</div>
					</form>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${!empty sglist}">
		<div class="row">
			<div class="col-lg-8">
				<div class="facilities_item">
					<form method="post" action="<c:url value='/buddyList'/>" onsubmit="return check()">
						<div class="row">
							<div class="col-md-6">
								<h3 class="typo-list">여행 시작</h3>
					            <input type="text" class="form-control" placeholder="Input date" id="buddy_indate" name="kw_indate">
				            </div>
				 			<div class="col-md-6">
				 				<h3 class="typo-list">여행 끝</h3>
					            <input type="text" class="form-control" placeholder="Input date" id="buddy_outdate" name="kw_outdate">
				 			</div>
				        </div>
						
						<br>
						
						<p>※ 게시판에 등록되어 있는 국가와 도시만 표시합니다. 글 등록 시 국가와 도시가 갱신됩니다.</p>
						<div class="page-liner"></div>
						
						<c:if test="${empty countryList}">
							<br><p class="text-center">※ 등록된 국가 혹은 도시가 없습니다.</p>
						</c:if>
						<c:forEach var="country" items="${countryList}">
							<div class="row">
								<div class="col-md-3">
									<h4 class="typo-list">${country }</h4>
								</div>
								
								<c:forEach var="city" items="${cityList}">
									<c:if test="${city.key==country }">
										<div class="col-md-9">
											<div class="btn-group-toggle" data-toggle="buttons">
												<c:forEach var="cityVal" items="${city.value}">
													<label class="btn btn default">
														<input type="checkbox" id="${cityVal }" value="${cityVal }" name="kw_city"> ${cityVal }
													</label>
												</c:forEach>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="page-liner"></div>
						</c:forEach>
						
						<div class="page-liner"></div>
						
						<div>
							<label>성별</label>
						</div>
						<div class="form-group">
							<select name="kw_gender" class="nice-select wide">
								<option value="X">상관없음</option>
								<option value="M">남자</option>
								<option value="W">여자</option>
							</select>
						</div>
						
						<br>
						<div class="page-liner"></div>
						
						<div>
							<label>연령대</label>
						</div>
						<div class="form-group">
							<select name="kw_birthYear" class="nice-select wide">
								<option value="0">상관없음</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대 이상</option>
							</select>
						</div>
						
						<div class="page-liner"></div>
						
						<div class="text-center">
							<input type="submit" class="genric-btn primary circle arrow" value="검색">
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="text-center">
					<div class="blog_right_sidebar">
						<p class="text-left">동행추천 :</p>
						<p>※ 나와 비슷한 일정에 같은 도시를 여행하는 사람</p>
					</div>
					
					<div class="page-liner"></div>
					
					<c:forEach var="sglist" items="${sglist}">
						<div class="blog_right_sidebar">
							<div class="row">
								<div class="col-md-4">
									아이디 : 
								</div>
								<div class="col-md-8">
									${sglist.mem_id }
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									출발 날짜 :
								</div>
								<div class="col-md-8">
									${sglist.buddy_indate }
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									도착 날짜 :  
								</div>
								<div class="col-md-8">
									${sglist.buddy_outdate }
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									여행 도시 :  
								</div>
								<div class="col-md-8">
									${sglist.buddy_city }
								</div>
							</div>
							<br>
							<input type="button" class="btn btn-success msgBtn" value="쪽지하기" onclick="messagePopupFunc('${sglist.mem_id}')"> 
							<input type="button" value="동행요청하기" onclick="apply_buddy('${list.buddy_num}')" class="btn btn-success">
						</div>
						<div class="page-liner"></div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:if>
	<div class="facilities_item">
		<c:if test="${empty buddyList}">
			<br><p class="text-center">※ 조회 된 동행이 없습니다.</p>
		</c:if>
		<c:if test="${!empty buddyList}">
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">여행자</div>
						<div class="serial">여행날짜</div>
						<div class="serial">희망성별</div>
						<div class="serial">희망나이</div>
						<div class="serial">여행 소개</div>
						<div class="serial">여행할 도시</div>
						<div class="serial">쪽지하기</div>
						<div class="serial">동행요청하기</div>
					</div>
					
					<c:forEach var="buddy" items="${buddyList}">	
						<div class="table-row">
							<div class="serial">${buddy.mem_id}</div>
							<div class="serial">${buddy.buddy_indate} ~ ${buddy.buddy_outdate}</div>
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
								<c:when test="${buddy.buddy_birthyear==0}">
									<div class="serial">상관없음</div>
								</c:when>
								<c:otherwise>
									<div class="serial">${buddy.buddy_birthyear}대</div>
								</c:otherwise>
							</c:choose>
							<div class="serial">${buddy.buddy_msg}</div>
							<div class="serial">${buddy.buddy_city}</div>
							<div class="serial"><input type="button" class="btn btn-success msgBtn" value="쪽지하기" onclick="messagePopupFunc('${buddy.mem_id}')"></div>
							<c:choose>
								<c:when test="${empty overlap_ck}">
									<div class="serial"><input type="button" class="btn btn-success msgBtn" value="동행요청하기" onclick="apply_buddy('${buddy.buddy_num}')"></div>
								</c:when>
								<c:otherwise>
									<c:set var="find" value="false" />
									<c:forEach var="overlapck" items="${overlap_ck}">
										<c:choose>
											<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='0' }">
												<div class="serial"><input type="button" class="btn btn-success msgBtn" value="요청중" disabled="disabled"></div>
												<c:set var="find" value="true" />
											</c:when>
											<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='1' }">
												<div class="serial"><input type="button" class="btn btn-success msgBtn" value="수락" disabled="disabled"></div>
												<c:set var="find" value="true" />
											</c:when>
											<c:when test="${overlapck.buddy_num==buddy.buddy_num && overlapck.mem_id == mem_id && overlapck.apply_state=='2' }">
												<div class="serial"><input type="button" class="btn btn-success msgBtn" value="동행요청하기" onclick="apply_buddy('${buddy.buddy_num}')"></div>
												<c:set var="find" value="true" />
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${not find}">
										<div class="serial"><input type="button" class="btn btn-success msgBtn" value="동행요청하기" onclick="apply_buddy('${buddy.buddy_num}')"></div>
									</c:if>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</div>
	<div class="text-center">
		<input id="list_all" class="genric-btn primary circle" type="button" value="전체 글 목록">
		<a href="#" onclick="insert_buddy()" class="genric-btn success circle arrow">동행 등록하기<span class="lnr lnr-arrow-right"></span></a>
	</div>
	<c:if test="${!empty buddyList}">
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<li class="page-item">
					<c:choose>
						<c:when test="${startPage > 1 }">
			                <a href="<c:url value='/buddyList?pageNum=${startPage - 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Previous">
			                    <span aria-hidden="true">
			                        <span class="lnr lnr-chevron-left"></span>
			                    </span>
			                </a>
		                </c:when>
		                <c:otherwise>
			                <a href="<c:url value='/buddyList?pageNum=1${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Previous">
			                    <span aria-hidden="true">
			                        <span class="lnr lnr-chevron-left"></span>
			                    </span>
			                </a>
		                </c:otherwise>
	                </c:choose>
	            </li>
				
				<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum==i }"><%--현재 페이지 --%>
							<li class="page-item active"><a href="<c:url value='/buddyList?pageNum=${i}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link">
							${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="<c:url value='/buddyList?pageNum=${i}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link">
							${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<li class="page-item">
					<c:choose>
						<c:when test="${endPage < pageCnt}">
			                <a href="<c:url value='/buddyList?pageNum=${startPage + 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Next">
			                    <span aria-hidden="true">
			                        <span class="lnr lnr-chevron-right"></span>
			                    </span>
			                </a>
		                </c:when>
		                <c:when test="${pageNum == pageCnt}">
			                <a href="<c:url value='/buddyList?pageNum=${pageNum}${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Next">
			                    <span aria-hidden="true">
			                        <span class="lnr lnr-chevron-right"></span>
			                    </span>
			                </a>
		                </c:when>
		                <c:otherwise>
		                	<a href="<c:url value='/buddyList?pageNum=${startPage + 1 }${kw_city}&kw_indate=${findList.kw_indate}&kw_outdate=${findList.kw_outdate}&kw_gender=${findList.kw_gender}&kw_birthYear=${findList.kw_birthYear}'/>" class="page-link" aria-label="Next">
			                    <span aria-hidden="true">
			                        <span class="lnr lnr-chevron-right"></span>
			                    </span>
			                </a>
		                </c:otherwise>
	                </c:choose>
	            </li>
			</ul>
		</nav>
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
				<button type="button" class="btn btn-primary" onclick="sendMessage()">보내기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<input type="hidden" id="localurl" value="<c:url value='/'/>">

<!--================ script =================-->
<script type="text/javascript">
	
	var localurl=$('#localurl').val();
	$(function() {
		$.datepicker.regional['calendar'] = {
				closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        dateFormat: 'yy-mm-dd',
		        minDate: 0,
		        showMonthAfterYear: true,
		        yearSuffix: '년',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: 'c-99:c+99',
		        showButtonPanel: true
		}
		$.datepicker.setDefaults($.datepicker.regional['calendar']);
		
		$("#buddy_indate").datepicker();
		
	    $('#buddy_indate').datepicker("option", "onSelect", function ( selectedDate ) {
	    	$("#buddy_outdate").datepicker();
	    	$("#buddy_outdate").datepicker( "option", "minDate", selectedDate );
	    });
	    
	    messagePopupFunc();
	});
	
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
	
	//쪽지보내기 팝업
	function msgPopup(id){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			var popUrl = localurl+"msgSendPopupForm?id="+id;
			var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
				window.open(popUrl,"쪽지보내기",popOption);
		}else{
			alert("로그인이 필요한 서비스 입니다.");
		}
	}
	
	//동행 글 추가
	function insert_buddy(){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			window.location.href=localurl+'buddyInsert';
		}else{
			alert("로그인이 필요한 서비스 입니다.");
		}
	}
	
	//리스트 전체보기
	$("#list_all").click(function(){
		window.location.href=localurl+"buddyList";
	});
	
	//유효성체크
	function check(){
		if($('input:checkbox[name="kw_city"]').is(":checked")){
			return true;
		}else{
			alert("여행하려는 도시를 선택해주세요.");
			return false;
		}
	}
	//동행요청
	function apply_buddy(buddy_num){
		if('${mem_id}'!=null && '${mem_id}'!=""){
			var result = confirm('동행을 요청하시겠습니까?');
			if(result) {
				alert("신청되었습니다.");
				window.location.href=localurl+"buddyApplyBuddy?buddy_num="+buddy_num;
			}else{
				
			}
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