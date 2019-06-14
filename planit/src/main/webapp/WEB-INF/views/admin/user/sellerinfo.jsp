<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<style type="text/css">
	
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#sellerapproval").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url : $('#localurl').val()+"admin/user/sellerapproval",
			type : "post",
			data : {'mem_id':$("#mem_id1").val()},
			success : function(data) {
				if (data >0) {
					alert("승인성공!");
				} else {
					alert("승인실패!");
				}
			}
		});
	});
	$("#sellerreturn").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url : $('#localurl').val()+"admin/user/sellerreturn",
			type : "post",
			data : {'mem_id':$("#mem_id2").val()},
			success : function(data) {
				if (data >0) {
					alert("승인성공!");
				} else {
					alert("승인실패!");
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
					<table class="table table-hover ">
							<tr>
								<th scope="col">회사명</th>
								<td>${map.SELL_COMPANY }</td>
							</tr>
							<tr>
								<th scope="col">아이디</th>
								<td>${map.MEM_ID }</td>
							</tr>
							<tr>
								<th scope="col">주소</th>
								<td>
									우편번호 : ${map.SELL_POSTCODE }<br>
									주소 : ${map.SELL_ADDR }
								</td>
							</tr>
							<tr>
								<th scope="col">전화번호</th>
								<td>${map.SELL_TEL }</td>
							</tr>
							<tr>
								<th>승인</th>
								<td>
									<c:choose>
										<c:when test="${map.MEM_STAT<2 }">
											승인됨
										</c:when>
										<c:otherwise>
												<input type="hidden" id="localurl" value="<c:url value='/'/>">
											<form method="post" action="<c:url value='/admin/user/sellerapproval'/>" id="sellerapproval">
												<input type="hidden" id="mem_id1" name="mem_id1" value="${map.MEM_ID }">
												<input type="submit" value="승인">
											</form>
											<form method="post" action="<c:url value='/admin/user/sellerreturn'/>" id="sellerreturn">
												<input type="hidden" id="mem_id2" name="mem_id2" value="${map.MEM_ID }">
												<input type="submit" value="반려">
											</form>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
					</table>
					<div>
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/admin/user/sellerlist?info=list'">판매자회원목록</button>
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/admin/user/sellerlist?info=approval'">판매자승인대기목록</button>
					</div>
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