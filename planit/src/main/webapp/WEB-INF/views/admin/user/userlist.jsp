<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<style type="text/css">
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#field").click(function() {
			if($("#field").val()!='mem_gender'){
				$("#searchinput").html("<input class='form-control mr-sm-2' name='keyword' type='search' placeholder='검색' aria-label='Search'>");
				$("#searchsubmit").prop("disabled", false);
			}else{
				$("#searchinput").html("<label>남성<input class='form-control mr-sm-2' value='m' name='keyword' type='radio'></label><label>여성<input class='form-control mr-sm-2' value='w' name='keyword' type='radio'></label>");
				$("#searchsubmit").prop("disabled", true);
			}
		});
		$("#searchinput").on("click", "input:radio[name='keyword']", function(){
			$("#searchsubmit").prop("disabled", false);
		});
		$("#statchangeform").submit(function(event) {
			event.preventDefault();
			$.ajax({
				url : $('#localurl').val()+"admin/user/statchange",
				type : "post",
				data : {
					'mem_stat': $("#mem_changestat").val(),
					'mem_id':$("#mem_id1").val()
					},
				success : function(data) {
					if (data >0) {
						alert("변경성공!");
					} else {
						alert("변경실패!");
					}
				}
			});
		});
	});
</script>
<div>
<header>
</header>
<section>
	<article>
		<div class="container">
			<div class="row ">
				<div class="col mt-5 text-center">
					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link ${map.info == 'list' ? 'active': ''}" href="<c:url value='/admin/user/userlist?info=list'/>" class="ui-tabs-anchor">회원목록</a></li>
						<li class="nav-item"><a class="nav-link ${map.info == 'statuslist' ? 'active': ''}" href="<c:url value='/admin/user/userlist?info=statuslist'/>" class="ui-tabs-anchor">회원 정지/탈퇴목록</a></li>
					</ul>
					<table class="table table-hover ">
						<thead>
						<tr>
							<th scope="col">아이디</th><th scope="col">닉네임</th><th scope="col">이메일</th><th scope="col">성별</th><th scope="col">생년</th><th scope="col">회원상태</th><th scope="col">API</th><th scope="col">상태변경</th>
						</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${getList[0]!=null }">
								<c:forEach var="vo" items="${getList }">
									<tr>
										<td>${vo.mem_id }</td>
										<td>${vo.mem_nickname }</td>
										<td>${vo.mem_email }</td>
										<td><c:choose><c:when test="${vo.mem_gender=='m' }">남성</c:when><c:otherwise>여성</c:otherwise></c:choose></td>
										<td>${vo.mem_birthyear }</td>
										<td>
											<c:choose>
												<c:when test="${vo.mem_stat==-3 }">탈퇴</c:when>
												<c:when test="${vo.mem_stat==-2 }">정지</c:when>
												<c:when test="${vo.mem_stat==-1 }">비승인</c:when>
												<c:when test="${vo.mem_stat==0 }">관리자</c:when>
												<c:when test="${vo.mem_stat==1 }">판매자</c:when>
												<c:when test="${vo.mem_stat==2 }">일반</c:when>
												<c:otherwise>test</c:otherwise>
											</c:choose>
										</td>
										<td>${vo.mem_api }</td>
										<td>
											<form method="post" action="/admin/user/statchange" id="statchangeform">
												<input type="hidden" id="mem_id1" name="mem_id1" value="${vo.mem_id }">
												<input type="hidden" id="localurl" value="<c:url value='/'/>">
												<select <c:if test="${vo.mem_stat==-3 }">disabled="disabled"</c:if> id="mem_changestat" name="mem_changestat">
													<option value="2" <c:if test="${vo.mem_stat==2 }">selected="selected"</c:if>>일반</option>
													<option value="-2" <c:if test="${vo.mem_stat==-2 }">selected="selected"</c:if>>정지</option>
													<option value="-3" <c:if test="${vo.mem_stat==-3 }">selected="selected" disabled="disabled"</c:if>>탈퇴</option>
												</select>
												<input type="submit" value="변경" <c:if test="${vo.mem_stat==-3 }">disabled="disabled"</c:if>>
											</form>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td scope="row" colspan="8">해당 요청이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${map.startPageNum!=1 }">
								<li class="page-item"><a class="page-link" href="<c:url value='/admin/user/userlist?info=${map.info }&pageNum=${pu.startPageNum-1}&field=${param.field}&keyword=${param.keyword}'/>">◀</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNum }" end="${map.endPageNum }">
								<c:choose>
									<c:when test="${map.pageNum==i }">
										<li class="page-item active"><a class="page-link" href="<c:url value='/admin/user/userlist?info=list&pageNum=${i}&field=${param.field}&keyword=${param.keyword}'/>">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="<c:url value='/admin/user/userlist?info=list&pageNum=${i}&field=${param.field}&keyword=${param.keyword}'/>">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.totalPageCount!=pu.endPageNum }">
								<li class="page-item"><a class="page-link" href="<c:url value='/admin/user/userlist?info=${map.info }&pageNum=${pu.endPageNum+1}&field=${param.field}&keyword=${param.keyword}'/>">▶</a></li>
							</c:if>
						</ul>
					</div>
					<form id="form" class="form-inline d-flex justify-content-center" method="post" action="<c:url value='/admin/user/userlist'/>">
						<input type="hidden" name="${map.info }">
						<select id="field" name="field" class="custom-select">
							<option value="mem_id" <c:if test="${param.field=='mem_id' }">selected="selected"</c:if>>아이디</option>
							<option value="mem_nickname" <c:if test="${param.field=='mem_nickname' }">selected="selected"</c:if>>닉네임</option>
							<option value="mem_email" <c:if test="${param.field=='mem_email' }">selected="selected"</c:if>>이메일</option>
							<option value="mem_gender" <c:if test="${param.field=='mem_gender' }">selected="selected"</c:if>>성별</option>
						</select>
							<div id="searchinput">
								<c:choose>
									<c:when test="${param.field=='mem_gender' }">
										<label class='radio-inline'>남성<input class='form-control mr-sm-2' type='radio' name="keyword" value="m" <c:if test="${param.keyword == 'm' }">checked="checked"</c:if>></label>
										<label class='radio-inline'>여성<input class='form-control mr-sm-2' type='radio' name="keyword" value="f" <c:if test="${param.keyword == 'w' }">checked="checked"</c:if>></label>
									</c:when>
									<c:otherwise>
										<input class="form-control mr-sm-2" value="${param.keyword }" name="keyword" type="search" placeholder="검색" aria-label="Search">
									</c:otherwise>
								</c:choose>
							</div>
							<button class="btn btn-outline-primary my-2 my-sm-0" type="submit" id="searchsubmit">검색</button>
					</form>
				</div>
			</div>
		</div>
	</article>
	<!-- 모달 -->
	<input id="clickMe" type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세정보</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalSrc">
					
				</div>
			</div>
		</div>
	</div>
</section>
<footer>
</footer>
</div>